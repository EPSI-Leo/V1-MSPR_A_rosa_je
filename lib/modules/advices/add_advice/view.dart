import 'dart:io';

import 'package:arosa_je/core/api_client_exception.dart';
import 'package:arosa_je/core/core.dart';
import 'package:arosa_je/modules/advices/add_advice/notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddAdviceScreen extends ConsumerStatefulWidget {
  const AddAdviceScreen({super.key});

  @override
  AddAdviceScreenState createState() => AddAdviceScreenState();
}

class AddAdviceScreenState extends ConsumerState<AddAdviceScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController adviceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.watch(addAviceProvider);

    ref.listen(addAviceProvider, (_, next) {
      next.when(
        data: (isAuthenticated) {
          printDebug(isAuthenticated.toString());
          if (isAuthenticated) {
            context.pop();
            //ref.read(loginFormProvider.notifier).setLoading(false);
          }
        },
        error: (error, stackTrace) {
          printDebug(error.toString());
          if (error is ApiClientException) {
            if (error.code == HttpStatus.forbidden ||
                error.code == HttpStatus.badRequest ||
                error.code == HttpStatus.notFound) {
              /*ref.read(loginFormProvider.notifier).setConnectionMessageError(
                    AuthAlertMessage.invalidForm,
                  );*/
            }
          }
          //ref.read(loginFormProvider.notifier).setLoading(false);
        },
        loading: () {
          // ref.read(loginFormProvider.notifier).setLoading(true);
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Plant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Plant Name'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: adviceController,
              decoration: const InputDecoration(labelText: 'Care Advice'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    adviceController.text.isNotEmpty) {
                  ref
                      .read(addAviceProvider.notifier)
                      .addAvice(nameController.text, adviceController.text);
                } else {
                  // Show an error message or handle the case where input is incomplete
                }
              },
              child: const Text('Add Plant'),
            ),
          ],
        ),
      ),
    );
  }
}
