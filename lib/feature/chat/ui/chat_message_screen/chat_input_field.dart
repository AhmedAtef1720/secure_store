// ignore: avoid_web_libraries_in_flutter

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:secure_store/core/utils/AppColors.dart';
import 'package:secure_store/core/utils/textstyle.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({super.key, required this.reciverID});
  final String reciverID;

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final messageController = TextEditingController();
  String? imagepath;
  File? file;
  String? profileUrl;
   final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: 'gs://store-12a8f.appspot.com');

  // method to upload and get link of image
  Future<String> uploadImageToFireStore(File image) async {
    //2) choose file location (path)
    var ref = _storage.ref().child('${DateTime.now()}');
    //3) choose file type (image/jpeg)
    var metadata = SettableMetadata(contentType: 'image/jpeg');
    // 4) upload image to Firebase Storage
    await ref.putFile(image, metadata);
    // 5) get image url
    String url = await ref.getDownloadURL();
    return url;
  }

  Future<void> _pickImage() async {
    _getProduct();
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imagepath = pickedFile.path;
        // to upload the file (image) to firebase storage
        file = File(pickedFile.path);
      });
    }
    profileUrl = await uploadImageToFireStore(file!);
  }

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
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 20,
            color: appcolors.primerycolor.withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                 
                  
                  Expanded(
                    child: TextField(style: getTitleStyle(color: appcolors.whitecolor,fontSize: 12),
                      controller: messageController,
                      decoration: const InputDecoration(
                        hintText: 'type message ....',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  messageController.text.isEmpty
                      ? IconButton(
                          onPressed:   () async {
                          await _pickImage();
                        },
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: appcolors.primerycolor,
                          ),
                        )
                      : const SizedBox(),
                
                    
                       IconButton(
                          onPressed: () async {
                            final user = FirebaseAuth.instance.currentUser;
                            final message = messageController.text;
                            print(message);
                            final messageDoc = {
                              'message': message,
                              'id': user!.uid,
                              'sender': user.displayName,
                              'reciver':widget.reciverID,
                              'time': DateTime.now(),
                            };
                            final doc = await FirebaseFirestore.instance
                                .collection('messages')
                                .add(messageDoc).whenComplete(() => messageController.clear());
                            print(doc.path);
                            print(doc.id);
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.black,
                          ))
                      
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _getProduct {
}
