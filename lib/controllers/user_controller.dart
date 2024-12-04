// import '../models/user.dart';
// import '../services/local_storage_service.dart';

// class UserController {
//   final LocalStorageService _localStorageService = LocalStorageService();

//   Future<void> addUser(String name, String email, String phoneNumber,
//       String password, bool notificationsEnabled) async {
//     User user = User(
//       name: name,
//       email: email,
//       phoneNumber: phoneNumber,
//       password: password,
//       notificationsEnabled: notificationsEnabled,
//     );
//     await _localStorageService.insertUser(user.toMap());
//   }

//   Future<List<User>> getUsers() async {
//     List<Map<String, dynamic>> usersMap = await _localStorageService.getUsers();
//     return usersMap.map((map) => User.fromMap(map)).toList();
//   }

//   Future<void> updateUser(User updatedUser) async {
//     await _localStorageService.updateUser(updatedUser.toMap());
//   }

//   Future<void> deleteUser(int userId) async {
//     await _localStorageService.deleteUser(userId);
//   }
// }
