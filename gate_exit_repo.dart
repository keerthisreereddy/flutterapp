import 'package:gate_exit/feature/gateExit/model/gate_exit_model.dart';

abstract class GateExitRepo {
   Future<List<GateExit>> fetchExits(
    int start,
    int? docStatus,
    String? serach,
   );
}