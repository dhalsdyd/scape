import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// Alternatives include have, shared_preferences, flutter_secure_storage, sqflite, moor and so on.

const String STARLIST = 'starList';

class LocalDatabase extends GetxService {
  GetStorage? box;

  List<String> get starList => box!.read<List<String>>(STARLIST) ?? [];

  @override
  void onInit() {
    box = GetStorage();
    super.onInit();
  }

  void toggleStar(String id) {
    List<String> list = starList;
    if (list.contains(id)) {
      list.remove(id);
    } else {
      list.add(id);
    }
    list.add(id);
    box!.write(STARLIST, list);
  }
}
