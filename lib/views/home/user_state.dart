import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/user.dart';

/// State providers for users
final users = StateProvider<List<User>>((ref) => []);
final searchedUsers = StateProvider<List<User>>((ref) => []);
final loadingUsers = StateProvider<bool>((ref) => true);
final error = StateProvider<String?>((ref) => null);
