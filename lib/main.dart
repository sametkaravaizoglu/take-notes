import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/bindings/home_binding.dart';
import 'package:note_app/app/ui/pages/home_page/home_page.dart';
import 'package:note_app/core/init/network/network_manager.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NetworkManager.instance.initNetworkManager();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      navigatorKey: Get.key,
      logWriterCallback: localLogWriter,
      title: "Take Note!",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: Get.defaultTransitionDuration,
    );
  }

  void localLogWriter(String text, {bool? isError}) {
    if (kDebugMode) {
      debugPrint(text);
    }
  }
}
