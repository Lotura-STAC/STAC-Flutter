import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stac_flutter/di/di.dart';
import 'package:stac_flutter/presentation/sign_in/ui/sign_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final blocs = await di();
  HttpOverrides.global = NoCheckCertificateHttpOverrides();
  runApp(MultiBlocProvider(providers: blocs, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInPage(),
      ),
    );
  }
}

class NoCheckCertificateHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
