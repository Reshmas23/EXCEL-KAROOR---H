import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/errors/exceptions.dart';
import 'package:vidyaveechi_website/view/web_DashBoard/pages/video_management/data/model/video_model.dart';

abstract class VideoFirebaseDataSource {
  Future<List<VideoModel>> getVideos();
  Future<Unit> createVideo(VideoModel videoModel);
  Future<String> uploadImage(Uint8List image);
  Future<Unit> deleteVideo(String id);
  Future<Unit> editVideo(VideoModel videoModel);
}

class VideoFirebaseDataSourceImpl implements VideoFirebaseDataSource {
  final FirebaseFirestore firestore;
  final FirebaseStorage firebaseStorage;
  final Uuid uuid;
  static const String clsName = "VideoFirebaseDataSourceImpl";

  VideoFirebaseDataSourceImpl({
    required this.firestore,
    required this.uuid,
    required this.firebaseStorage,
  });
  @override
  Future<List<VideoModel>> getVideos() async {
    try {
      final videos = await firestore.collection("VideoManagement").get();
      return videos.docs.map((e) => VideoModel.fromJson(e.data())).toList();
    } catch (e) {
      log(e.toString(), name: "$clsName getVideos");

      throw ServerException();
    }
  }

  @override
  Future<Unit> createVideo(VideoModel videoModel) async {
    final String uid = uuid.v1();
    final int date = DateTime.now().millisecondsSinceEpoch;
    try {
      final video = videoModel.copyWith(
        id: uid,
        createdAt: date,
      );
      await firestore
          .collection("VideoManagement")
          .doc(uid)
          .set(video.toJson());
      return unit;
    } catch (e) {
      log(e.toString(), name: "$clsName createVideo");
      throw ServerException();
    }
  }

  @override
  Future<String> uploadImage(Uint8List image) async {
    final String uid = uuid.v1();
    try {
      final TaskSnapshot imageData = await firebaseStorage
          .ref()
          .child("videoManager")
          .child("thumbnails")
          .child("/$uid.jpg")
          .putData(image);

      final String imageUrl = await imageData.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      log(e.toString(), name: "$clsName uploadImage");
      throw ImageException();
    }
  }

  @override
  Future<Unit> deleteVideo(String id) async {
    try {
      await firestore.collection("VideoManagement").doc(id).delete();
      return unit;
    } catch (e) {
      log(e.toString(), name: "$clsName deleteVideo");
      throw ServerException();
    }
  }

  @override
  Future<Unit> editVideo(VideoModel videoModel) async {
    try {
      await firestore
          .collection("VideoManagement")
          .doc(videoModel.id)
          .update(videoModel.toJson());
      return unit;
    } catch (e) {
      log(e.toString(), name: "$clsName editVideo");
      throw ServerException();
    }
  }
}
