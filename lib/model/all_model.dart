// User Model
import 'package:courses_app/utils/enums/app_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/user_viewmodel.dart';

class UserModel {
  String uid, name, address, dateofBirth, image;
  int? phonenumber;
  String email, signInmethod;
  Profession? profession;
  List<String>? couresesid;
  UserModel(
      {this.uid = "",
      this.name = "",
      this.address = "",
      this.dateofBirth = "",
      this.image = "",
      this.phonenumber = 0,
      this.email = "",
      this.signInmethod = "",
      this.profession,
      this.couresesid});

  static bool checkIsStudent(BuildContext context) {
    final userProvider = Provider.of<UserViewModel>(context, listen: false);
    return userProvider.userdata.profession == Profession.Student;
  }

  // tomap
  Map<String, dynamic> tomap() {
    return {
      "uid": uid,
      "name": name,
      "address": address,
      "dateofBirth": dateofBirth,
      "image": image,
      "phonenumber": phonenumber,
      "email": email,
      "signInmethod": signInmethod,
      "profession": (profession ?? Profession.Student).name,
      "couresesid": couresesid,
    };
  }

  // copyWith
  UserModel copyWith(
      {String? uid,
      String? name,
      String? address,
      String? dateofBirth,
      String? image,
      int? phonenumber,
      String? email,
      String? signInmethod,
      Profession? profession,
      List<String>? couresesid}) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      address: address ?? this.address,
      dateofBirth: dateofBirth ?? this.dateofBirth,
      image: image ?? this.image,
      phonenumber: phonenumber ?? this.phonenumber,
      email: email ?? this.email,
      signInmethod: signInmethod ?? this.signInmethod,
      profession: profession ?? this.profession,
      couresesid: couresesid ?? this.couresesid,
    );
  }

  //  From jason
  UserModel.fromjson(Map<String, dynamic> json)
      : uid = json["uid"] ?? "",
        name = json["name"] ?? "",
        address = json["address"] ?? "",
        dateofBirth = json["dateofBirth"] ?? "",
        image = json["image"] ?? "",
        phonenumber = json["phonenumber"] ?? 0,
        email = json["email"] ?? "",
        signInmethod = json["signInmethod"] ?? "",
        profession = Profession.values.firstWhere(
            (e) => e.name == (json["profession"] ?? Profession.Student.name),
            orElse: () => Profession.Student),
        couresesid = ((json["couresesid"] ?? []) as List)
            .map((e) => e.toString())
            .toList();
}

// Main Courses Model
class MainCoursesModel {
  CourseModel coursemodel;
  List<ClassModel> classmodel;

  MainCoursesModel({required this.coursemodel, required this.classmodel});
}

//  Course Model
class CourseModel {
  String? id;
  String? name;
  String? userid;
  String? coursetype;
  String? datetime;
  String? duration;
  String? description;
  String? rating;
  String? language;
  int? price;
  double? disscount;
  List<String>? images;
  List<String>? teachers;
  List<String>? coursecontent;

  CourseModel({
    this.id,
    this.name,
    this.userid,
    this.coursetype,
    this.datetime,
    this.duration,
    this.description,
    this.rating,
    this.language,
    this.price,
    this.disscount,
    this.images,
    this.teachers,
    this.coursecontent,
  });

  // tomap
  Map<String, dynamic> tomap() {
    return {
      "id": id,
      "name": name,
      "userid": userid,
      "coursetype": coursetype,
      "datetime": datetime,
      "duration": duration,
      "description": description,
      "rating": rating,
      "language": language,
      "price": price,
      "disscount": disscount,
      "images": images,
      "teachers": teachers,
      "coursecontent": coursecontent,
    };
  }
  // copyWith

