part of 'services.dart';

class UserService {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static get genre => null;

  static Future<void> updateUser(User1 user) async {
    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguages': user.selectedLanguage,
      'profilePicture': user.profilePicture ?? ""
    });
  }

  static Future<User1> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return User1(id, snapshot['email'], snapshot['name'], snapshot['balance'],
        snapshot['selectedGenres'], snapshot['selectedLanguages']);
  }
}
