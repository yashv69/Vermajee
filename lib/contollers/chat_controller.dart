
import 'package:Vermajee/consts/firebase_consts.dart';
import 'package:Vermajee/contollers/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsController extends GetxController {
  @override
  void onInit() {
    getChatId();
    super.onInit();
  }

  var chats = firestore.collection(chatsCollection);
  var friendname = Get.arguments[0];
  var friendid = Get.arguments[1];
  var sendername = Get.find<HomeController>().username;
  var currentid = currentUser!.uid;
  var msgcontroller = TextEditingController();

  dynamic chatDocId;

  getChatId() async {
    await chats
        .where('users', isEqualTo: {
          friendid: Null,
          currentid: Null,
        })
        .limit(1)
        .get()
        .then((QuerySnapshot snapshot) {
          if (snapshot.docs.isNotEmpty) {
            chatDocId = snapshot.docs.single.id;
          } else {
            chats.add({
              'created_on': Null,
              'last_msg': '',
              'users': {friendid: Null, currentid: Null},
              'toId': '',
              'fromID': '',
              'friend_name': friendname,
              'sender_name': sendername
            }).then((value) {
              chatDocId = value.id;
            });
          }
        });
  }

  sendMsg(String msg) async {
    if (msg.trim().isNotEmpty) {
      chats.doc(chatDocId).update({
        'created_on': FieldValue.serverTimestamp(),
        'last_msg': msg,
        'toId': friendid,
        'fromId': currentid,
      });

      chats.doc(chatDocId).collection(messagesCollection).doc().set({
        'created_on': FieldValue.serverTimestamp(),
        'msg': msg,
        'uid': currentid,
      });
    }
  }
}
