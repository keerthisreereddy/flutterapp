import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/gate_entry_model.dart';
import 'gate_entry_repo.dart';

class GateEntryRepoImpl implements GateEntryRepo {
  final String baseUrl =
      'https://aparnagmuat.easycloud.co.in/api/method/frappe.client.get_list';

  @override
  Future<List<GateEntry>> fetchEntries(
    int start,
    int? docStatus,
    String? search,
  ) async {
    List filters = [];
    if (docStatus != null) {
      filters.add(["docstatus", "=", docStatus]);
    }
    if (search != null && search.trim().isNotEmpty) {
      filters.add(["name", "like", "%$search%"]);
    }
    print("......");

    final Map<String, dynamic> queryParams = {
      'doctype': 'Gate Entry',
      'fields': jsonEncode(["*"]),
      'limit_start': start.toString(),
      'limit': '20',
      'order_by': 'creation desc',
      // if (filters.isNotEmpty) 'filters': jsonEncode(filters),
    };

    final uri = Uri.parse(baseUrl).replace(queryParameters: queryParams);
    print("$uri");
    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'token 67090b1a91b4708:f478ecdbe309243',
      },
    );
    print("${response.body}");

    print("${response.statusCode}");

    if (response.statusCode == 200) {
      print("object");
      final json = jsonDecode(response.body);
      final List<dynamic> data = json['message'];
      return data.map((e) => GateEntry.fromJson(e)).toList();
    } else {
      print("Error ${response.statusCode}: ${response.body}");
      throw Exception('Failed to fetch gate entries');
    }
  }
}
