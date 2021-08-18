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
}

class Symptom {
  final String kind;
  bool experiece;
  Symptom({required this.kind, this.experiece = false});
}
