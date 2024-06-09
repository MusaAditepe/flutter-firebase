import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hbos/models/card_model.dart';
import 'package:hbos/models/user_model.dart';
import 'package:hbos/services/storage_services.dart';
import 'package:hbos/utils/utility.dart';

class UserServices {
  String errorMessage = "";

  Future<User?> login(String email, String password) async {
    if (email.isEmpty) {
      errorMessage = "error_messages.login_email_empty";
      return null;
    }
    if (password.isEmpty) {
      errorMessage = "error_messages.login_password_empty";
      return null;
    }

    if (!Utility.isValidEmail(email)) {
      errorMessage = "error_messages.login_email_not_valid";
      return null;
    }

    try {
      var loginResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (loginResult.user != null) {
        var userModel = await getUser(loginResult.user!.uid);
        if (userModel != null) {
          userModel.lastLoginDate = DateTime.now();
          String? token = await FirebaseMessaging.instance.getToken();
          userModel.fcmToken = token;
          await updateUser(userModel);
        }
      }

      return loginResult.user;
    } on FirebaseAuthException catch (error) {
      errorMessage = "error_messages.login_error_messages";

      if (error.code == "user-not-found") {
        errorMessage = "error_messages.login_user_not_found";
      }
      if (error.code == "wrong-password") {
        errorMessage = "error_messages.login_user_wrong_password";
      }
      if (error.code == "user-disabled") {
        errorMessage = "error_messages.login_user_disabled";
      }
      if (error.code == "invalid-email") {
        errorMessage = "error_messages.login_email_not_valid";
      }
      return null;
    }
  }

  Future<UserModel?> signup(String name, String email, String password,
      String rePassword, String sex, String city) async {
    if (name.isEmpty) {
      errorMessage = "error_messages.register_name_empty";
    }

    if (email.isEmpty) {
      errorMessage = "error_messages.register_email_empty";
    }

    if (!Utility.isValidEmail(email)) {
      errorMessage = "error_messages.register_email_not_valid";
    }

    if (password.isEmpty) {
      errorMessage = "error_messages.register_password_empty";
    }

    if (rePassword.isEmpty) {
      errorMessage = "error_messages.register_repassword_empty";
    }

    if (password != rePassword) {
      errorMessage = "error_messages.register_password_repassword_not_valid";
    }

    try {
      String? token = await FirebaseMessaging.instance.getToken();

      var signupResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password);
      DateTime now = DateTime.now();

      var userModel = UserModel(
          id: signupResult.user!.uid,
          name: name,
          email: email,
          sex: sex,
          city: city,
          createdDate: now,
          lastLoginDate: now,
          imagePath:
              "https://firebasestorage.googleapis.com/v0/b/kancaanonim.appspot.com/o/user_image.jpeg?alt=media&token=589bd6ca-835c-42a6-be0a-5595b6d308d1",
          fcmToken: token,
          realAmount: 0,
          realDiamonds: 0,
          showDiamonds: 0);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userModel.id)
          .set(userModel.toJson());

      return userModel;
    } on FirebaseAuthException catch (error) {
      errorMessage = "TECHNICAL_ERROR";
      if (error.code == "email-already-in-use") {
        errorMessage = "error_messages.register_email_already_use";
      }
      if (error.code == "weak-password") {
        errorMessage = "error_messages.register_weak_password";
      }
    }

    return null;
  }

  Future<UserModel?> getUser(String userId) async {
    try {
      var userResult = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .get();
      if (userResult.exists) {
        var userData = UserModel.fromJson(userResult.data()!);
        return userData;
      } else {
        errorMessage = "TECHNICAL_ERROR";
        return null;
      }
    } catch (error) {
      errorMessage = "TECHNICAL_ERROR";
    }
    return null;
  }

  Future<bool> updateUser(UserModel userModel) async {
    StorageServices storageServices = StorageServices();
    try {
      if (userModel.imageFile != null) {
        var uploadResult = await storageServices.uploadFile(
            "users", userModel.id!, userModel.imageFile!);
        if (uploadResult.isEmpty) {
          errorMessage = storageServices.errorMessage;
          return false;
        }
        userModel.imagePath = uploadResult;
      }

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userModel.id)
          .update(userModel.toJson());
      return true;
    } catch (error) {
      errorMessage = "TECHNICAL_ERROR";
    }

    return false;
  }

  Future<bool> addUserToDeletedCollection(UserModel userModel) async {
    try {
      await FirebaseFirestore.instance
          .collection("deleted_account")
          .doc(userModel.id)
          .set(userModel.toJson());
      return true;
    } catch (error) {
      errorMessage = "TECHNICAL_ERROR";
    }

    return false;
  }

  Future<bool> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addClaimMoneyRequest(UserModel userModel, String amount,
      String nameSurname, String iban) async {
    try {
      await FirebaseFirestore.instance
          .collection("claim_money_table")
          .doc()
          .set({
        "user_id": userModel.id.toString(),
        "name_surname": nameSurname,
        "iban": iban,
        "amount": amount.toString()
      });
      return true;
    } catch (error) {
      errorMessage = "TECHNICAL_ERROR";
    }

    return false;
  }

  Future<bool> addCard(CardModel cardModel) async {
    try {
      var userId = await FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection('cards')
          .doc()
          .set(cardModel.toJson());
      return true;
    } catch (error) {
      errorMessage = "TECHNICAL_ERROR";
    }

    return false;
  }

  Future<UserModel?> geCard(String userId) async {
    try {
      var userResult = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection('cards')
          .doc()
          .get();
      if (userResult.exists) {
        var userData = UserModel.fromJson(userResult.data()!);
        return userData;
      } else {
        errorMessage = "TECHNICAL_ERROR";
        return null;
      }
    } catch (error) {
      errorMessage = "TECHNICAL_ERROR";
    }
    return null;
  }

  Future<UserModel?> getProcces(String userId) async {
    try {
      var userResult = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection('procces')
          .doc()
          .get();
      if (userResult.exists) {
        var userData = UserModel.fromJson(userResult.data()!);
        return userData;
      } else {
        errorMessage = "TECHNICAL_ERROR";
        return null;
      }
    } catch (error) {
      errorMessage = "TECHNICAL_ERROR";
    }
    return null;
  }
}
