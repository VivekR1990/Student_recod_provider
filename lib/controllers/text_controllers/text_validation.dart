class TextFormValidation {
  static String? validataName(String? value) {
    if (value!.trim().isEmpty) {
      return 'Please Enter the Name';
    } else {
      return null;
    }
  }

  static String? validateParentName(String? value) {
    if (value!.trim().isEmpty) {
      return 'Please Enter Guardian Name';
    } else {
      return null;
    }
  }

  static String? validateBatch(String? value) {
    if (value!.trim().isEmpty) {
      return 'Please Enter the Batch';
    } else {
      return null;
    }
  }

  static String? validateAge(String? value) {
    if (value!.trim().isEmpty) {
      return 'Please Enter the age';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please enter only numbers';
    } else {
      return null;
    }
  }

  static String? validateContact(String? value) {
    if (value!.trim().isEmpty) {
      return 'Please Enter contact no';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please enter only numbers';
    } else if (value.trim().length < 10 || value.length > 10) {
      return 'Entere a valid contact no';
    } else {
      return null;
    }
  }

  static String? validateEmail(String? value) {
    if (value!.trim().isEmpty) {
      return 'Please enter an email address';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  }

  static String? validateAddress(String? value) {
    if (value!.trim().isEmpty) {
      return 'Please Enter the Address';
    } else {
      return null;
    }
  }
}
