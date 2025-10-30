import '../models/data_layer.dart';
import 'package:flutter/material.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  // const PlanScreen({super.key});
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  // Plan plan = const Plan();
  // PlanProvider planProvider = PlanProvider(
  //   notifier: ValueNotifier<Plan>(const Plan()),
  //   child: const PlanScreen(),
  // );
  late ScrollController scrollController;
  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);
    if (!plansNotifier.value.any((p) => p.name == plan.name)) {
      plansNotifier.value = List<Plan>.from(plansNotifier.value)..add(plan);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(plan.name),
        titleTextStyle: const TextStyle(color: Colors.white),
        backgroundColor: Colors.purple,
      ),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: PlanProvider.of(context),
        builder: (context, plans, child) {
          Plan currentPlan = plans.firstWhere(
            (p) => p.name == plan.name,
            orElse: () => plan,
          );

          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  // prak 1
  // Widget _buildAddTaskButton() {
  //   return FloatingActionButton(
  //     shape: const CircleBorder(),
  //     backgroundColor: Colors.purple,
  //     child: const Icon(Icons.add, color: Colors.white),
  //     onPressed: () {
  //       setState(() {
  //         plan = Plan(
  //           name: plan.name,
  //           tasks: List<Task>.from(plan.tasks)..add(const Task()),
  //         );
  //       });
  //     },
  //   );
  // }
  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = plan;
        int planIndex = planNotifier.value.indexWhere(
          (p) => p.name == currentPlan.name,
        );

        List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
          ..add(const Task());

        if (planIndex == -1) {
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..add(Plan(name: currentPlan.name, tasks: updatedTasks));
        } else if (planIndex < planNotifier.value.length) {
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(name: currentPlan.name, tasks: updatedTasks);
        }
      },
    );
  }

  // prak 1
  // Widget _buildList() {
  //   return ListView.builder(
  //     controller: scrollController,
  //     keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
  //         ? ScrollViewKeyboardDismissBehavior.onDrag
  //         : ScrollViewKeyboardDismissBehavior.manual,
  //     itemCount: plan.tasks.length,
  //     itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index], index),
  //   );
  // }

  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan, plan.tasks[index], index, context),
    );
  }

  // prak 1
  // Widget _buildTaskTile(Task task, int index) {
  //   return ListTile(
  //     leading: Checkbox(
  //       value: task.complete,
  //       onChanged: (selected) {
  //         setState(() {
  //           plan = Plan(
  //             name: plan.name,
  //             tasks: List<Task>.from(plan.tasks)
  //               ..[index] = Task(
  //                 description: task.description,
  //                 complete: selected ?? false,
  //               ),
  //           );
  //         });
  //       },
  //     ),
  //     title: TextFormField(
  //       initialValue: task.description,
  //       onChanged: (text) {
  //         setState(() {
  //           plan = Plan(
  //             name: plan.name,
  //             tasks: List<Task>.from(plan.tasks)
  //               ..[index] = Task(description: text, complete: task.complete),
  //           );
  //         });
  //       },
  //     ),
  //   );
  // }
  Widget _buildTaskTile(
    Plan currentPlan,
    Task task,
    int index,
    BuildContext context,
  ) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          int planIndex = planNotifier.value.indexWhere(
            (p) => p.name == currentPlan.name,
          );
          if (planIndex == -1 || planIndex >= planNotifier.value.length) return;

          List<Task> updatedTasks = List<Task>.from(currentPlan.tasks);
          if (index < 0 || index >= updatedTasks.length) return;

          updatedTasks[index] = Task(
            description: task.description,
            complete: selected ?? false,
          );

          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(name: currentPlan.name, tasks: updatedTasks);
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          int planIndex = planNotifier.value.indexWhere(
            (p) => p.name == currentPlan.name,
          );
          if (planIndex == -1 || planIndex >= planNotifier.value.length) return;

          List<Task> updatedTasks = List<Task>.from(currentPlan.tasks);
          if (index < 0 || index >= updatedTasks.length) return;

          updatedTasks[index] = Task(
            description: text,
            complete: task.complete,
          );
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(name: currentPlan.name, tasks: updatedTasks);
        },
      ),
    );
  }
}
