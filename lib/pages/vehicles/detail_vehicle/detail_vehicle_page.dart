import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacex_graphql_task/models/rockets_model.dart';
import 'package:spacex_graphql_task/models/ships_model.dart';

class DetailVehiclePage extends StatelessWidget {
  final Ship? ship;
  final Rocket? rocket;
  const DetailVehiclePage({Key? key, this.ship, this.rocket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A2E42),
      appBar: AppBar(
        backgroundColor: const Color(0xFF212640), centerTitle: true,
        title: Text(ship != null ? '${ship?.name}' : '${rocket?.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), border: Border.all(width: 2, color: const Color(0xFF353D4C))
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white)),

                  const SizedBox(height: 12),

                  _widget(title: ship != null ? 'Home port' : 'Maiden launch', content: ship != null ? '${ship?.homePort}' : '${rocket?.firstFlight}'),

                  const SizedBox(height: 12),

                  _widget(title: ship != null ? 'Build date' : 'Crew capacity', content: ship != null ? '${ship?.yearBuilt}' : 'No people'),

                  const SizedBox(height: 12),

                  rocket != null ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Active', style: TextStyle(fontSize: 16, color: Colors.white)),

                      Icon(rocket!.active ? CupertinoIcons.check_mark_circled : CupertinoIcons.clear_circled,
                        color: rocket!.active ? Colors.green : Colors.red)
                    ],
                  ) : const SizedBox.shrink(),

                  SizedBox(height: rocket != null ? 12 : 0),

                  const Divider(thickness: 2, height: 2, color: Color(0xFF353D4C)),

                  const SizedBox(height: 12),

                  ship != null ? _widget(title: 'Feature', content: '${ship?.type}') : const SizedBox.shrink(),

                  const SizedBox(height: 12),

                  ship != null ? _widget(title: 'Model', content: '${ship?.model}') : const SizedBox.shrink(),

                  rocket != null ? Text('${rocket?.description}',
                      style: const TextStyle(fontSize: 16, color: Color(0xFFF1F1F1), height: 1.3)) : const SizedBox.shrink(),

                ],
              ),
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), border: Border.all(width: 2, color: const Color(0xFF353D4C))
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text('Specifications', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white)),

                  const SizedBox(height: 12),

                  _widget(title: ship != null ? 'Primary role' : 'Launch payload',
                      content: ship != null ? '${ship?.roles.first}' : '${rocket?.mass.kg} kg'),

                  const SizedBox(height: 12),

                  _widget(title: ship != null ? 'Status' : 'Return payload',
                      content: ship != null ? '${ship?.status}' : '${rocket?.mass.kg} kg'),

                  SizedBox(height: rocket != null ? 12 : 0),

                  rocket != null ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Reusable', style: TextStyle(fontSize: 16, color: Colors.white)),

                      Icon(rocket!.firstStage.reusable ? CupertinoIcons.check_mark_circled : CupertinoIcons.clear_circled,
                          color: rocket!.active ? Colors.green : Colors.red)
                    ],
                  ) : const SizedBox.shrink(),

                  const SizedBox(height: 12),

                  const Divider(thickness: 2, height: 2, color: Color(0xFF353D4C)),

                  const SizedBox(height: 12),

                  _widget(title: ship != null ? 'Weight' : 'Height', content: ship != null ? '' : '${rocket?.height.meters} m'),

                  const SizedBox(height: 12),

                  _widget(title: ship != null ? 'Current speed' : 'Diameter', content: ship != null ? '' : '${rocket?.diameter.meters} m'),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _widget({required String title, required String content}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, mainAxisSize: MainAxisSize.max,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, color: Colors.white)),
        Text(content.isNotEmpty ? content : 'Unknown', style: const TextStyle(fontSize: 16, color: Color(0xFFF1F1F1))),
      ],
    );
  }

}
