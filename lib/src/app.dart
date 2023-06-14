import 'package:ex_screen_efax/src/features/efax/presentation/efax_screen.dart';
import 'package:ex_screen_efax/src/localization/string_hardcoded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: const EfaxScreen(),
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      onGenerateTitle: (BuildContext context) =>
          'Riverpod Achitecture Template'.hardcoded,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'PaulGrotesk',
        textTheme: const TextTheme(),
      ),
    );
  }
}
