import '../model/gate_entry_model.dart';

abstract class GateEntryState {}

class GateEntryInitial extends GateEntryState {}

class GateEntryLoading extends GateEntryState {}

class GateEntryLoaded extends GateEntryState {
  final List<GateEntry> entries;
  GateEntryLoaded(this.entries);
}

class GateEntryError extends GateEntryState {
  final String message;
  GateEntryError(this.message);
}
