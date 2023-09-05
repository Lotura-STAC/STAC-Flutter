import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stac_flutter/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final blocs = await di();
  runApp(MultiBlocProvider(providers: blocs, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
