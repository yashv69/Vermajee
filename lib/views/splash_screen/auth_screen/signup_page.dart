import 'package:Vermajee/consts/consts.dart';
import 'package:Vermajee/contollers/auth_controller.dart';
import 'package:Vermajee/views/splash_screen/auth_screen/login_page.dart';
import 'package:Vermajee/widgets_common/applogo_widget.dart';
import 'package:Vermajee/widgets_common/bg_widget.dart';
import 'package:Vermajee/widgets_common/custom_textfield.dart';
import 'package:Vermajee/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidget2(),
          10.heightBox,
          Text('Join our $appname Family',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                  background: Paint()..color = Colors.grey)),
          15.heightBox,
          Obx(() => Column(
                    children: [
                      customTextField(
                          hint: nameHint,
                          title: name,
                          controller: nameController,
                          isPass: false),
                      customTextField(
                          hint: emailHint,
                          title: email,
                          controller: emailController,
                          isPass: false),
                      customTextField(
                          hint: passwordHint,
                          title: password,
                          controller: passwordController,
                          isPass: true),
                      customTextField(
                          hint: passwordHint,
                          title: retypePassword,
                          controller: passwordRetypeController,
                          isPass: true),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {}, child: forgetPass.text.make())),
                      // ourButton().box.width(context.screenWidth - 50).make(),

                      Row(
                        children: [
                          Checkbox(
                              activeColor: Colors.black87,
                              checkColor: whiteColor,
                              value: isCheck,
                              onChanged: (newvalue) {
                                setState(() {
                                  isCheck = newvalue;
                                });
                              }),
                          10.widthBox,
                          Expanded(
                              child: RichText(
                                  text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: fontGrey,
                                  )),
                              TextSpan(
                                  text: TermsAndCondition,
                                  style: TextStyle(
                                    fontFamily: bold,
                                    color: Colors.black87,
                                  )),
                              TextSpan(
                                  text: " & ",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: fontGrey,
                                  )),
                              TextSpan(
                                  text: PrivacyPolicy,
                                  style: TextStyle(
                                    fontFamily: bold,
                                    color: Colors.black87,
                                  )),
                            ],
                          ))),
                        ],
                      ),
                      5.heightBox,
                      controller.isloading.value
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.black54),
                            )
                          : ourButton(
                              Color: isCheck == true ? darkFontGrey : lightGrey,
                              title: signup,
                              textColor: whiteColor,
                              onPress: () async {
                                if (isCheck != false) {
                                  controller.isloading(true);
                                  try {
                                    await controller
                                        .signupMethord(
                                            context: context,
                                            email: emailController.text,
                                            password: passwordController.text)
                                        .then((value) {
                                      return controller.storeUserData(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          name: nameController.text);
                                    }).then((value) {
                                      VxToast.show(context, msg: signedin);
                                      Get.offAll(() => const Login());
                                    });
                                  } catch (e) {
                                    auth.signOut();
                                    VxToast.show(context, msg: e.toString());
                                    controller.isloading(false);
                                  }
                                }
                              },
                            ).box.width(context.screenWidth - 50).make(),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AlreadyHaveAccount.text.color(fontGrey).make(),
                          login.text
                              .color(Colors.black87)
                              .bold
                              .make()
                              .onTap(() {
                            Get.back();
                          })
                        ],
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
