import 'package:flutter/material.dart';
import 'package:gate_exit/feature/gateExit/model/gate_exit_model.dart';

class GateExitDetailScreen extends StatelessWidget {
  final GateExit exit;

  const GateExitDetailScreen({super.key, required this.exit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exit.name ?? 'Gate Entry Details')),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Card(
          elevation: 50,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 70),
                  const SizedBox(height: 20),

                  Text(
                    "Name: ${exit.name ?? '-'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Status: ${exit.status ?? '-'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Exit Type: ${exit.exitType ?? '-'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Exit Time: ${exit.exitTime ?? '-'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Customer Name: ${exit.customerReceiverName ?? '-'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Supplier Name: ${exit.senderEmployeeName ?? '-'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Driver Name: ${exit.driverName ?? '-'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Driver Mobile: ${exit.driverMobileNumber ?? '-'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Vehicle Type: ${exit.vehicleType ?? '-'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Vehicle Number: ${exit.vehicleNumber ?? '-'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "PO Number: ${exit.poNumber ?? '-'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Total Amount: ${exit.totalAmount?.toStringAsFixed(2) ?? '-'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Doc Status: ${exit.docstatus?.toString() ?? '-'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Expected Return: ${exit.expectedReturnDate ?? '-'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Plant Name: ${exit.plantName ?? '-'}",
                    style: const TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 8),
                  Text(
                    "Creation Date: ${exit.creation ?? '-'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Remarks: ${exit.remarks ?? '-'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
