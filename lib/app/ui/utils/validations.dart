class ValidatorManager {
  static var defaultEmptyCheckValidator = (value) {
    if (value == null || value.isEmpty) {
      return "Lütfen bu alanı doldurunuz.";
    }
    return null;
  };
}
