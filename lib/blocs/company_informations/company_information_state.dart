part of 'company_information_bloc.dart';

abstract class CompanyInformationState extends Equatable {
  const CompanyInformationState();
}

class CompanyInformationInitial extends CompanyInformationState {
  @override
  List<Object> get props => [];
}

class SuccessGetCompanyInfoState extends CompanyInformationState{
  final Company companyInfo;
  const SuccessGetCompanyInfoState({required this.companyInfo});
  @override
  // TODO: implement props
  List<Object?> get props => [companyInfo];
}
