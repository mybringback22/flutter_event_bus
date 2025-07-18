import 'package:example/internet_connection_bloc/internet_connection_bloc.dart';
import 'package:example/no_internet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetConnectionBloc, InternetConnectionState>(
      builder: (context, state) {
        if (state is InternetDisconnectedState) {
          return NoInternetWidget();
        }

        return Text("Screen Two");
      },
    );
  }
}
