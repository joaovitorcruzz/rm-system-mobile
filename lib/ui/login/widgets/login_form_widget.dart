import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rm_systems_mobile/domain/enum/app_state_enum.dart';
import 'package:rm_systems_mobile/domain/entities/core/request_state_entity.dart';
import 'package:rm_systems_mobile/ui/login/view_models/login_viewmodel.dart';
import 'package:rm_systems_mobile/utils/util_text.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginViewModel, IRequestState<String>>(
      builder: (context, state) {
        return Column(
          children: [
            TextField(
              controller: _loginController,
              decoration: InputDecoration(
                labelText: UtilText.labelLoginYourEmail,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: UtilText.labelLoginYourPassword,
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: state.state == AppStateEnum.processing
                  ? null
                  : () {
                      context.read<LoginViewModel>().onAuthentication(
                            _loginController.text,
                            _passwordController.text,
                          );
                    },
              child: Text(UtilText.labelLoginButton),
            ),
          ],
        );
      },
    );
  }
}