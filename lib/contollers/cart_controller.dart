import 'package:get/get.dart';

class CartController extends GetxController {
  var totalP = 0.obs;

  calculate(data) {
    totalP.value = 0;
    for (var i = 0; i < data.legth; i++) {
      totalP.value = totalP.value + int.parse(data[i]['tprice'].toString());
    }
  }
}
