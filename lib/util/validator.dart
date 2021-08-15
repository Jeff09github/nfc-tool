class Validator {
  String? textValidation(String? text) {
    if (text == null || text.isEmpty) {
      return 'please enter some text';
    }
    return null;
  }
}
