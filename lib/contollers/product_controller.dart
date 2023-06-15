import 'package:Vermajee/consts/consts.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:Vermajee/Models/category_model.dart';

class ProductController extends GetxController {
  var Quantity = 0.obs;
  var ColorIndex = 0.obs;
  var totalPrice = 0.obs;
  var subcat = [];

  getSubCategory(title) async {
    subcat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categorymodelFromJson(data);
    var s =
        decoded.categories.where((element) => element.name == title).toList();

    for (var e in s[0].subcategory) {
      subcat.add(e);
    }
  }

  changeColorIndex(index) {
    ColorIndex = index;
  }

  increaseQuantity(totalQuantity) {
    if (Quantity.value < totalQuantity) {
      Quantity.value++;
    }
  }

  decreaseQuantity() {
    if (Quantity.value > 0) {
      Quantity.value--;
    }
  }

  calculateTotalPrice(price) {
    totalPrice.value = price * Quantity.value;
  }

  addtoCart({title, img, color, qty, tprice, context}) async {
    await firestore.collection(cartCollection).doc().set({
      'title': title,
      'img': img,
      'color': color,
      'qty': qty,
      'tprice': tprice,
      'added_by': currentUser!.uid
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    });
  }

  resetValues() {
    totalPrice.value = 0;
    Quantity.value = 0;
    ColorIndex.value = 0;
  }
}
