import 'package:criptomoedas/pages/home_page.dart';
import 'package:criptomoedas/pages/moedas_page.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

void main() {
  runApp(const CriptoCoin());
}

class CriptoCoin extends StatelessWidget {
  const CriptoCoin({super.key});

  @override
  Widget build(BuildContext context) {
    /* SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom
    ]);  */ //hide statusbar
    return MaterialApp(
      title: "CriptoCoins",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const HomePage(),
    );
  }
}