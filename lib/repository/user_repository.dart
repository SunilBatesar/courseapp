import 'package:courses_app/main.dart';
import 'package:courses_app/model/all_model.dart';

class UserRepository {
//   Set User
  Future<UserModel> setUser(
      {required UserModel model, required String password}) async {
    try {
      // Call Network Firebase Auth Service Class(SignUp Function)
      final UserModel user =
          await maindata.networkFirebaseAuthService.signUp(model, password);
      //  Set FirebaseFirestore
      await maindata.networkFirebaseService
          .post(maindata.apis.userdoc(user.uid), user.tomap());
      // Return User Data(UserModel)
      return model;
    } catch (e) {
      rethrow;
    }
  }
}
