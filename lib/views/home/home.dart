import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healtether_flutter_task/views/home/user_state.dart';
import 'package:healtether_flutter_task/widgets/search_field.dart';
import 'package:healtether_flutter_task/widgets/user_card.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../services/user.dart';

/// Home Screen
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    /// Get users
    ref.read(userApiProvider).getUsers(ref: ref);
    super.initState();
  }

  /// Search users
  void _onSearch(String value) {
    /// If search field is empty, show all users
    if (value.isEmpty) {
      ref.read(searchedUsers.notifier).state = ref.read(users);
    } else {
      /// Filter users based on search query
      ref.read(searchedUsers.notifier).state = ref.read(users).where((user) {
        return user.name!.toLowerCase().contains(value.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Users",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  /// Build body based on state
  Widget _buildBody() {
    /// Show loading widget if loading
    return ref.watch(loadingUsers)
        ? _buildLoading()

        /// Show error if error
        : ref.read(error) != null
            ? _buildError()

            /// Show empty list if no users found
            : ref.read(users).isEmpty
                ? _buildEmptyList()

                /// Show users if users found
                : _buildUsers();
  }

  /// Build loading widget
  Widget _buildLoading() {
    return Center(
      child: LoadingAnimationWidget.inkDrop(
        color: const Color(0xfffcf0d6),
        size: 14.0,
      ),
    );
  }

  /// Build error widget
  Widget _buildError() {
    return Center(
      child: Text(
        ref.watch(error) ?? "An error occurred",
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// Build empty list widget
  Widget _buildEmptyList() {
    return Center(
      child: Text(
        "No users found",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// Build users widget
  Widget _buildUsers() {
    return Column(
      children: [
        /// Search field
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SearchField(onChange: _onSearch),
        ),

        /// Space
        const SizedBox(height: 10),

        /// Users list
        Expanded(
          /// Pull to refresh
          child: RefreshIndicator(
            onRefresh: () async {
              await ref.read(userApiProvider).getUsers(ref: ref);
            },

            /// Users list
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: ref.watch(searchedUsers).length,
              itemBuilder: (context, index) => UserCard(
                name: ref.read(searchedUsers)[index].name ?? "",
                email: ref.read(searchedUsers)[index].email ?? "",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
