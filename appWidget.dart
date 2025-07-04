import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gate_exit/feature/gateEntry/cubit/gate_entry_cubit.dart';
import 'package:gate_exit/feature/gateEntry/ui/gate_entry_widget.dart';
import 'package:gate_exit/feature/gateExit/cubit/gate_exit_cubit.dart';
import 'package:gate_exit/feature/gateExit/ui/gate_exit_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F9FF),
      appBar: AppBar(
        title: const Text("HOME"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE0CFFF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Good Morning,",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text("Ready to capture some entries & exits?"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    'assets/welcome.png',
                    height: 60,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                children: [
                  _buildMenuButton(
                    context: context,
                    title: "Gate Entry",
                    color: Colors.yellow[700]!,
                    imagePath: "assets/vehicle_entry.png",
                    onTap: () {
                      context.read<GateEntryCubit>().fetchGateEntries();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const GateEntryWidget()),
                      );
                    },
                  ),
                  _buildMenuButton(
                    context: context,
                    title: "Gate Exit",
                    color: Colors.purple[200]!,
                    imagePath: "assets/vehicle_exit.png",
                    onTap: () {
                      context.read<GateExitCubit>().fetchGateExits();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const GateExitScreen()),
                      );
                    },
                  ),
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required BuildContext context,
    required String title,
    required Color color,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 60),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
