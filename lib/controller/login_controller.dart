import 'package:one_roof_server/model/login_registeration_model.dart';
import 'package:one_roof_server/one_roof_server.dart';
// import 'package:one_roof_server/model/login_model.dart';

class LoginController extends ResourceController {
  LoginController(this.context);
  final ManagedContext context;

  @Operation.get('username', 'password')
  Future<Response> loginUser(@Bind.path('username') String username,
      @Bind.path('password') String password) async {
    final loginQuery = Query<LoginRegistration>(context)
      ..where((h) => h.mobileNumber).equalTo(username)
      ..where((h) => h.password).equalTo(password);

    final user = await loginQuery.fetchOne();

    if (user == null) {
      return Response.ok({"user": {}, "status": false});
    }
    return Response.ok({
      "user": {
        "fullName": user.fullName,
        "emailId": user.emailId,
        "mobileNumber": user.mobileNumber,
        "profilePicture": user.profilePicture
      },
      "status": true
    });
  }
}
