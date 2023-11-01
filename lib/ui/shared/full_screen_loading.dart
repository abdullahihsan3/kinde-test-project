import 'package:flutter/material.dart';

import 'app_loading.dart';

class FullScreenLoading extends StatelessWidget {
  const FullScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const Center(
          child: AppLoading(),
        ),
      ),
    );
  }
}
