import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../features/authentication/controllers/auth/auth_controller.dart';
import '../../../features/personalization/models/user_model.dart';
import '../images/t_circular_image.dart';

class TUserProfileCard extends StatelessWidget {
  const TUserProfileCard({
    super.key,
    required this.user,
    required this.actionButtonOnPressed,
  });

  final UserModel user;
  final VoidCallback actionButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    AuthController _authController = Get.find<AuthController>();

    return ListTile(
      leading: TCircularImage(
          padding: 0,
          image: user.profilePicture,
          width: 50,
          height: 50,
          fit: BoxFit.cover),
      title: Text(
        _authController.userData != null
            ? '${_authController.userData!['first_name']} ${_authController.userData!['last_name']}'
            : 'No User Data', // Provide a default value or handle accordingly
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        _authController.userData != null &&
                _authController.userData!['email'] != null
            ? '${_authController.userData!['email']}'
            : 'No Email', // Provide a default value or handle accordingly
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: actionButtonOnPressed,
        icon: const Icon(Iconsax.edit, color: TColors.white),
      ),
    );
  }
}
