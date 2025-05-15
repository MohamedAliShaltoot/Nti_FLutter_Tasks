import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_flutter_tasks/features/home_screen/cubit/user_cubit.dart';
import 'package:nti_flutter_tasks/features/home_screen/cubit/user_state.dart';
import 'package:nti_flutter_tasks/features/home_screen/view/home_no_task_view.dart';

import 'package:nti_flutter_tasks/features/home_screen/view/home_tasks_view.dart';

import '../../../core/cache/cache_data.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_keys.dart';

class TaskRouter extends StatelessWidget {
  const TaskRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // Handle any errors or specific states if needed
        if (state is TasksError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error loading tasks: ${state.error}')),
          );
        }
      },
      builder: (context, state) {
        if (state is TasksLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is TasksLoaded) {
          // Save tasks to cache
          final now = DateTime.now().millisecondsSinceEpoch;
          CacheHelper.saveData(key: CacheKeys.tasksData, value: state.tasks);
          CacheHelper.saveData(key: CacheKeys.lastTasksFetchTime, value: now);

          // Navigate based on tasks
          if (state.tasks.isEmpty) {
            return const HomeScreen(); // No task screen
          } else {
            return const HomeTaskContentScreen(); // With tasks screen
          }
        }

        // Initial loading state or other states
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
