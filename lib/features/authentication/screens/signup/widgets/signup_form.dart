import 'package:cwt_ecommerce_ui_kit/features/authentication/controllers/auth/auth_controller.dart';
import 'package:cwt_ecommerce_ui_kit/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../verify_email.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
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
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _authController.firstNameC,
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
                      controller: _authController.lastNameC,
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                controller: _authController.userIdC,
                decoration: const InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                controller: _authController.emailC,
                decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                controller: _authController.phoneNumberC,
                decoration: const InputDecoration(
                  labelText: TTexts.phoneNo,
                  prefixIcon: Icon(Iconsax.call),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                controller: _authController.passwordC,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: Icon(Iconsax.eye_slash),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Terms&Conditions Checkbox
              const TTermsAndConditionCheckbox(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Sign Up Button
              SizedBox(
                width: double.infinity,
                child: _authController.signingUp.value
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : ElevatedButton(
                        onPressed: () => _authController.createAccount(),
                        // onPressed: () => Get.to(() => const VerifyPasswordScreen()),
                        child: const Text(TTexts.createAccount),
                      ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
