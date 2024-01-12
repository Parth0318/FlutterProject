import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cwt_ecommerce_ui_kit/features/authentication/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../home_menu.dart';
import '../../screens/signup/verify_email.dart';

class AuthController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  RxBool signingUp = false.obs;
  RxBool signingIn = false.obs;
  RxBool loadingUserData = false.obs;

  Map<String, dynamic>? userData;

  TextEditingController firstNameC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  TextEditingController userNameC = TextEditingController();
  TextEditingController phoneNumberC = TextEditingController();
  TextEditingController userIdC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  TextEditingController changeNameC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    checkUser();
  }

  Future<void> createAccount() async {
    try {
      signingUp.value = true;
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailC.text, password: passwordC.text);
      user = userCredential.user;
      sendVerificationEmail();
      saveUserData();
      signingUp.value = false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> siginWithEmail() async {
    try {
      signingIn.value = true;
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailC.text, password: passwordC.text);
      readUserData();
      Get.offAll(const HomeMenu());
      signingIn.value = false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> sendVerificationEmail() async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
      Get.offAll(() => const VerifyPasswordScreen());
    }
  }

  Future<void> saveUserData() async {
    await FirebaseFirestore.instance.collection('users').doc(userIdC.text).set({
      'first_name': firstNameC.text,
      'last_name': lastNameC.text,
      'email': emailC.text,
      'password': passwordC.text,
      'phone_number': phoneNumberC.text,
      'user_id': userIdC.text
    }).then((value) {
      readUserData();
      // Get.to(() => const VerifyPasswordScreen());
      print("User Added");
    }).catchError(
      (error) => print("Failed to add user: $error"),
    );
  }

  Future<void> readUserData() async {
    loadingUserData.value = true;
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: user!.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        userData = doc.data() as Map<String, dynamic>;
        print(doc);
        loadingUserData.value = false;
      });
    });
  }

  Future<void> updateFieldValue(String fieldName, dynamic newValue) async {
    try {
      // Get a reference to the document you want to update
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('users')
          .doc(userData!['user_id']);

      // Update the specified field with the new value
      await documentReference.update({
        fieldName: newValue,
      }).then((value) {
        readUserData();
        Get.back();
      });

      print('Field $fieldName updated successfully.');
    } catch (e) {
      print('Error updating field: $e');
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
      print('User signed out successfully.');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  void checkUser() {
    // if (user != null) {
    //   readUserData();
    //   Get.to(const HomeMenu());
    // }
  }
}
