import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ingat_tugas/app/data/models/user_model.dart';
import 'package:ingat_tugas/app/modules/login/views/login_view.dart';
import 'package:ingat_tugas/app/routes/app_pages.dart';
import 'package:ingat_tugas/app/utils/navbar.dart';

class LogicController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserModel user = UserModel();

  TextEditingController emailLogin = TextEditingController();
  TextEditingController passLogin = TextEditingController();
  TextEditingController emailRegister = TextEditingController();
  TextEditingController passRegister = TextEditingController();

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void onLogin(String email, String password) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      // CollectionReference dataUsers = firestore.collection('users');
      // dataUsers.doc(userCredential.user!.email).update({
      //   "uid": userCredential.user!.uid,
      //   "email": userCredential.user!.email,
      // });

      Get.offAll(Navbar(), transition: Transition.fadeIn);
      print(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'User not found');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong Password');
      }
    }
  }

  void onRegister(String emailR, String passwordR) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: emailR, password: passwordR);

      CollectionReference users = firestore.collection('users');
      users.doc(auth.currentUser!.email).set({
        "uid": auth.currentUser!.uid,
        "email": auth.currentUser!.email,
      });

      final currUser = await users.doc(auth.currentUser!.email).get();
      final currUserData = currUser.data() as Map<String, dynamic>;

      user = UserModel(
        uid: currUserData["uid"],
        email: currUserData["email"],
      );
      Get.offAll(Navbar());
      print(auth.currentUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The Password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void onLogout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(LoginView());
  }
}
