import 'dart:io';

import 'package:ads_mobile_app/features/home/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../shared_widgets/app_icon.dart';
import '../sign_in/sign_in_page.dart';
import '../sign_in/widgets/custom_divider.dart';
import '../sign_in/widgets/login_via_social_network.dart';
import 'logic/sign_up_cubit.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpCubit(),
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                  (Route<dynamic> route) => false);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Gap(58),
                      Text(
                        AppLocalizations.of(context)!.signUp,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Gap(12),
                      Text(
                        AppLocalizations.of(context)!.registrationDescription,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Gap(32),
                      BlocBuilder<SignUpCubit, SignUpState>(
                        builder: (context, state) {
                          return TextFormField(
                            controller: emailController,
                            validator: (input) {
                              if (input == null || input.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .requiredField;
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Email',
                              errorBorder: state.error == 'invalid-email' ||
                                      state.error == 'email-already-in-use'
                                  ? OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                    )
                                  : null,
                              errorText: state.error == 'invalid-email' ||
                                      state.error == 'email-already-in-use'
                                  ? state.error
                                  : null,
                            ),
                          );
                        },
                      ),
                      const Gap(12),
                      BlocBuilder<SignUpCubit, SignUpState>(
                        builder: (context, state) {
                          return TextFormField(
                            validator: (input) {
                              if (input == null || input.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .requiredField;
                              }

                              if (input.length < 6) {
                                return AppLocalizations.of(context)!
                                    .mustBeMoreThan6Character;
                              }

                              return null;
                            },
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              errorBorder: state.error == 'weak-password'
                                  ? OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                    )
                                  : null,
                              errorText: state.error == 'weak-password'
                                  ? 'Wrong password provided for that user.'
                                  : null,
                            ),
                          );
                        },
                      ),
                      const Gap(12),
                      BlocBuilder<SignUpCubit, SignUpState>(
                        builder: (context, state) {
                          return TextFormField(
                            validator: (input) {
                              if (input == null || input.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .requiredField;
                              }

                              if (passwordController.text !=
                                  confirmPasswordController.text) {
                                return AppLocalizations.of(context)!
                                    .passwordWrong;
                              }

                              return null;
                            },
                            controller: confirmPasswordController,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              errorBorder: state.error == 'weak-password'
                                  ? OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                    )
                                  : null,
                              errorText: state.error == 'weak-password'
                                  ? 'Wrong password provided for that user.'
                                  : null,
                            ),
                          );
                        },
                      ),
                      const Gap(32),
                      BlocBuilder<SignUpCubit, SignUpState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: state.status.isLoading
                                    ? Colors.transparent
                                    : null),
                            onPressed: () {
                              final isValid = formKey.currentState!.validate();
                              if (!isValid) return;
                              context.read<SignUpCubit>().signUp(
                                  emailController.text,
                                  passwordController.text);
                            },
                            child: state.status.isLoading
                                ? const CircularProgressIndicator.adaptive()
                                : Text(AppLocalizations.of(context)!.signUp),
                          );
                        },
                      ),
                      const Gap(32),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomDivider(),
                          Text(
                            AppLocalizations.of(context)!.orSignUpWith,
                            style: const TextStyle(color: Colors.black),
                          ),
                          const CustomDivider(),
                        ],
                      ),
                      const Gap(32),
                      FittedBox(
                        child: Row(
                          children: [
                            CustomLoginViaSocialNetworkWidget(
                              onTap: () {},
                              title: AppLocalizations.of(context)!.google,
                              icon: AppIcons.google_logo,
                            ),
                            if (Platform.isIOS) ...[
                              const Gap(8),
                              CustomLoginViaSocialNetworkWidget(
                                onTap: () {},
                                title: AppLocalizations.of(context)!.appleId,
                                icon: AppIcons.apple_logo,
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {},
                        // context.read<SignUpCubit>().signInAnonymously(),
                        child: Text(
                            AppLocalizations.of(context)!.loginAnonymously),
                      ),
                      const Gap(32),
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                                color: Color(0xFF797979), fontSize: 13),
                            text: 'Have an account? ',
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SignInPage(),
                                        ),
                                      ),
                                text: 'Login',
                                style: const TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(15),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
