import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportations = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Development Mode'),
          subtitle: const Text('Additional Controls'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        ExpansionTile(
          title: const Text('Expansion'),
          subtitle: Text('$selectedTransportations'),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Travel by Car'),
              value: Transportation.car,
              groupValue: selectedTransportations,
              onChanged: (value) => setState(() {
                selectedTransportations = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Travel by Plane'),
              value: Transportation.plane,
              groupValue: selectedTransportations,
              onChanged: (value) => setState(() {
                selectedTransportations = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Travel by Boat'),
              value: Transportation.boat,
              groupValue: selectedTransportations,
              onChanged: (value) => setState(() {
                selectedTransportations = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Travel by Submarine'),
              value: Transportation.submarine,
              groupValue: selectedTransportations,
              onChanged: (value) => setState(() {
                selectedTransportations = Transportation.submarine;
              }),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('Desayuno?'),
          value: wantsBreakfast,
          onChanged: ((value) => setState(() {
                wantsBreakfast = !wantsBreakfast;
              })),
        ),
        CheckboxListTile(
          title: const Text('Almuerzo?'),
          value: wantsLunch,
          onChanged: ((value) => setState(() {
                wantsLunch = !wantsLunch;
              })),
        ),
        CheckboxListTile(
          title: const Text('Cena?'),
          value: wantsDinner,
          onChanged: ((value) => setState(() {
                wantsDinner = !wantsDinner;
              })),
        ),
      ],
    );
  }
}
