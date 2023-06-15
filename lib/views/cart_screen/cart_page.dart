import 'package:Vermajee/Services/firestore_services.dart';
import 'package:Vermajee/consts/consts.dart';
import 'package:Vermajee/contollers/cart_controller.dart';
import 'package:Vermajee/widgets_common/loading_indicator.dart';
import 'package:Vermajee/widgets_common/our_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: "Shopping Cart"
              .text
              .color(darkFontGrey)
              .fontFamily(semibold)
              .make(),
        ),
        body: StreamBuilder(
            stream: FirestoreServices.getCart(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: loadingIndicator(),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: "Cart is Empty".text.color(darkFontGrey).make(),
                );
              } else {
                var data = snapshot.data!.docs;
                controller.calculate(data);
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                          child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading:
                                      Image.network('${data[index]['image']}'),
                                  title:
                                      "${data[index]['title']}  (x${data[index]['qty']})"
                                          .text
                                          .fontFamily(semibold)
                                          .size(16)
                                          .make(),
                                  subtitle: "${data[index]['tprice']}"
                                      .numCurrency
                                      .text
                                      .fontFamily(semibold)
                                      .color(Colors.black45)
                                      .make(),
                                  trailing: const Icon(
                                    Icons.delete,
                                    color: Colors.black38,
                                  ).onTap(() {
                                    FirestoreServices.deleteDocument(
                                        data[index].id);
                                  }),
                                );
                              }),
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Total Price"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            Obx(
                              () => "${controller.totalP.value}"
                                  .numCurrency
                                  .text
                                  .fontFamily(semibold)
                                  .color(Colors.black87)
                                  .make(),
                            ),
                          ],
                        )
                            .box
                            .padding(EdgeInsets.all(12))
                            .color(Colors.lightGreen)
                            .width(context.screenWidth - 60)
                            .roundedSM
                            .make(),
                        10.heightBox,
                        SizedBox(
                            width: context.screenWidth - 60,
                            child: ourButton(
                                Color: Colors.black45,
                                onPress: () {},
                                textColor: whiteColor,
                                title: "Proceed to shipping")),
                      ],
                    ));
              }
            }));
  }
}
