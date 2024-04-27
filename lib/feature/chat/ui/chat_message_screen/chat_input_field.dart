// ignore: avoid_web_libraries_in_flutter

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({super.key});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final messageController = TextEditingController();
  @override
  void initState() {
    super.initState();
    messageController.addListener(() {
      setState(() {});
    });
  }

  // picking_image() async {
  //   XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   print(file!.path);
  //   final message = ChatMessage(
  //       messageType: ChatMessageType.image,
  //       messageStatus: MessageStatus.viewed,
  //       isSender: true,
  //       imageUrl: file.path);

  //   final storage = FirebaseStorage.instance;
  //   final firestore = FirebaseFirestore.instance;
  //   final user = FirebaseAuth.instance.currentUser;
  //   final ref = storage
  //       .ref()
  //       .child('image')
  //       .child(DateTime.now().toIso8601String() + file.name);
  //       image_chat = File(, fileName)
  //   await ref.putFile();
  //   final url = await ref.getDownloadURL();
  //   print(url);

  //   Map<String, dynamic> document = {
  //     'image': url,
  //     'senderId': user?.uid,
  //     'senderName': user?.displayName,
  //     'senderImage': user?.photoURL,
  //     'type': 1,
  //     'time': DateTime.now(),
  //   };

  //   firestore.collection('message').add(document);
  //   setState(() {
  //     messageController.clear();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 20,
            color: Colors.greenAccent.withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        decoration: const InputDecoration(
                          hintText: 'type message ....',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    messageController.text.isEmpty
                        ? IconButton(
                            onPressed: () async {
                              Future uploadprfileImage() async {
                                ////to opent the camera to take a pic
                                ///

                                var profileimagepicker;
                                var pickedimage = await profileimagepicker
                                    .pickImage(source: ImageSource.camera);

                                if (pickedimage != null) {
                                  // image path
                                //  File([], pickedimage.path);
                                  // to remove unnesscary paths
                                  var imagesprofilename =
                                      basename(pickedimage.path);
                                  // to upload the image to fire storage
                                  var profileimagerefstorage = FirebaseStorage
                                      .instance
                                      .ref(imagesprofilename);
                                  //to wait when uploading the image to get the url for the iamge
                                  await profileimagerefstorage
                                      .putFile(pickedimage);

                                  await profileimagerefstorage.getDownloadURL();
                                } else {}
                              }
                            },
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.grey[800],
                            ),
                          )
                        : const SizedBox(),
                    messageController.text.isEmpty
                        ? const SizedBox(
                            width: 5.0,
                          )
                        : const SizedBox(),
                    messageController.text.isEmpty
                        ? IconButton(
                            onPressed: () async {
                              XFile? imageChat;
                              Future uploadprfileImage() async {
                                ////to opent the camera to take a pic
                                ///
                            
                                var profileimagepicker;
                                var pickedimage = await profileimagepicker
                                    .pickImage(source: ImageSource.gallery);

                                if (pickedimage != null) {
                                  // image path
                                  // var imageprofile = File([], pickedimage.path);
                                  // to remove unnesscary paths
                                  var imagesprofilename =
                                      basename(pickedimage.path);
                                  // to upload the image to fire storage
                                  var profileimagerefstorage = FirebaseStorage
                                      .instance
                                      .ref(imagesprofilename);
                                  //to wait when uploading the image to get the url for the iamge
                                  await profileimagerefstorage
                                      .putFile(pickedimage);
                                  var imageProfileUrl =
                                      await profileimagerefstorage
                                          .getDownloadURL();
                                } else {}
                              }
                            },
                            icon: Icon(
                              Icons.attach_file_outlined,
                              color: Colors.grey[800],
                            ),
                          )
                        : const SizedBox(),
                    messageController.text.isNotEmpty
                        ? const SizedBox(
                            width: 5.0,
                          )
                        : const SizedBox(),
                    messageController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () async {
                              final user = FirebaseAuth.instance.currentUser;
                              final message = messageController.text;
                              print(message);
                              final messageDoc = {
                                'message': message,
                                'id': user!.uid,
                                'sender': user.displayName,
                                'time': DateTime.now(),
                              };
                              final doc = await FirebaseFirestore.instance
                                  .collection('messages')
                                  .add(messageDoc);
                              print(doc.path);
                              print(doc.id);
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.black,
                            ))
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
