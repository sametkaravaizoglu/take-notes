import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/controllers/home_controller.dart';
import 'package:note_app/core/init/network/network_manager.dart';

class AddNoteController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  addNote() async {
    if (formKey.currentState!.validate()) {
      await NetworkManager.instance.addNote(
        title: titleController.text,
        description: descriptionController.text,
      );
      HomeController homeController = Get.find();
      homeController.getInitialData();
      Get.back();
      Get.rawSnackbar(title: "Created", message: "Note created successfully");
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
