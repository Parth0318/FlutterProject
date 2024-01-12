import 'package:cwt_ecommerce_ui_kit/features/authentication/controllers/auth/auth_controller.dart';
import 'package:cwt_ecommerce_ui_kit/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/t_circular_image.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'change_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController _authController = Get.find<AuthController>();

    return Scaffold(
      appBar: TAppBar(
        showBackArrowIcon: true,
        title:
            Text('Profile', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Obx(() {
        return _authController.loadingUserData.value
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            const TCircularImage(
                                image: TImages.user, width: 80, height: 80),
                            // TextButton(
                            //     onPressed: () {},
                            //     child: const Text('Change Profile Picture')),
                          ],
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      const Divider(),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSectionHeading(title: 'Profile Information'),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      TProfileMenu(
                          onPressed: () => Get.to(() => const ChangeName()),
                          title: 'Name',
                          value:
                              '${_authController.userData!['first_name']} ${_authController.userData!['last_name']}'),
                      TProfileMenu(
                          onPressed: () {},
                          title: 'Username',
                          value: '${_authController.userData!['user_id']}'),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const Divider(),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSectionHeading(title: 'Personal Information'),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      TProfileMenu(
                          onPressed: () {},
                          title: 'User ID',
                          value: '${_authController.userData!['user_id']}',
                          icon: Iconsax.copy),
                      TProfileMenu(
                          onPressed: () {},
                          title: 'E-mail',
                          value: '${_authController.userData!['email']}'),
                      TProfileMenu(
                          onPressed: () {},
                          title: 'Phone Number',
                          value:
                              '${_authController.userData!['phone_number']}'),
                      // TProfileMenu(
                      //     onPressed: () {}, title: 'Gender', value: 'Male'),
                      // TProfileMenu(
                      //     onPressed: () {},
                      //     title: 'Date of Birth',
                      //     value: '10 Oct, 1994'),
                      const Divider(),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      Center(
                        child: TextButton(
                            onPressed: () => _authController.logout(),
                            child: const Text('Logout',
                                style: TextStyle(color: Colors.red))),
                      )
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
