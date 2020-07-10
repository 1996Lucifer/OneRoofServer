import 'package:one_roof_server/model/login_registeration_model.dart';
import 'package:one_roof_server/one_roof_server.dart';

class RegisterationController extends ResourceController {
  RegisterationController(this.context);
  final ManagedContext context;

  @Operation.post()
  Future<Response> registerUser() async {
    print("body==> ${request.body.toString()}");
    final registeration = LoginRegistration()
      ..read(await request.body.decode());
    print("ewuiriwereiy===> ${registeration.asMap()}");
    final query = Query<LoginRegistration>(context)
      // ..values.fullName = registeration.fullName
      // ..values.emailId = registeration.emailId
      // ..values.mobileNumber = registeration.mobileNumber
      // ..values.password = registeration.password
      // ..values.profilePicture = registeration.profilePicture
      ..values = registeration
      ..values.timeStamp = DateTime.now();
    print("123123123123===> ${query.context.dataModel.entities}");

    final insertedRegisteration = await query.insert();
    print("insertedRegisteration===> ${insertedRegisteration}");

    if (insertedRegisteration == null) {
      return Response.ok({"status": 0});
    }
    return Response.ok({"status": 1});
  }
}
