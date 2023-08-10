import 'package:get/get.dart';
import 'package:note_app/core/init/network/network_manager.dart';

import '../data/models/note_model.dart';

class HomeController extends GetxController {
  List<Note> notes = [];

  @override
  void onInit() {
    getInitialData();
    super.onInit();
  }

  getInitialData() async {
    notes = await NetworkManager.instance.getAllNotesWithUid();
    update();
  }
}
