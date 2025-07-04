import '../model/gate_entry_model.dart';

abstract class GateEntryRepo {
  Future<List<GateEntry>> fetchEntries(
    int start,
    int? docStatus,
    String? search,
  );
}
