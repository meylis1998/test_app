import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'FCM Token',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
        ),
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state is InitialState) {
            context.read<AppBloc>().add(FetchFcmToken());
            return const Center(child: CircularProgressIndicator());
          } else if (state is FcmTokenLoaded) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'FCM Token : ${state.token}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 15,
                    ),
              ),
            );
          } else {
            return Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  context.read<AppBloc>().add(FetchFcmToken());
                },
                label: const Text('Try again'),
                icon: const Icon(Icons.refresh),
              ),
            );
          }
        },
      ),
    );
  }
}
