import 'package:cats_app/core/utils/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'injection_container.dart'as di;

Future<void> main()async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child:  MaterialApp(
        onGenerateRoute: AppRouter.routeGenerator,
      ),
    );
  }
}
