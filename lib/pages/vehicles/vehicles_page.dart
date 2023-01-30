import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_graphql_task/blocs/vehicles/vehicles_bloc.dart';
import 'package:spacex_graphql_task/pages/vehicles/detail_vehicle/detail_vehicle_page.dart';

class VehiclesPage extends StatefulWidget {
  static Widget view() => BlocProvider(create: (context) => VehiclesBloc(), child: const VehiclesPage());
  const VehiclesPage({Key? key}) : super(key: key);

  @override
  State<VehiclesPage> createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {
  late VehiclesBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<VehiclesBloc>();
    _bloc.add(const GetVehiclesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehiclesBloc, VehiclesState>(
      builder: (context, state) {
        if(state is SuccessGetVehiclesState) {
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
                      title: const Text('Vehicles'), centerTitle: true,
                      stretchModes: const <StretchMode>[StretchMode.zoomBackground, StretchMode.blurBackground],
                      background: Image.asset('assets/images/vehicles_image.jpg', fit: BoxFit.cover, width: double.infinity)),
                ),
              ),
            ],
            body: CustomScrollView(
              shrinkWrap: true, physics: const BouncingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.rockets.length + state.ships.length,
                    (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: index == 0 ? 80 : 0),
                        child: ListTile(
                          onTap: () {
                            if(index < state.ships.length) {
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailVehiclePage(ship: state.ships[index])));
                            } else{
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailVehiclePage(rocket: state.rockets[index - state.ships.length])));
                            }

                          },
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              width: 50, fit: BoxFit.cover, height: 40,
                              imageUrl: index < state.ships.length ? state.ships[index].image : 'https://spaceflight.com/wp-content/uploads/2020/07/SXRS-3-Sherpa-FX-PR-v101-1024x576.jpg',
                              progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                    child: CircularProgressIndicator(value: downloadProgress.progress, strokeWidth: 2)
                                  ),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          ),
                          trailing: const Icon(Icons.chevron_right, color: Colors.white),
                          title: Text(index < state.ships.length ? state.ships[index].name : state.rockets[index - state.ships.length ].name,
                              style: const TextStyle(color: Color(0xFFF1F1F1), fontSize: 18, fontWeight: FontWeight.w500)),
                          subtitle: Text(index < state.ships.length ? 'Ship build in ${state.ships[index].yearBuilt}' :
                          'First flight on ${state.rockets[index - state.ships.length].firstFlight}',
                              style: const TextStyle(color: Color(0xFFF1F1F1), fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
