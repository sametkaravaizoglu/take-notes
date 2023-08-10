import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/controllers/add_note_controller.dart';
import 'package:note_app/app/ui/global_widgets/p_text_field.dart';
import 'package:note_app/app/ui/utils/validations.dart';
import 'package:note_app/core/constants/paddings.dart';
import 'package:note_app/core/init/color/color_manager.dart';

class AddNotePage extends GetView<AddNoteController> {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNoteController>(
      init: AddNoteController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Note'),
          ),
          body: SafeArea(
            child: Padding(
              padding: Paddings.horizontalS,
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Form(
                  key: c.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: Paddings.topM,
                        child: PTextField.instance.widget(
                          controller: c.titleController,
                          validator: ValidatorManager.defaultEmptyCheckValidator,
                          label: const Text("Title"),
                        ),
                      ),
                      Padding(
                        padding: Paddings.verticalM,
                        child: PTextField.instance.widget(
                          controller: c.descriptionController,
                          validator: ValidatorManager.defaultEmptyCheckValidator,
                          label: const Text("Description"),
                          minLines: 3,
                          maxLines: 6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomSheet: Container(
            height: 60,
            width: Get.width,
            color: ColorManager.instance.white,
            child: Center(
              child: Padding(
                padding: Paddings.allM,
                child: ElevatedButton(
                  onPressed: () => c.addNote(),
                  child: const Text("Create"),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
