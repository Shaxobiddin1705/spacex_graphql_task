part of 'vehicles_bloc.dart';

abstract class VehiclesState extends Equatable {
  const VehiclesState();
}

class VehiclesInitial extends VehiclesState {
  @override
  List<Object> get props => [];
}

class SuccessGetVehiclesState extends VehiclesState{
  final List<ship.Ship> ships;
  final List<rocket.Rocket> rockets;
  const SuccessGetVehiclesState({required this.ships, required this.rockets});
  @override
  // TODO: implement props
  List<Object?> get props => [rockets, ships];
}
