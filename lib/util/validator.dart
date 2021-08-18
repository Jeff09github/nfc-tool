class Validator {
  String? textValidation(String? text) {
    if (text == null || text.isEmpty) {
      return 'please enter some text';
    }
    return null;
  }

  String? mobileValidation(String? mobile) {
    if (mobile == null || mobile.isEmpty) {
      return 'please enter your mobile number';
    }
    return RegExp(r"^(?:[+0]9)?[0-9]{9}$").hasMatch(mobile)
        ? null
        : 'please enter a valid number';
  }

  String? emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return 'please enter your email address';
    }
    return RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(email)
        ? null
        : 'please enter a valid email address';
  }
}