  CourseModel copyWith({
    String? id,
    String? name,
    String? userid,
    String? coursetype,
    String? datetime,
    String? duration,
    String? description,
    String? rating,
    String? language,
    int? price,
    double? disscount,
    List<String>? images,
    List<String>? teachers,
    List<String>? coursecontent,
  }) {
    return CourseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      userid: userid ?? this.userid,
      coursetype: coursetype ?? this.coursetype,
      datetime: datetime ?? this.datetime,
      duration: duration ?? this.duration,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      language: language ?? this.language,
      price: price ?? this.price,
      disscount: disscount ?? this.disscount,
      images: images ?? this.images,
      teachers: teachers ?? this.teachers,
      coursecontent: coursecontent ?? this.coursecontent,
    );
  }

  //  fromjson
  CourseModel.fromjson(Map<String, dynamic> json)
      : id = json["id"] ?? "",
        name = json["name"] ?? "",
        userid = json["userid"] ?? "",
        coursetype = json["coursetype"] ?? "",
        datetime = json["datetime"] ?? "",
        duration = json["duration"] ?? "",
        description = json["description"] ?? "",
        rating = json["rating"] ?? "",
        language = json["language"] ?? "",
        price = json["price"] ?? "",
        disscount = json["disscount"] ?? 0.0,
        images =
            ((json["images"] ?? []) as List).map((e) => e.toString()).toList(),
        teachers = ((json["teachers"] ?? []) as List)
            .map((e) => e.toString())
            .toList(),
        coursecontent = ((json["coursecontent"] ?? []) as List)
            .map((e) => e.toString())
            .toList();
}

//  Course Class Model
class ClassModel {
  String? id;
  String? name;
  String? description;
  String? datetime;
  String? duration;
  String? teacherid;
  String? courseid;
  List<String>? images;
  ClassModel(
      {this.id,
      this.name,
      this.description,
      this.datetime,
      this.duration,
      this.teacherid,
      this.courseid,
      this.images});

  // tomap
  Map<String, dynamic> tomap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "datetime": datetime,
      "duration": duration,
      "teacherid": teacherid,
      "courseid": courseid,
      "images": images,
    };
  }

  // copyWith
  ClassModel copyWith({
    String? id,
    String? name,
    String? description,
    String? datetime,
    String? duration,
    String? teacherid,
    String? courseid,
    List<String>? images,
  }) {
    return ClassModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      datetime: datetime ?? this.datetime,
      duration: duration ?? this.duration,
      teacherid: teacherid ?? this.teacherid,
      courseid: courseid ?? this.courseid,
      images: images ?? this.images,
    );
  }

  // fromjson
  ClassModel.fromjson(Map<String, dynamic> json)
      : id = json["id"] ?? "",
        name = json["name"] ?? "",
        description = json["description"] ?? "",
        datetime = json["datetime"] ?? "",
        duration = json["duration"] ?? "",
        teacherid = json["teacherid"] ?? "",
        courseid = json["courseid"] ?? "",
        images =
            ((json["images"] ?? []) as List).map((e) => e.toString()).toList();
}

//  Purchase Course Model
class PurchaseCourseModel {
  String? id;
  String? courseid;
  String? studentid;
  String? datetime;
  int? totalprice;
  int? buyprice;
  PurchaseCourseModel(
      {this.id,
      this.courseid,
      this.studentid,
      this.datetime,
      this.buyprice,
      this.totalprice});

  // tomap
  Map<String, dynamic> tomap() {
    return {
      "courseid": courseid,
      "studentid": studentid,
      "datetime": datetime,
      "totalprice": totalprice,
      "buyprice": buyprice,
    };
  }

  // copyWith
  PurchaseCourseModel copyWith(
    String? id,
    String? courseid,
    String? studentid,
    String? datetime,
    int? totalprice,
    int? buyprice,
  ) {
    return PurchaseCourseModel(
      id: id ?? this.id,
      courseid: courseid ?? this.courseid,
      studentid: studentid ?? this.studentid,
      datetime: datetime ?? this.datetime,
      totalprice: totalprice ?? this.totalprice,
      buyprice: buyprice ?? this.buyprice,
    );
  }

  // fromjson
  PurchaseCourseModel.fromjson(Map<String, dynamic> json, this.id)
      : courseid = json["courseid"] ?? "",
        studentid = json["studentid"] ?? "",
        datetime = json["datetime"] ?? "",
        totalprice = json["totalprice"] ?? 0,
        buyprice = json["buyprice"] ?? 0;
}
