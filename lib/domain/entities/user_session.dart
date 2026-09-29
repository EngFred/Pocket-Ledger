import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_session.freezed.dart';
part 'user_session.g.dart';

@freezed
abstract class UserSession with _$UserSession {
  const factory UserSession({
    required int userId,
    required String username,
    required String email,
    required String accessToken,
  }) = _UserSession;

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);
}
