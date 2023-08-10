import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/controllers/home_controller.dart';
import 'package:note_app/app/data/models/note_model.dart';
import 'package:note_app/core/init/network/network_manager.dart';

class NoteDetailController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void onInit() {
    titleController.text = note.title ?? "";
    descriptionController.text = note.description ?? "";
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  Note note;
  NoteDetailController({required this.note});

  updateNote() async {
    if (note.title != titleController.text || note.description != descriptionController.text) {
      note.title = titleController.text;
      note.description = descriptionController.text;

      await NetworkManager.instance.updateNote(
        title: titleController.text,
        description: descriptionController.text,
        docId: note.id,
      );

      HomeController homeController = Get.find();
      homeController.getInitialData();
      update();
      Get.rawSnackbar(title: "Updated", message: "Note updated successfully");
    }
  }

  removeNote() async {
    await NetworkManager.instance.removeNote(
      docId: note.id,
    );

    HomeController homeController = Get.find();
    homeController.getInitialData();

    Get.back();
    Get.rawSnackbar(title: "Deleted", message: "Note deleted successfully");
  }
}
