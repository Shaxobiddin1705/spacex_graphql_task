import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:spacex_graphql_task/models/company_info_model.dart';

part 'company_information_event.dart';
part 'company_information_state.dart';

class CompanyInformationBloc extends Bloc<CompanyInformationEvent, CompanyInformationState> {
  CompanyInformationBloc() : super(CompanyInformationInitial()) {
    on<GetCompanyInfoEvent>((event, emit) async{
      await _getCompanyInformation(emit);
    });
  }

  Future<void> _getCompanyInformation(Emitter<CompanyInformationState> emit) async{
    await EasyLoading.show(status: 'Loading...');
    try{
      const String optionStr = ''' 
      query CompanyInformation {
        company {
          ceo, coo, employees, founder, test_sites, founded, name, summary,
          cto, cto_propulsion, headquarters {address, city, state},
          valuation, vehicles
        }
    }
    ''';
      final option = QueryOptions(document: gql(optionStr));
      final GraphQLClient client = GraphQLClient(
        cache: GraphQLCache(),
        link: HttpLink('https://spacex-production.up.railway.app/'),
      );
      final result = await client.query(option);
      log(result.data.toString());
      final companyInfo = Company.fromJson(result.data?['company'] ?? {});
      EasyLoading.dismiss();
      emit(SuccessGetCompanyInfoState(companyInfo: companyInfo));
    }catch (e) {
      EasyLoading.showError(e.toString());
      log(e.toString());
    }
  }
}
