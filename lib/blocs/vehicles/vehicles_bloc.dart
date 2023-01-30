import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_graphql_task/models/rockets_model.dart' as rocket;
import 'package:spacex_graphql_task/models/ships_model.dart' as ship;

part 'vehicles_event.dart';
part 'vehicles_state.dart';

class VehiclesBloc extends Bloc<VehiclesEvent, VehiclesState> {
  VehiclesBloc() : super(VehiclesInitial()) {
    on<GetVehiclesEvent>((event, emit) async{
      await _getVehicles(emit);
    });
  }

  Future<void> _getVehicles(Emitter<VehiclesState> emit) async{
    await EasyLoading.show(status: 'Loading...');
    try{
      const String optionVehicles = ''' 
      query Vehicles {
        rockets {
          name company country description first_flight success_rate_pct stages
          height {meters} diameter {meters} mass {kg}
          first_stage {thrust_sea_level {kN} fuel_amount_tons engines reusable}
          engines {
            thrust_to_weight thrust_sea_level {kN}
            thrust_vacuum {kN} engine_loss_max propellant_1 propellant_2 layout type}
            },
        ships {
          image home_port model name type year_built roles status weight_kg speed_kn
          missions {flight name}
        }
            }
      ''';

      final option = QueryOptions(document: gql(optionVehicles));
      final GraphQLClient client = GraphQLClient(
        cache: GraphQLCache(),
        link: HttpLink('https://spacex-production.up.railway.app/'),
      );
      final result = await client.query(option);
      log(result.data.toString());

      final rockets = rocket.Data.fromJson(result.data ?? {});
      final ships = ship.Data.fromJson(result.data ?? {});

      EasyLoading.dismiss();
      emit(SuccessGetVehiclesState(ships: ships.ships, rockets: rockets.rockets));
    }catch (e) {
      EasyLoading.showError(e.toString());
      log(e.toString());
    }
  }

}
