import 'dart:convert';

import 'package:gate_exit/feature/gateExit/data/gate_exit_repo.dart';
import 'package:gate_exit/feature/gateExit/model/gate_exit_model.dart';
import 'package:http/http.dart' as http;

class GateExitRepoimpl implements GateExitRepo{
  final String baseUrl="https://aparnagmuat.easycloud.co.in/api/method/frappe.client.get_list";

  @override
  Future<List<GateExit>> fetchExits(int start, int? docStatus, String? serach) async{
    List filters=[];
    if(docStatus !=null){
      filters.add(["docstatus","=",docStatus]);
    }
    if(serach !=null && serach.trim().isEmpty){
      filters.add(["name","like","%$serach"]);
    }
    print(".....");
    final Map<String, dynamic> queryParams = {
      'doctype': 'Gate Exit',
      'fields': jsonEncode(["*"]),
      'limit_start': start.toString(),
      'limit': '20',
      'order_by': 'name DESC',
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
      return data.map((e) => GateExit.fromJson(e)).toList();
    } else {
      print("Error ${response.statusCode}: ${response.body}");
      throw Exception('Failed to fetch gate entries');
    }
  }
}