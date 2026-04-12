import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserModel?> signIn(String email, String password) async {
    // Stub implementation
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      id: '123',
      name: 'Test User',
      email: email,
      role: 'student',
      phone: '1234567890',
    );
  }

  @override
  Future<UserModel?> signUp(String email, String password, String name, String role, String phone) async {
     // Stub implementation
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      id: '123',
      name: name,
      email: email,
      role: role,
      phone: phone,
    );
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    // Stub
    return null;
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> forgotPassword(String email) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
