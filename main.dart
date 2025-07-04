import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gate_exit/feature/app/appWidget.dart';
import 'package:gate_exit/feature/gateEntry/cubit/gate_entry_cubit.dart';
import 'package:gate_exit/feature/gateEntry/data/gate_entry_repo_impl.dart';
import 'package:gate_exit/feature/gateExit/cubit/gate_exit_cubit.dart';
import 'package:gate_exit/feature/gateExit/data/gate_exit_repoimpl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GateEntryCubit(GateEntryRepoImpl())),
        BlocProvider(create: (_) => GateExitCubit(GateExitRepoimpl())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
