import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

class AddBookModel extends ChangeNotifier {
  String? title;
  String? author;
  File? imageFile;

  //final picker = ImagePicker();

  Future addBook() async {
    if (title == null || title == "") {
      throw 'ほんのタイトルが未入力です';
    }

    if (author == null || author == "") {
      throw '著者が未入力です';
    }

    // firestoreに追加
    await FirebaseFirestore.instance.collection('books').add({
      'title': title,
      'author': author,
    });
  }

  Future pickImage() async {
    // final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    // if (pickedFile != null) {
    //   imageFile = File(pickedFile.path);
    // }
  }
}
