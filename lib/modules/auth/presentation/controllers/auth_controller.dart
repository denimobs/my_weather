import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  set state(AuthState value) => super.state = value;

  @override
  AuthState build() {
    return Unauthenticated();
  }
}

sealed class AuthState {
  T fold<T>({
    required T Function(Authenticated) authenticated,
    required T Function(Unauthenticated) unauthenticated,
  }) {
    return switch (this) {
      Authenticated authenticated_ => authenticated(authenticated_),
      Unauthenticated unauthenticated_ => unauthenticated(unauthenticated_),
    };
  }
}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}
