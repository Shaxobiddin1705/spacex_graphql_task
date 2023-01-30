part of 'company_information_bloc.dart';

abstract class CompanyInformationEvent extends Equatable {
  const CompanyInformationEvent();
}

class GetCompanyInfoEvent extends CompanyInformationEvent{
  const GetCompanyInfoEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
