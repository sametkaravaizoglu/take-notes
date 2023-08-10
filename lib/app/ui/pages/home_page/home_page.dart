import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/ui/pages/add_note_page/add_note_page.dart';
import 'package:note_app/app/ui/pages/notedetail_page/note_detail_page.dart';
import 'package:note_app/core/constants/paddings.dart';
import 'package:note_app/core/init/color/color_manager.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Note!'),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (c) {
          return SafeArea(
            child: Padding(
              padding: Paddings.horizontalM,
              child: c.notes.isEmpty
                  ? const Center(
                      child: Text("You have no notes."),
                    )
                  : ListView.builder(
                      itemCount: c.notes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: Paddings.topS,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorManager.instance.homeSpacer),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              onTap: () {
                                Get.to(() => NoteDetailPage(c.notes[index]));
                              },
                              title: Text(c.notes[index].title ?? ""),
                              subtitle: Text(
                                c.notes[index].description ?? "",
                                maxLines: 1,
                                style: TextStyle(color: ColorManager.instance.softGray),
                                overflow: TextOverflow.ellipsis,
                              ),
                              leading: Icon(Icons.note_alt, color: Get.theme.primaryColor),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddNotePage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
