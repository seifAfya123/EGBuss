class ConstValidations {
  static cpasswordValidation(val, String password) {
    if (val != password) {
      return "make sure both passwords are the same";
    }
    return null;
  }

  static passwordValidation(val) {
    RegExp upperRegex = RegExp(r'^(?=.*[A-Z])');
    RegExp lowerRegex = RegExp(r'^(?=.*[a-z])');
    RegExp digitRegex = RegExp(r'^(?=.*?[0-9])');
    RegExp specialRegex = RegExp(r'^(?=.*?[!@#\$&*~])');

    if (val!.isEmpty) {
      return "password cannot be empty";
    }
    if (val.length < 8) {
      return "password cannot be less than 8 characters";
    }
    if (!upperRegex.hasMatch(val)) {
      return "Should contain at least one upper case";
    }
    if (!lowerRegex.hasMatch(val)) {
      return "Should contain at least one lower case";
    }
    if (!digitRegex.hasMatch(val)) {
      return "Should contain at least one digit";
    }
    if (!specialRegex.hasMatch(val)) {
      return "Should contain at least one Special character";
    }
  }

  ////////////////////////////////////////////////////////////
  static emailValidation(val) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (val!.isEmpty) {
      return "Enter valid email";
    }
    if (!regex.hasMatch(val)) {
      return "Wrong email format";
    } else {
      return null;
    }
  }

  ////////////////////////////////////////////////////////////
  static otpChecker(val) {
    if (val!.isEmpty) {
      return "Code cannot be empty";
    } else {
      return null;
    }
  }

  ////////////////////////////////////////////////////////////
  static nameValidation(val) {
    if (val!.isEmpty) {
      return "Name cannot be empty";
    } else {
      return null;
    }
  }

  ////////////////////////////////////////////////////////////
  static phoneValidation(val) {
    RegExp phoneregix = RegExp(r'^01[0125][0-9]{8}$');
    if (val!.isEmpty) {
      return "phone cannot be empty";
    }
    if (!phoneregix.hasMatch(val)) {
      return "invalid phone number";
    } else {
      return null;
    }
  }

  //////////////////////////////////////////////////
  static validateAllFeilds({required List<String> controllersList}) {
    if (nameValidation(controllersList[0]) == null) {
      if (nameValidation(controllersList[1]) == null) {
        if (emailValidation(controllersList[2]) == null) {
          if (phoneValidation(controllersList[3]) == null) {
            if (passwordValidation(controllersList[4]) == null) {
              if (cpasswordValidation(controllersList[4], controllersList[5]) ==
                  null) {
                return null;
              } else {
                return cpasswordValidation(
                    controllersList[4], controllersList[5]);
              }
            } else {
              return passwordValidation(controllersList[4]);
            }
          } else {
            return phoneValidation(controllersList[3]);
          }
        } else {
          return emailValidation(controllersList[2]);
        }
      } else {
        return nameValidation(controllersList[1]);
      }
    } else {
      return nameValidation(controllersList[0]);
    }
  }

  static loginValidation({
    String? email,
    String? phone,
    required String password,
  }) {
    if (email == null) {
      if (phoneValidation(phone) == null) {
        return passwordValidation(password);
      } else {
        return phoneValidation(phone);
      }
    } else {
      if (emailValidation(email) == null) {
        return passwordValidation(password);
      } else {
        return emailValidation(email);
      }
    }
  }
}
