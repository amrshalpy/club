import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clubs/componant/const.dart';
import 'package:clubs/cubit/Home_state.dart';
import 'package:clubs/model/club.dart';
import 'package:clubs/model/event.dart';
import 'package:clubs/model/user_club.dart';
import 'package:clubs/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  void login({String? email, String? password}) {
    emit(LoginLoading());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      emit(LoginSucsess(value.user!.uid));
    }).catchError((er) {
      emit(LoginError());
    });
  }

  void register({String? email, String? password, String? name}) {
    emit(RegisterLoading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      saveUser(value, email: email, password: password, name: name);
      emit(RegisterSucsess());
    }).catchError((er) {
      emit(RegisterError());
    });
  }

  UserModel? userModel;
  void saveUser(
    UserCredential user, {
    String? name,
    bool? isAdmin,
    String? email,
    String? password,
  }) {
    UserModel model = UserModel(
      name: name,
      id: user.user!.uid,
      password: password,
      email: email,
      isAdmin: false,
    );
    emit(SaveUserLoading());
    FirebaseFirestore.instance
        .collection(kUser)
        .doc(user.user!.uid)
        .set(model.toMap())
        .then((value) {
      emit(SaveUserSucsess());
      getAllUser();
    }).catchError((er) {
      emit(SaveUserError());
      print(er);
    });

    emit(SaveUserLoading());
    FirebaseFirestore.instance
        .collection(kAllUser)
        .add(model.toMap())
        .then((value) {
      emit(SaveUserSucsess());
    }).catchError((er) {
      emit(SaveUserError());
      print(er);
    });
  }

  void saveUserInClub({
    String? name,
    String? clubName,
  }) {
    UserClub model = UserClub(
      name: name,
      clubName: clubName,
    );

    emit(SaveUserLoading());
    FirebaseFirestore.instance
        .collection(kUserClub)
        .add(model.toMap())
        .then((value) {
      emit(SaveUserSucsess());
      getAllUserInClub();
      
      getAllUser();
    }).catchError((er) {
      emit(SaveUserError());
      print(er);
    });
  }

  List<UserModel> allUsers = [];
  void getAllUser() {
    emit(GetAllUsersLoading());
    FirebaseFirestore.instance.collection(kAllUser).snapshots().listen((event) {
      allUsers = [];
      event.docs.forEach((element) {
        allUsers.add(UserModel.fromJson(element.data()));
        emit(GetAllUsersSucsess());
      });
    });
  }

  List<UserClub> usersClub = [];
  void getAllUserInClub({String? name}) {
    emit(GetAllUsersLoading());
    FirebaseFirestore.instance
        .collection(kUserClub)
        .snapshots()
        .listen((event) {
      usersClub = [];
      event.docs.forEach((element) {
        if (element.data()['clubName'] == name)
          usersClub.add(UserClub.fromJson(element.data()));
        emit(GetAllUsersSucsess());
      });
    });
  }

  bool isAdmin = false;
  void getIsAdmin() {
    FirebaseFirestore.instance.collection(kUser).doc(uid).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      if (userModel!.isAdmin == true) {
        isAdmin = true;
      } else {
        isAdmin = false;
      }
    }).catchError((er) {
      print(er.toString());
    });
  }

  void logOut() {
    FirebaseAuth.instance.signOut();
    emit(Logout());
  }

  File? imageFile;
  var picker = ImagePicker();
  Future<void> uploadImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      print('no image');
    } else {
      imageFile = File(image.path);
      emit(UploadImage());
    }
  }

  Future<void> uploadImageCamera() async {
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      print('no image');
    } else {
      imageFile = File(image.path);
      emit(UploadImage());
    }
  }

  void removeImage() {
    imageFile = null;
    emit(UploadImage());
  }

  void storageImage({
    String? title,
  }) {
    emit(StorageImageClubLoading());
    firebase_storage.FirebaseStorage.instance
        .ref('club/${Uri.file(imageFile!.path).pathSegments.last}')
        .putFile(imageFile!)
        .then((val) {
      val.ref.getDownloadURL().then((value) {
        saveClub(title: title, image: value);
        getClub();
        emit(StorageImageClubSucsess());
      }).catchError((er) {
        emit(StorageImageClubError());
        print(er.toString());
      });
    }).catchError((er) {
      emit(StorageImageClubError());

      print(er.toString());
    });
  }

  ClubModel? clubModel;
  void saveClub({String? title, String? image}) {
    ClubModel model = ClubModel(
      title: title,
      image: image,
    );
    emit(SaveClubLoading());
    FirebaseFirestore.instance
        .collection(kClub)
        .add(model.toMap())
        .then((value) {
      emit(SaveClubSucsess());
    }).catchError((er) {
      emit(SaveClubError());
      print(er.toString());
    });
  }

  EventModel? eventModel;
  void saveEvent({String? title, String? description, String? clubName}) {
    EventModel model = EventModel(
      title: title,
      description: description,
      clubName: clubName,
    );
    emit(SaveEventLoading());
    FirebaseFirestore.instance
        .collection(kEvents)
        .add(model.toMap())
        .then((value) {
      emit(SaveEventSucsess());
      getEvents();
    }).catchError((er) {
      emit(SaveEventError());
      print(er.toString());
    });
  }

  List<ClubModel> clubs = [];
  void getClub() {
    emit(GetClubLoading());
    FirebaseFirestore.instance.collection(kClub).snapshots().listen((event) {
      clubs = [];
      event.docs.forEach((element) {
        clubs.add(ClubModel.fromJson(element.data()));
        emit(GetClubSucsess());
      });
    });
  }

  List<EventModel> eventShow = [];
  void getEventClub({String? name}) {
    emit(GetEventCategoryLoading());
    FirebaseFirestore.instance.collection(kEvents).snapshots().listen((event) {
      eventShow = [];
      event.docs.forEach((element) {
        if (element.data()['clubName'] == name)
          eventShow.add(EventModel.fromJson(element.data()));
        print('eventShow ====${element.data()['title']}');
      });
      emit(GetEventCategorySucsess());
    });
  }

  List<EventModel> events = [];
  void getEvents() {
    emit(GetEventLoading());
    FirebaseFirestore.instance.collection(kEvents).snapshots().listen((event) {
      events = [];
      event.docs.forEach((element) {
        events.add(EventModel.fromJson(element.data()));
        emit(GetEventSucsess());
      });
    });
  }

  IconData icon = Icons.visibility_outlined;
  bool isShow = true;

  void changePassword() {
    isShow = !isShow;

    icon = isShow ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePasswordShowenSucsses());
  }
}
