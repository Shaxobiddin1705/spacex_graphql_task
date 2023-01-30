part of 'vehicles_bloc.dart';

abstract class VehiclesEvent extends Equatable {
  const VehiclesEvent();
}

class GetVehiclesEvent extends VehiclesEvent{
  const GetVehiclesEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
