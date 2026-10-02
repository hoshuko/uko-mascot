// pubspec.yaml : dependencies: rive: ^0.13.0   — assets: [assets/uko.riv]
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Uko extends StatefulWidget {
  const Uko({super.key});
  @override
  State<Uko> createState() => _UkoState();
}

class _UkoState extends State<Uko> {
  SMINumber? _state;   // 0 idle · 2 loading (Starter)
  SMITrigger? _success;

  void _onInit(Artboard artboard) {
    final c = StateMachineController.fromArtboard(artboard, 'Uko')!;
    artboard.addController(c);
    _state = c.findInput<double>('state') as SMINumber;
    _success = c.findInput<bool>('success') as SMITrigger;
  }

  void startLoading() => _state?.value = 2;
  void done() { _state?.value = 0; _success?.fire(); }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 240, height: 360,
        child: RiveAnimation.asset('assets/uko.riv', stateMachines: const ['Uko'], onInit: _onInit),
      );
}
