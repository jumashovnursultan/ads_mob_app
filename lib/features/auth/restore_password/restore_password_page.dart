import 'package:ads_mobile_app/features/auth/restore_password/logic/restore_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RestorePasswordPage extends HookConsumerWidget {
  const RestorePasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return BlocProvider(
      create: (context) => RestorePasswordCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(50),
                BlocBuilder<RestorePasswordCubit, RestorePasswordState>(
                  builder: (context, state) {
                    return TextFormField(
                      controller: emailController,
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return AppLocalizations.of(context)!.requiredField;
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        errorBorder: state.error == 'invalid-email' ||
                                state.error == 'user-not-found'
                            ? OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: Colors.red),
                              )
                            : null,
                        errorText: state.error == 'user-not-found'
                            ? 'No user found for that email.'
                            : state.error == 'invalid-email'
                                ? 'invalid-email'
                                : null,
                      ),
                    );
                  },
                ),
                const Gap(10),
                BlocBuilder<RestorePasswordCubit, RestorePasswordState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        final isValid = formKey.currentState!.validate();
                        if (!isValid) return;
                        context
                            .read<RestorePasswordCubit>()
                            .passwordReset(emailController.text);
                      },
                      child: const Text('data'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
