
//validation
bool isEmailValid(String email) {
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}

bool isPasswordValid(String password) {
  return RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$").hasMatch(password);
}


//check is valid
String? validateName(String? name) {
  if (name!.isEmpty) {
    return 'Please , enter your name';
  } else {
    return null;
  }
}

String? validateEmail(String? email) {
  if (email!.isEmpty) {
    return 'Please , enter your email';
  } else if (!isEmailValid(email)) {
    return 'Email Not Correct';
  } else {
    return null;
  }
}

String? validatePassword(String? password) {
  if (password!.isEmpty) {
    return 'Please , enter your password';
  } else if (!isPasswordValid(password)) {
    return 'Password Not Correct';
  } else {
    return null;
  }
}
