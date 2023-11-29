import 'package:fluttertoast/fluttertoast.dart';

class ScapeToast {
  static void open(String msg) {
    Fluttertoast.showToast(msg: msg);
  }
}
