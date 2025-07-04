import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/gate_entry_repo.dart';
import '../model/gate_entry_model.dart';
import 'gate_entry_state.dart';

class GateEntryCubit extends Cubit<GateEntryState> {
  final GateEntryRepo repo;

  GateEntryCubit(this.repo) : super(GateEntryInitial());

  void fetchGateEntries() async {
    emit(GateEntryLoading());
    try {
    final entries = await repo.fetchEntries(0, 30, '');
    emit(GateEntryLoaded(entries));
    } catch (e) {
      emit(GateEntryError(e.toString()));
    }
  }
}
