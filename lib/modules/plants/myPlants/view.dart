import 'package:arosa_je/core/data/entities/plant/plant.dart';
import 'package:arosa_je/modules/plants/myPlants/notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPlants extends ConsumerStatefulWidget {
  const MyPlants({super.key});

  @override
  _MyPlantsState createState() => _MyPlantsState();
}

class _MyPlantsState extends ConsumerState<MyPlants> {
  final Map<String, bool> _expandedState = {};

  @override
  Widget build(BuildContext context) {
    final plantsList = ref.watch(myPlantsProvider);

    return plantsList.when(
      data: (plants) {
        if (plants != null) {
          final data = <Item>[];

          for (final plant in plants.plants!) {
            data.add(Item(plant: plant));
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('My Plants'),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    final plantId = data[index].plant.id!;
                    setState(() {
                      _expandedState[plantId] = isExpanded;
                    });
                  },
                  children: data.map<ExpansionPanel>((Item item) {
                    return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(item.plant.name!),
                        );
                      },
                      body: ListTile(
                        title: Text(item.plant.description!),
                      ),
                      isExpanded: _expandedState[item.plant.id!] ?? false,
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        }
        return const Text('No plants found');
      },
      loading: () => const Center(
        child: CircularProgressIndicator(color: Colors.black),
      ),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}

class Item {
  Item({
    required this.plant,
    this.isExpanded = false,
  });

  Plant plant;
  bool isExpanded;
}
