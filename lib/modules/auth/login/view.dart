import 'dart:io';

import 'package:arosa_je/core/core.dart';
import 'package:arosa_je/modules/app/session_manager.dart';
import 'package:arosa_je/modules/auth/login/model/auth_alert_message.dart';
import 'package:arosa_je/modules/auth/login/notifier.dart';
import 'package:arosa_je/router/router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _login = TextEditingController();

  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _login.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = ref.watch(appColorThemeProvider);
    final spacings = ref.watch(spacingThemeProvider);
    final radius = ref.watch(radiusThemeProvider);
    final coreL10n = context.coreL10n;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: spacings.small),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(image: AssetImage('lib/assets/images/icon.png')),
                  Text(
                    coreL10n.signinTitle1,
                    style: const TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const AppGap.xxl(),
                  Text(coreL10n.signinSentence1,
                      style: TextStyle(color: colors.textfieldlabel)),
                  const AppGap.xs(),
                  const AppGap.small(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacings.xs),
                    child: SizedBox(
                      width: double.infinity,
                      height: spacings.large,
                    ),
                  ),
                  Row(
                    // ignore: sort_child_properties_last
                    children: <Widget>[
                      Text(coreL10n.signinDontHaveAccount,
                          style: TextStyle(color: colors.textfieldlabel)),
                      TextButton(
                        child: Text(
                          coreL10n.signup,
                          style: const TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          context.goNamed(AppRoute.register.name);
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
