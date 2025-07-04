import 'package:flutter/material.dart';
import '../model/gate_entry_model.dart';

class GateEntryDetailScreen extends StatelessWidget {
  final GateEntry entry;

  const GateEntryDetailScreen({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    final imageUrl = (entry.vehicleImg != null && entry.vehicleImg!.isNotEmpty)
        ? 'https://aparnagmuat.easycloud.co.in/${entry.vehicleImg}'
        : null;

    print("$imageUrl");
    return Scaffold(
      appBar: AppBar(title: Text(entry.name ?? 'Gate Entry Details')),
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
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: (imageUrl != null && imageUrl.isNotEmpty)
                        ? NetworkImage(imageUrl)
                        : const AssetImage('assets/placeholder.png')
                              as ImageProvider,
                    backgroundColor: Colors.grey[300],
                  ),
                  const SizedBox(height: 20),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name: ${entry.name ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Status: ${entry.status ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Entry Type: ${entry.entryType ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Entry Time: ${entry.entryTime ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Customer Name: ${entry.customerName ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Supplier Name: ${entry.supplierName ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Driver Name: ${entry.driverName ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Driver Mobile: ${entry.drivermobileNo ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Vehicle Type: ${entry.vehicleType ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Vehicle Number: ${entry.vehicleNumber ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "PO Number: ${entry.poNumber ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Total Amount: ${entry.totalAmount?.toStringAsFixed(2) ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Doc Status: ${entry.docStatus?.toString() ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Expected Return: ${entry.expectedReturnDate ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Plant Name: ${entry.plantName ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Material Type: ${entry.materialType ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Creation Date: ${entry.creationDate ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Remarks: ${entry.remarks ?? '-'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
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
