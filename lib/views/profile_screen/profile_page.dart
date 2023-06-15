import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Vermajee/Services/firestore_services.dart';
import 'package:Vermajee/consts/consts.dart';
import 'package:Vermajee/consts/lists.dart';
import 'package:Vermajee/contollers/auth_controller.dart';
import 'package:Vermajee/contollers/profile_controller.dart';
import 'package:Vermajee/views/profile_screen/components/details_card.dart';
import 'package:Vermajee/views/profile_screen/edit_profile.dart';
import 'package:Vermajee/views/splash_screen/auth_screen/login_page.dart';
import 'package:Vermajee/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
        child: Scaffold(
            body: StreamBuilder(
                stream: FirestoreServices.getUser(currentUser!.uid),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.black54),
                      ),
                    );
                  } else {
                    var data = snapshot.data!.docs[0];

                    return SafeArea(
                        child: Column(
                      children: [
                        //edit button
                        const Align(
                                alignment: Alignment.topRight,
                                child: Icon(Icons.edit, color: whiteColor))
                            .onTap(() {
                          controller.nameController.text = data['name'];
                          Get.to(() => EditProfile(data: data));
                        }),

                        //user details section
                        Row(
                          children: [
                            data['imageUrl'] == ''
                                ? Image.asset(imgProfile2,
                                        width: 100, fit: BoxFit.cover)
                                    .box
                                    .roundedFull
                                    .clip(Clip.antiAlias)
                                    .make()
                                : Image.network(data['imageUrl'],
                                        width: 100, fit: BoxFit.cover)
                                    .box
                                    .roundedFull
                                    .clip(Clip.antiAlias)
                                    .make(),
                            10.widthBox,
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "${data['name']}"
                                    .text
                                    .fontFamily(semibold)
                                    .white
                                    .make(),
                                "${data['email']}".text.white.make(),
                              ],
                            )),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                  color: whiteColor,
                                )),
                                onPressed: () async {
                                  await Get.put(AuthController())
                                      .signoutMethord(context);
                                  Get.offAll(() => const Login());
                                },
                                child:
                                    logout.text.white.fontFamily(bold).make())
                          ],
                        ),

                        20.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            detailsCard(
                                count: data['cart_count'],
                                title: "In Your Cart",
                                width: context.screenWidth / 3.4),
                            detailsCard(
                                count: data['wishlist_count'],
                                title: "In Your WishList",
                                width: context.screenWidth / 3.4),
                            detailsCard(
                                count: data['order_count'],
                                title: "Your Orders",
                                width: context.screenWidth / 3.4),
                          ],
                        ),

                        //buttons section

                        40.heightBox,

                        ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return const Divider(
                              color: lightGrey,
                            );
                          },
                          itemCount: profileButtonsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Image.asset(
                                profileButtonIcon[index],
                                width: 22,
                              ),
                              title: profileButtonsList[index]
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make(),
                            );
                          },
                        )
                            .box
                            .white
                            .rounded
                            .padding(const EdgeInsets.symmetric(horizontal: 16))
                            .shadowSm
                            .make(),
                      ],
                    ));
                  }
                })));
  }
}
