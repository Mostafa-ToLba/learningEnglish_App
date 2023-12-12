import 'package:flutter/material.dart';

class NetworkConnectWidget extends StatelessWidget {
  final bool isOffline;
  const NetworkConnectWidget({super.key, required this.isOffline});

  @override
  Widget build(BuildContext context) {
    return isOffline == true
        ? const Icon(
            Icons.wifi_off,
            color: Colors.red,
          )
        : const Icon(
            Icons.wifi,
            color: Colors.green,
          );
  }
}
