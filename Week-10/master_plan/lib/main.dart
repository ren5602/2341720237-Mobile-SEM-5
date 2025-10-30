import 'package:flutter/material.dart';
import 'package:master_plan/provider/plan_provider.dart';
import 'package:master_plan/views/plan_creator_screen.dart';
// import '/views/plan_screen.dart';
import 'models/data_layer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     theme: ThemeData(primarySwatch: Colors.purple),
  //     home: PlanProvider(
  //       notifier: ValueNotifier<Plan>(const Plan()),
  //       child: const PlanScreen(),
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>(const []),
      child: MaterialApp(
        title: 'State management app',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const PlanCreatorScreen(),
      ),
    );
  }
}
