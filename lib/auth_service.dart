import 'package:your_project_name/database_helper.dart';

class AuthService {
  final DatabaseHelper dbHelper = DatabaseHelper();

  Future<bool> register(String username, String password) async {
    Map<String, dynamic>? user = await dbHelper.getUser(username);

    if (user == null) {
      await dbHelper.saveUser(username, password);
      return true; // Успешная регистрация
    } else {
      return false; // Пользователь уже существует
    }
  }

  Future<bool> login(String username, String password) async {
    Map<String, dynamic>? user = await dbHelper.getUser(username);

    if (user != null && user['password'] == password) {
      return true; // Успешный вход
    } else {
      return false; // Неверное имя пользователя или пароль
    }
  }
}