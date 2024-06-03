

import 'package:flutter/material.dart';


enum ApiCallStatus { initial, loading, success, error }
class LoadingWidget extends StatelessWidget {
  final Widget child;
  final ApiCallStatus status;
  const LoadingWidget({super.key, required this.child, required this.status});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: status == ApiCallStatus.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : child,
    );
  }
} 