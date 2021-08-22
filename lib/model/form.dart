import 'package:nfc_tool/util/enum.dart';

class Details {
  final String fullname;
  final String college;
  final String cys;
  final String address;
  final String mobile;
  final String email;

  Details({
    required this.fullname,
    required this.college,
    required this.cys,
    required this.address,
    required this.mobile,
    required this.email,
  });

  toMap() => {
        'fullName': fullname,
        'college': college,
        'cys': cys,
        'address': address,
        'mobile': mobile,
        'email': email,
      };
}

class Symptom {
  final String kind;
  String? image;
  bool experiece;

  Symptom({
    required this.kind,
    this.image,
    this.experiece = false,
  });

  toMap() => {
        'kind': this.kind,
        'experience': this.experiece,
      };
}

class Question {
  final String question;
  String? specify;
  YesOrNo? yesOrNo;

  Question({required this.question, this.yesOrNo});
  Question.withSpecify({required this.question, this.yesOrNo, this.specify});
}
