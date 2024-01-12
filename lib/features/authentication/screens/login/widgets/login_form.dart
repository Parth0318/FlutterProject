import 'package:cwt_ecommerce_ui_kit/features/authentication/controllers/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../home_menu.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../password_configuration/forget_password.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthController _authController = Get.find<AuthController>();

    return Obx(() {
      return Form(
        child: Padding(
          padding: const EdgeInsets.only(
              top: TSizes.spaceBtwSections, bottom: TSizes.spaceBtwItems),
          child: Column(
            children: [
              /// Email
              TextFormField(
                controller: _authController.emailC,
                decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              /// Password
              TextFormField(
                controller: _authController.passwordC,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: Icon(Iconsax.eye_slash),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields / 2),

              /// Remember Me & Forget Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Remember Me
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      const Text(TTexts.rememberMe),
                    ],
                  ),

                  /// Forget Password
                  TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(TTexts.forgetPassword),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Sign In Button
              SizedBox(
                width: double.infinity,
                child: _authController.signingIn.value
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : ElevatedButton(
                        onPressed: () => _authController.siginWithEmail(),
                        child: const Text(TTexts.signIn)),
              ),
            ],
          ),
        ),
      );
    });
  }
}
