import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/data/models/note_model.dart';
import 'package:note_app/app/ui/global_widgets/p_text_field.dart';
import 'package:note_app/core/constants/paddings.dart';
import 'package:note_app/core/init/color/color_manager.dart';
import '../../../controllers/note_detail_controller.dart';

class NoteDetailPage extends GetView<NoteDetailController> {
  const NoteDetailPage(this.note, {super.key});
  final Note note;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoteDetailController>(
      init: NoteDetailController(note: note),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Detail"),
            actions: [
              IconButton(
                icon: Icon(
                  CupertinoIcons.trash,
                  color: ColorManager.instance.redColor,
                ),
                onPressed: () {
                  Get.dialog(
                    barrierDismissible: true,
                    Dialog(
                      backgroundColor: ColorManager.instance.transparent,
                      child: Container(
                        padding: Paddings.allM,
                        decoration: BoxDecoration(
                          color: ColorManager.instance.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: Paddings.horizontalM,
                              child: Text(
                                "Are you sure?",
                              ),
                            ),
                            Padding(
                              padding: Paddings.topM,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Padding(
                                        padding: Paddings.allM,
                                        child: Container(
                                          padding: Paddings.allS,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: ColorManager.instance.white,
                                            border: Border.all(color: ColorManager.instance.redColor),
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          child: Text(
                                            "No",
                                            style: TextStyle(color: ColorManager.instance.redColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.back();
                                        c.removeNote();
                                      },
                                      child: Padding(
                                        padding: Paddings.allM,
                                        child: Container(
                                          padding: Paddings.allS,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: ColorManager.instance.redColor,
                                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                                          ),
                                          child: Text(
                                            "Yes",
                                            style: TextStyle(
                                              color: ColorManager.instance.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: Paddings.horizontalM,
                child: Column(
                  children: [
                    Padding(
                      padding: Paddings.topM,
                      child: PTextField.instance.widget(
                        controller: c.titleController,
                        label: const Text("Title"),
                        onChanged: (p0) => c.update(),
                      ),
                    ),
                    Padding(
                      padding: Paddings.verticalM,
                      child: PTextField.instance.widget(
                        controller: c.descriptionController,
                        onChanged: (p0) => c.update(),
                        label: const Text("Description"),
                        minLines: 3,
                        maxLines: 6,
                      ),
                    ),
                    Padding(
                      padding: Paddings.allM,
                      child: InkWell(
                        onTap: () {
                          c.updateNote();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: (note.title == c.titleController.text && note.description == c.descriptionController.text) ? ColorManager.instance.homeSpacer : Get.theme.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: Paddings.allM,
                          child: Text(
                            "Update",
                            style: TextStyle(
                              color: (note.title == c.titleController.text && note.description == c.descriptionController.text) ? Get.theme.primaryColor : ColorManager.instance.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
