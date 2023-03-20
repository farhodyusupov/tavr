import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tavr/providers/patient_info_provider.dart';
import 'package:tavr/widget/platform_scaffold.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<PatientInfoProvider>(
        create: (_) => PatientInfoProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAVR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(background: Colors.white),
          scaffoldBackgroundColor: Colors.white),
      home: HomePage(),
    );
  }
}
