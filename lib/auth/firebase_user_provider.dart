import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SsvcFirebaseUser {
  SsvcFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

SsvcFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SsvcFirebaseUser> ssvcFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SsvcFirebaseUser>(
      (user) {
        currentUser = SsvcFirebaseUser(user);
        return currentUser!;
      },
    );
