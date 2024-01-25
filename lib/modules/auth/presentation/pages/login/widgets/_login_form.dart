part of '../login_page.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your email';
    }

    if (!value.isEmail) {
      return 'Please enter a valid email';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            validator: _validateEmail,
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
          ),
          const SizedBox(height: 16),
          PasswordFormField(
            controller: passwordController,
            hintText: 'Enter your password',
          ),
        ],
      ),
    );
  }
}
