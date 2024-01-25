part of '../login_page.dart';

class _LoginButton extends ConsumerWidget {
  const _LoginButton({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  void validateAndSubmit(WidgetRef ref) {
    if (!formKey.currentState!.validate()) return;

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final notifier = ref.read(loginControllerProvider.notifier);
    notifier.login(
      email: email,
      password: password,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => validateAndSubmit(ref),
      child: const Text('Login'),
    );
  }
}
