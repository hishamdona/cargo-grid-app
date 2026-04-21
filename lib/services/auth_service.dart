import '../models/user_model.dart';
import 'mock_data_service.dart';

class AuthService {
  Future<UserModel> login(String email, String password) async {
    try {
      return await MockDataService.login(email, password);
    } catch (e) {
      throw Exception('Failed to login. Please try again.');
    }
  }

  Future<UserModel> register(
    String name,
    String email,
    String phone,
    String password,
    String role,
  ) async {
    try {
      return await MockDataService.register(name, email, phone, password, role);
    } catch (e) {
      throw Exception('Failed to register. Please try again.');
    }
  }
}
