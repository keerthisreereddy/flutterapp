import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gate_exit/feature/gateExit/cubit/gate_exit_state.dart';
import 'package:gate_exit/feature/gateExit/data/gate_exit_repo.dart';

class GateExitCubit  extends Cubit<GateExitState>{
  final GateExitRepo repo;
  GateExitCubit(this.repo):super(GateExitInitial());

  void fetchGateExits() async{
    emit(GateExitLoading());
    try{
      final exists=await repo.fetchExits(0, 20, '');
      emit(GateExitSuccess(exists));
    }catch(e){
      emit(GateExitError(e.toString()));
    }
  }
}