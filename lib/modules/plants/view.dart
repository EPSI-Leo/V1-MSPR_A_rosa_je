import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPlants extends ConsumerStatefulWidget {
  const MyPlants({super.key});

  @override
  ConsumerState<MyPlants> createState() => _MyPlantsState();
}

class _MyPlantsState extends ConsumerState<MyPlants> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
