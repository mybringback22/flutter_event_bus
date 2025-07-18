import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity, height: double.infinity, child: Center(child: Text("No Internet")));
  }
}
