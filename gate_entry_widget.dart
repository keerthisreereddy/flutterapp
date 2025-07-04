import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gate_exit/feature/gateEntry/ui/gate_entry_details.dart';
import '../cubit/gate_entry_cubit.dart';
import '../cubit/gate_entry_state.dart';

class GateEntryWidget extends StatelessWidget {
  const GateEntryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8FF), // Light background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Gate Entry',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: 'Search Gate-Entry ID',
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

            // List of Entries
            Expanded(
              child: BlocBuilder<GateEntryCubit, GateEntryState>(
                builder: (context, state) {
                  if (state is GateEntryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GateEntryLoaded) {
                    if (state.entries.isEmpty) {
                      return const Center(child: Text('No entries found'));
                    }

                    return ListView.builder(
                      itemCount: state.entries.length,
                      itemBuilder: (context, index) {
                        final entry = state.entries[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.amber, width: 1.5),
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            entry.name ?? '-',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            entry.entryTime ?? '-',
                                            style: const TextStyle(
                                              fontSize: 14,
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
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  GateEntryDetailScreen(
                                                    entry: entry,
                                                  ),
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
                                  const SizedBox(height: 30),
                                ],
                              ),

                              if (entry.docStatus == 1)
                                const Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      'Submitted',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (state is GateEntryError) {
                    return Center(child: Text(state.message));
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
          context.read<GateEntryCubit>().fetchGateEntries();
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
