import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gate_exit/feature/gateExit/ui/gate_exit_detailscrn.dart';
import '../cubit/gate_exit_cubit.dart';
import '../cubit/gate_exit_state.dart';

class GateExitScreen extends StatelessWidget {
  const GateExitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Gate Exit',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: 'Search Gate-Exit ID',
            //     filled: true,
            //     fillColor: Colors.white,
            //     prefixIcon: const Icon(Icons.search),
            //     suffixIcon: const Icon(Icons.close),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(12),
            //       borderSide: BorderSide.none,
            //     ),
            //   ),
            // ),
            const SizedBox(height: 12),

            Expanded(
              child: BlocBuilder<GateExitCubit, GateExitState>(
                builder: (context, state) {
                  if (state is GateExitLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GateExitSuccess) {
                    if (state.exists.isEmpty) {
                      return const Center(child: Text('No exits found'));
                    }

                    return ListView.builder(
                      itemCount: state.exists.length,
                      itemBuilder: (context, index) {
                        final exit = state.exists[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 168, 99, 161),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    exit.name ?? '-',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    exit.exitTime ?? '-',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  if (exit.docstatus == 1)
                                    const Padding(
                                      padding: EdgeInsets.only(top: 6),
                                      child: Text(
                                        'Submitted',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                ],
                              ),

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    5,
                                    6,
                                    6,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          GateExitDetailScreen(exit: exit),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'View',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (state is GateExitError) {
                    return Center(child: Text(state.error));
                  }
                  return const Center(
                    child: Text('Press refresh to load data'),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<GateExitCubit>().fetchGateExits();
        },
        backgroundColor: const Color.fromARGB(255, 167, 107, 171),
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
