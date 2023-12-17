import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/data/models/userProfile/userProfile.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:logger/logger.dart';

class UserProfileViewModel extends BaseNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController parentPhoneController = TextEditingController();
  String image = '';

  UserProfile? userProfile;
  void getUserProfile() async {
    setBusy();
    try {
      Response<dynamic> res = await api.userProfile();
      // General.showToast(message: res.data['errorMessage']);
      userProfile = UserProfile.fromJson(res.data);
      fillControllers(
          name: userProfile?.data?.fullName,
          email: userProfile?.data?.email,
          phone: '',
          parentPhone: '',
          imagee: userProfile?.data?.userImgUrl,
      );
      print('************ ${userProfile?.data?.userImgUrl} ************ ');
    } catch (e) {
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }

  fillControllers({name, email, phone, parentPhone,imagee}) {
    nameController.text = name;
    emailController.text = email;
    phoneController.text = phone;
    parentPhoneController.text = parentPhone;
    image = imagee;
  }

  File? imageFile;
  final picker = ImagePicker();
  String base64Image = '';
  pickAndConvertImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      // No image was picked
     General.showToast(message: 'لم يتم اختيار صوره');
      return null;
    } else {
      imageFile = File(pickedFile.path);
      List<int> imageBytes = await imageFile!.readAsBytes();
      base64Image = base64Encode(imageBytes);
      print(base64Image);
    }
    notifyListeners();
  }
}
