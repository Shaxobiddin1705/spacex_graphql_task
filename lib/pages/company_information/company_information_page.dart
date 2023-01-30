import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_graphql_task/blocs/company_informations/company_information_bloc.dart';

class CompanyInformationPage extends StatefulWidget {
  static Widget view() => BlocProvider(create: (context) => CompanyInformationBloc(), child: const CompanyInformationPage());
  const CompanyInformationPage({Key? key}) : super(key: key);

  @override
  State<CompanyInformationPage> createState() => _CompanyInformationPageState();
}

class _CompanyInformationPageState extends State<CompanyInformationPage> {
  late CompanyInformationBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<CompanyInformationBloc>();
    _bloc.add(const GetCompanyInfoEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyInformationBloc, CompanyInformationState>(
      builder: (context, state) {
        if(state is SuccessGetCompanyInfoState) {
          return NestedScrollView(
              physics: const BouncingScrollPhysics(),
              floatHeaderSlivers: true,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    backgroundColor: const Color(0xFF212640),
                    expandedHeight: 200,
                    snap: true, floating: true, pinned: true,
                    forceElevated: innerBoxIsScrolled,
                    centerTitle: true,
                    flexibleSpace: FlexibleSpaceBar(
                        title: const Text('About SpaceX'), centerTitle: true,
                        stretchModes: const <StretchMode>[StretchMode.zoomBackground, StretchMode.blurBackground],
                        background: Image.asset('assets/images/spacex_image_header.jpg', fit: BoxFit.cover, width: double.infinity)),
                  ),
                ),
              ],
              body: CustomScrollView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(height: 100),
                        const Text('Space Exploration Technologies Corporation', textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, color: Color(0xFFF1F1F1), fontWeight: FontWeight.w500)),
                        const SizedBox(height: 4),
                        Text('Founded in ${state.companyInfo.founded} by ${state.companyInfo.founder}', textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14, color: Color(0xFFF1F1F1), fontWeight: FontWeight.w500)),
                        const SizedBox(height: 12),
                        _widget(title: "CEO", content: state.companyInfo.ceo),
                        const SizedBox(height: 8),
                        _widget(title: "CTO", content: state.companyInfo.cto),
                        const SizedBox(height: 8),
                        _widget(title: "COO", content: state.companyInfo.coo),
                        const SizedBox(height: 8),
                        _widget(title: "Valuation", content: '\$${state.companyInfo.valuation}'),
                        const SizedBox(height: 8),
                        _widget(title: "Location", content: '${state.companyInfo.headquarters.address} '
                            ', ${state.companyInfo.headquarters.city}'),
                        const SizedBox(height: 8),
                        _widget(title: "Valuation", content: '${state.companyInfo.employees}'),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(state.companyInfo.summary,
                              style: const TextStyle(fontSize: 14, color: Color(0xFFF1F1F1), fontWeight: FontWeight.w500, height: 1.2)),
                        )
                      ],
                    ),
                  )
                ],
              )
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _widget ({required String title, required String content}) {
    const TextStyle style = TextStyle(fontSize: 14, color: Color(0xFFF1F1F1), fontWeight: FontWeight.w500);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: style),
          Text(content, style: style),
        ],
      ),
    );
  }

}
