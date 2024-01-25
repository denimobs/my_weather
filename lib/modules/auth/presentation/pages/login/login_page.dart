import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/config/routes.dart';
import '../../../../../core/utils/extensions/build_context.dart';
import '../../../../../core/utils/extensions/string.dart';
import '../../../../../core/widgets/error_dialog.dart';
import '../../../../../core/widgets/loading_wrapper.dart';
import '../../../../../core/widgets/password_form_field.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/login_controller.dart';

part 'layout/_smartphone_layout.dart';
part 'layout/_tablet_layout.dart';
part 'widgets/_login_button.dart';
part 'widgets/_login_form.dart';
part 'widgets/_title.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  void _onLogin({
    required BuildContext context,
    required WidgetRef ref,
    required AsyncValue<String?> state,
  }) {
    switch (state) {
      case AsyncData():
        final notifier = ref.read(authControllerProvider.notifier);
        notifier.state = Authenticated();
        context.navigator.pushReplacementNamed(Routes.home);

      case AsyncError(:final error):
        ErrorDialog.show(
          context: context,
          title: 'Failed to login',
          message: error.toString(),
        );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    ref.listen(loginControllerProvider, (_, state) {
      return _onLogin(
        context: context,
        ref: ref,
        state: state,
      );
    });

    final deviceType = context.deviceType;
    return LoadingWrapper(
      providers: [loginControllerProvider],
      child: deviceType.fold(
        smartphone: (smartphone) => _SmartphoneLayout(
          formKey: formKey,
          emailController: emailController,
          passwordController: passwordController,
        ),
        tablet: (tablet) => _TabletLayout(
          formKey: formKey,
          emailController: emailController,
          passwordController: passwordController,
        ),
        desktop: (desktop) => _TabletLayout(
          formKey: formKey,
          emailController: emailController,
          passwordController: passwordController,
        ),
      ),
    );
  }
}
