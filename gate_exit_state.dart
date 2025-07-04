import 'package:gate_exit/feature/gateExit/model/gate_exit_model.dart';

abstract class GateExitState {}
class GateExitInitial extends GateExitState{}
class GateExitLoading extends GateExitState{}

class GateExitSuccess extends GateExitState{
  final List<GateExit> exists;
  GateExitSuccess(this.exists);
}

class GateExitError extends GateExitState{
      final String error;
      GateExitError(this.error);
}