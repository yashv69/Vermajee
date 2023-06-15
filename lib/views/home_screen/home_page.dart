import 'package:Vermajee/consts/consts.dart';
import 'package:Vermajee/consts/lists.dart';
import 'package:Vermajee/views/home_screen/components/featured_button.dart';
import 'package:Vermajee/widgets_common/home_buttons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            color: lightGrey,
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
                filled: true,
                fillColor: whiteColor,
                hintText: searchanything,
                hintStyle: TextStyle(color: textfieldGrey),
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      //swipers products
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 150,
                          enlargeCenterPage: true,
                          itemCount: productsList.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              productsList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 8.0))
                                .make();
                          }),

                      10.heightBox,
                      //deals buton
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            2,
                            (index) => homeButtons(
                                  height: context.screenHeight * 0.15,
                                  width: context.screenWidth / 2.5,
                                  icon: index == 0 ? icTodaysDeal : icFlashDeal,
                                  title: index == 0 ? todaydeal : flashsale,
                                )),
                      ),

                      //2nd swiper
                      10.heightBox,
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 150,
                          enlargeCenterPage: true,
                          itemCount: secondproductsList.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              secondproductsList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 8.0))
                                .make();
                          }),
                      //category buttons
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            2,
                            (index) => homeButtons(
                                  height: context.screenHeight * 0.15,
                                  width: context.screenWidth / 2.3,
                                  icon: index == 0
                                      ? icTopCategories
                                      : icTopSeller,
                                  title:
                                      index == 0 ? topcategories : topproducts,
                                )),
                      ),

                      //featured categories
                      20.heightBox,
                      Align(
                          alignment: Alignment.centerLeft,
                          child: featuredcategories.text
                              .color(darkFontGrey)
                              .size(18)
                              .fontFamily(semibold)
                              .make()),
                      20.heightBox,
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                3,
                                (index) => Column(
                                      children: [
                                        featureButton(
                                            icon: featuredImages1[index],
                                            title: featuredTitle1[index]),
                                        10.heightBox,
                                        featureButton(
                                            icon: featuredImages2[index],
                                            title: featuredTitle2[index]),
                                      ],
                                    )).toList(),
                          )),

                      //featured products

                      20.heightBox,

                      Container(
                        padding: const EdgeInsets.all(12),
                        width: double.infinity,
                        decoration: const BoxDecoration(color: redColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            featuredproduct.text.white
                                .fontFamily(bold)
                                .size(18)
                                .make(),
                            10.heightBox,
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                      6,
                                      (index) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                imgP1,
                                                width: 130,
                                                fit: BoxFit.cover,
                                              ),
                                              10.heightBox,
                                              "laptop 4gb/64gb"
                                                  .text
                                                  .fontFamily(semibold)
                                                  .color(Colors.black54)
                                                  .make(),
                                              10.heightBox,
                                              "\$6000"
                                                  .text
                                                  .color(Colors.red)
                                                  .fontFamily(bold)
                                                  .size(16)
                                                  .make(),
                                            ],
                                          )
                                              .box
                                              .margin(
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4))
                                              .white
                                              .roundedSM
                                              .padding(const EdgeInsets.all(8))
                                              .make()),
                                )),
                          ],
                        ),
                      ),

                      //third swiper
                      20.heightBox,
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 150,
                          enlargeCenterPage: true,
                          itemCount: secondproductsList.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              secondproductsList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 8.0))
                                .make();
                          }),

                      //all products section
                      20.heightBox,
                      GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 6,
                          gridDelegate:
                          const    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  mainAxisExtent: 300),
                          itemBuilder: (context, index) {
                            return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  Image.asset(
                                    imgP5,
                                    height: 200,
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  const Spacer(),
                                  "laptop 4gb/64gb"
                                      .text
                                      .fontFamily(semibold)
                                      .color(Colors.black54)
                                      .make(),
                                  10.heightBox,
                                  "\$6000"
                                      .text
                                      .color(Colors.red)
                                      .fontFamily(bold)
                                      .size(16)
                                      .make(),
                                ])
                                .box
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 4))
                                .white
                                .roundedSM
                                .padding(const EdgeInsets.all(12))
                                .make();
                          }),
                    ],
                  )))
        ],
      )),
    );
  }
}
