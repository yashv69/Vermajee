import 'package:Vermajee/consts/consts.dart';
import 'package:Vermajee/consts/lists.dart';
import 'package:Vermajee/contollers/auth_controller.dart';
import 'package:Vermajee/views/home_screen/home.dart';
import 'package:Vermajee/views/splash_screen/auth_screen/signup_page.dart';
import 'package:Vermajee/widgets_common/applogo_widget.dart';
import 'package:Vermajee/widgets_common/bg_widget.dart';
import 'package:Vermajee/widgets_common/custom_textfield.dart';
import 'package:Vermajee/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var conrtoller = Get.put(AuthController());
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidget2(),
          10.heightBox,
          Text('Welcome to $appname',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                  background: Paint()..color = Colors.grey)),
          15.heightBox,
          Obx(() => Column(
                    children: [
                      customTextField(
                          hint: emailHint,
                          title: email,
                          isPass: false,
                          controller: conrtoller.emailcontroller),
                      customTextField(
                          hint: passwordHint,
                          title: password,
                          isPass: true,
                          controller: conrtoller.passwordcontroller),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {}, child: forgetPass.text.make())),
                      // ourButton().box.width(context.screenWidth - 50).make(),
                      conrtoller.isloading.value
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.black54),
                            )
                          : ourButton(
                              Color: darkFontGrey,
                              title: login,
                              textColor: whiteColor,
                              onPress: () async {
                                conrtoller.isloading(true);

                                await conrtoller
                                    .loginMethord(context: context)
                                    .then((value) {
                                  if (value != null) {
                                    VxToast.show(context, msg: loggedin);
                                    Get.offAll(() => const Home());
                                  } else {
                                    conrtoller.isloading(false);
                                  }
                                });
                              }).box.width(context.screenWidth - 50).make(),
                      5.heightBox,
                      createNewAccount.text.color(Colors.black38).make(),
                      5.heightBox,
                      ourButton(
                          Color: fontGrey,
                          title: signup,
                          textColor: whiteColor,
                          onPress: () {
                            Get.to(() => const Signup());
                          }).box.width(context.screenWidth - 50).make(),
                      loginWith.text.color(Colors.black38).make(),
                      5.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            2,
                            (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: lightGrey,
                                  radius: 25,
                                  child: Image.asset(
                                    socialIconlist[index],
                                    width: 40,
                                  ),
                                ))),
                      ),
                    ],
                  ))
              .box
              .white
              .rounded
              .padding(const EdgeInsets.all(16))
              .width(context.screenWidth - 70)
              .shadowSm
              .make()
        ]),
      ),
    ));
  }
}
