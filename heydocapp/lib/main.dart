import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/presentation/login/login_screen.dart';
import 'package:heydocapp/presentation/register/register_screen_vm.dart';

import 'domain/usecase/httppost_patient_usecase.dart';
import 'domain/usecase/register_usecase.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

final registerScreenVMProvider =
    ChangeNotifierProvider<RegisterScreenVM>((ref) {
  return RegisterScreenVM(
    ref.read(registerUsecaseProvider),
    ref.read(scaffoldMessengerKeyProvider),
    ref.read(postPatientUseCaseProvider),
    ref.read(navigatorKeyProvider),
  );
});

final scaffoldMessengerKeyProvider =
    Provider((ref) => GlobalKey<ScaffoldMessengerState>());

final navigatorKeyProvider = Provider((ref) => GlobalKey<NavigatorState>());

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorKey = ref.watch(navigatorKeyProvider);
    final scaffoldMessengerKey = ref.watch(scaffoldMessengerKeyProvider);
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
