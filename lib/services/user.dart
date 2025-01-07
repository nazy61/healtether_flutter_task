import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healtether_flutter_task/models/user.dart';

import '../utils/network.dart';
import '../views/home/user_state.dart';

/// User Service Provider
final userApiProvider = Provider<UserService>((ref) => UserService());

/// User Service
class UserService {
  /// Network instance
  Network network = NetworkImplementation();

  /// Get users
  Future<bool> getUsers({required WidgetRef ref}) async {
    try {
      var response = await network.get(
        'https://jsonplaceholder.typicode.com/users',
      );

      List<User> userList = [];

      /// Convert response to list of users
      response.forEach((user) {
        userList.add(User.fromJson(user));
      });

      /// Update the state
      ref.read(users.notifier).state = userList;
      ref.read(searchedUsers.notifier).state = userList;
      ref.read(error.notifier).state = null;
      ref.read(loadingUsers.notifier).state = false;

      /// Return true if successful
      return true;
    } catch (e) {
      /// Update the state
      ref.read(error.notifier).state = e.toString();
      ref.read(users.notifier).state = [];
      ref.read(searchedUsers.notifier).state = [];
      ref.read(loadingUsers.notifier).state = false;

      /// Return false if failed
      return false;
    }
  }
}
