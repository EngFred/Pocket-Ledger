import '../../core/error/result.dart';
import '../entities/user_session.dart';
import '../repositories/auth_repository.dart';

class Login {
  final AuthRepository _repo;
  const Login(this._repo);

  Future<Result<UserSession>> call(String username, String password) =>
      _repo.authenticate(username, password);
}

class Logout {
  final AuthRepository _repo;
  const Logout(this._repo);

  Future<Result<void>> call() => _repo.clearSession();
}

class GetSavedSession {
  final AuthRepository _repo;
  const GetSavedSession(this._repo);

  Future<Result<UserSession?>> call() => _repo.readSession();
}
