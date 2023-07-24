import 'package:ads_mobile_app/features/auth/sign_in/logic/sign_in_cubit.dart';
import 'package:ads_mobile_app/features/auth/sign_in/widgets/custom_divider.dart';
import 'package:ads_mobile_app/features/auth/sign_in/widgets/login_via_social_network.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared_widgets/app_icon.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      body: BlocProvider(
        create: (context) => SignInCubit(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Gap(58),
                  Text(
                    AppLocalizations.of(context)!.signIn,
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
                  TextFormField(
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return AppLocalizations.of(context)!.requiredField;
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: 'Enter Email / Phone No'),
                  ),
                  const Gap(12),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Passcode'),
                  ),
                  const Gap(16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            color: Color(0xFF797979), fontSize: 12),
                        text: 'Don’t have an account yet?',
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            text: ' Register now!',
                            style: const TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(32),
                  BlocBuilder<SignInCubit, SignInState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          final isValid = formKey.currentState!.validate();
                          if (!isValid) return;
                          context.read<SignInCubit>().signIn(
                              emailController.text, passwordController.text);
                        },
                        child: Text(AppLocalizations.of(context)!.signIn),
                      );
                    },
                  ),
                  const Gap(32),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomDivider(),
                        Text(
                          AppLocalizations.of(context)!.orSignWith,
                          style: const TextStyle(color: Colors.black),
                        ),
                        const CustomDivider(),
                      ],
                    ),
                  ),
                  const Gap(32),
                  FittedBox(
                    child: Row(
                      children: [
                        CustomLoginViaSocialNetworkWidget(
                          title: AppLocalizations.of(context)!.google,
                          icon: AppIcons.google_logo,
                        ),
                        const Gap(8),
                        CustomLoginViaSocialNetworkWidget(
                          title: AppLocalizations.of(context)!.appleId,
                          icon: AppIcons.apple_logo,
                        ),
                        const Gap(8),
                        CustomLoginViaSocialNetworkWidget(
                          title: AppLocalizations.of(context)!.facebook,
                          icon: AppIcons.facebook_logo,
                        ),
                        const Gap(8),
                      ],
                    ),
                  ),
                  const Gap(32),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            color: Color(0xFF797979), fontSize: 13),
                        text: 'Don’t have an account? ',
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            text: 'Register Now',
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
        ),
      ),
    );
  }
}
