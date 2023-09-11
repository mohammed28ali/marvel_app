class AppStrings {
  static const String emptyString = ' ';

  //Register Screens
  static const String hey = 'Hey, Hello';
  static const String enterYourAccount = 'Enter your credentials to access your account';
  static const String name = 'Name';
  static const String password = 'Password';
  static const String iAgreeTo = 'I agree to the ';
  static const String termsAndPrivacy = 'Terms & Privacy';
  static const String signUp = 'Sign up';
  static const String alreadyHaveAccount = 'Already have an account?';

  //Login Screen
  static const String letsConnectWithUs = 'Let\'s Connect With Us!';
  static const String emailAddress = 'Email Address';
  static const String forgotPassword = 'Forgot Password?';
  static const String login = 'Login';
  static const String or = 'Or';
  static const String doNotHaveAccount = 'Don\'t have an account?';
  static const String register = 'Register';

  //Home Screen
  static const String marvel = 'Marvel';
  static const String tvShows = 'Tv Shows';
  static const String movies = 'Movies';
  static const String seeMore = 'See more';
  static const String abWorkout = 'Ab Workout';

  //Details Screen
  static const String description = 'Description';
  static const String relatedMovies = 'Related Movies';
  static const String length = 'Length';
  static const String director = 'Director';
  static const String phase = 'Phase';
  static const String season = 'Season';
  static const String episodes = 'Episodes';
  static const String play = 'Play Trailer';
}

class AppPhrases {
  String phraseConstruction(String firstString, String secondString) {
    return firstString + secondString;
  }

  String phraseConstructionWithFirstStringEmpty(String secondString) {
    return AppStrings.emptyString + secondString;
  }

  phraseConsPhrasesConstructionWithFirstStringEmptyFunction(secondString) {}
}
