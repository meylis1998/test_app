part of 'app_bloc.dart';

abstract class AppState {}

class InitialState extends AppState {}

class FcmTokenLoaded extends AppState {
  final String token;
  FcmTokenLoaded(this.token);
}
