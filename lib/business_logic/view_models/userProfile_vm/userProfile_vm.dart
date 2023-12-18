import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/data/models/userProfile/userProfile.dart';
import 'package:learning_anglish_app/data/web_services/end_points.dart';
import 'package:learning_anglish_app/presentation/widgets/customDialog/customDialog.dart';
import 'package:learning_anglish_app/presentation/widgets/update/animatedUpdate.dart';
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
          phone: userProfile?.data?.phoneNumber,
          parentPhone: userProfile?.data?.parentPhoneNumber,
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
      Uint8List imageBytes = await pickedFile.readAsBytes();

      // Convert image bytes to base64 string
      String base64String = base64Encode(imageBytes);

      // Form the data URL with the appropriate MIME type
      String mimeType = 'image/${pickedFile.path.split('.').last}';
      base64Image = 'data:$mimeType;base64,$base64String';
    }
    notifyListeners();
  }

   void updateUserProfile({context}) async {
    Map<String,dynamic> body = {
      "fullName": nameController.text,
      "email": emailController.text,
      "phoneNumber": phoneController.text,
      "parentPhoneNumber": parentPhoneController.text,
      "imgFile": imageFile==null?null:base64Image,
    };
    setBusy();
    try {
      Response<dynamic> res = await api.updateProfile(body:body);
      General.showToast(message: res.data['errorMessage'] );
      getUserProfile();
    } catch (e) {
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }


   Future<String> fetchImageAndConvert({imageLink}) async {
     String imageUpdate ='';
    final url = EndPoints.imagesUrl+base64Image;
    try {
      Response response = await Dio().get(url, options: Options(responseType: ResponseType.bytes));

      if (response.statusCode == 200) {
        // Convert the image bytes to base64 string
        imageUpdate = base64Encode(response.data);
        notifyListeners();
      } else {
        print('Failed to load image. Error: ${response.statusCode}');
        return '';
      }
    } catch (e) {
      print('Exception while fetching image: $e');
    }
    return imageUpdate;
  }

}
