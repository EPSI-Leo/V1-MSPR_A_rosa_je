import 'package:arosa_je/core/data/entities/advice/advice.dart';
import 'package:arosa_je/modules/advices/notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdvicesView extends ConsumerStatefulWidget {
  const AdvicesView({super.key});

  @override
  _AdvicesViewState createState() => _AdvicesViewState();
}

class _AdvicesViewState extends ConsumerState<AdvicesView> {
  final Map<String, bool> _expandedState = {};

  @override
  Widget build(BuildContext context) {
    final advicesList = ref.watch(getAdvicesProvider);

    return advicesList.when(
      data: (advices) {
        if (advices != null) {
          final _data = <Item>[];

          for (final advice in advices.advices!) {
            _data.add(Item(advice: advice));
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('My Plants'),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    final adviceId = _data[index].advice.id!;
                    setState(() {
                      _expandedState[adviceId] = isExpanded;
                    });
                  },
                  children: _data.map<ExpansionPanel>((Item item) {
                    return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(item.advice.name!),
                        );
                      },
                      body: ListTile(
                        title: Text(item.advice.advice1!),
                      ),
                      isExpanded: _expandedState[item.advice.id!] ?? false,
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        }
        return const Text('No advices found');
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
    required this.advice,
    this.isExpanded = false,
  });

  Advice advice;
  bool isExpanded;
}
