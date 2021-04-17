import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as st;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

st.FirebaseStorage firebaseStorage = st.FirebaseStorage.instance;

class StorageService {
  st.Reference campaignStorageRef = firebaseStorage.ref("campaigns");

  Future<String> uploadCampaignImage(File image) async {
    var newReference = campaignStorageRef.child(basename(image.path));
    UploadTask uploadTask = newReference.putFile(image);
    uploadTask = await Future.value(uploadTask);
    TaskSnapshot taskSnapshot = uploadTask.snapshot;
    print(taskSnapshot.bytesTransferred);
    return newReference.getDownloadURL();
  }
}
