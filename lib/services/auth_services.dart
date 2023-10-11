part of 'services.dart';

class AutServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static String? get id => null;

  static int? get balance => null;

  static Future<void> signUp(String email, String password, String name,
      List<String> selectedGenres, String selectedLanguage) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User1 user = result.user!.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserService.updateUser(user);
    } catch (e) {
      print(e);
    }
  }

  static Future<void> signIn(String email, String password) async {
    try {
      UserCredential result = (await _auth.signInWithEmailAndPassword(
          email: email, password: password));
    } catch (e) {}
  }
}

class SignInSignUpResult {
  final User1 user1;
  final String message;

  SignInSignUpResult({required this.user1, required this.message});
}
