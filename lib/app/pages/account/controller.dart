import 'package:get/get.dart';

class AccountDetailController extends GetxController {
  final name = ''.obs;
  final mail = ''.obs;
  final password = ''.obs;

  List<Map> logMockData = [
    {
      "date": "2023. 11. 10 18:27:11","data" : "Password copied by Me",
    },
    {
      "date": "2023. 11. 10 18:27:11","data" : "Update Password",
    },
    {
      "date": "2023. 11. 10 18:27:11","data" : "Shared with @",
    },
    {
      "date": "2023. 11. 10 18:27:11","data" : "Credential created bt Me",
    }
  ];

  
}
