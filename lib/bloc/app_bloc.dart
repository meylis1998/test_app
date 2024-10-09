import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  AppBloc() : super(InitialState()) {
    on<FetchFcmToken>(_fetchFcmToken);
  }

  void _fetchFcmToken(FetchFcmToken event, Emitter<AppState> emit) async {
    emit(InitialState());
    try {
      final token = await _firebaseMessaging.getToken();
      emit(FcmTokenLoaded(token ?? ''));
      print(token);
    } catch (e) {
      emit(FcmTokenError());
    }
  }
}
