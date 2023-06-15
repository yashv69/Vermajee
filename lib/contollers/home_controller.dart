import 'package:Vermajee/consts/consts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void oninit() {
    getuserName();
    super.onInit();
  }

  var currentNavindex = 0.obs;

  var username = ' ';

  getuserName() async {
    var n = await firestore
        .collection(usersCollection)
        .where("id", isEqualTo: currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['name'];
      }
    });
    username = n;
    print(username);
  }
}
