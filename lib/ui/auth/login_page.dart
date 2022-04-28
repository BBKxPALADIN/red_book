import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth/auth_controller.dart';
import '../../core/custom_button/custom_button.dart';
import '../../core/custom_email_text_field.dart';
import '../../core/theme/app_text_style.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (ctrl) {
        return SafeArea(
          minimum: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 1),
              const Text(
                "Enter your login",
                style: AppTextStyles.boldBlack28,
              ),
              const Spacer(flex: 1),
              CustomEmailTextField(
                labelText: "Login",
                hintText: 'Enter your login',
                autoFocus: true,
                focusNode: ctrl.loginFocusNode,
                controller: ctrl.loginController,
                keyboardType: TextInputType.text,
                nextFocus: ctrl.passwordFocusNode,
                inputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12),
              CustomEmailTextField(
                labelText: "Password",
                hintText: 'Enter your password',
                autoFocus: true,
                focusNode: ctrl.passwordFocusNode,
                controller: ctrl.passwordController,
                keyboardType: TextInputType.text,
                inputAction: TextInputAction.done,
                obscureText: ctrl.secure,
                suffixIcon: InkWell(
                  radius: 10,
                  onTap: () => ctrl.setSecure(),
                  child: Icon(
                      ctrl.secure ? Icons.visibility_off : Icons.visibility),
                ),
              ),
              const Spacer(flex: 2),
              const SizedBox(height: 8),
              CustomButton(
                onTap: ctrl.login,
                child: const Text(
                  "Continue",
                  style: AppTextStyles.defaultButtonStyle,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
