import '../../core/error/result.dart';
import '../entities/user_session.dart';

abstract interface class AuthRepository {
  Future<Result<UserSession>> authenticate(String username, String password);
  Future<Result<UserSession?>> readSession();
  Future<Result<void>> clearSession();
}
