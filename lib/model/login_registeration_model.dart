import 'package:one_roof_server/one_roof_server.dart';

class LoginRegistration extends ManagedObject<_LoginRegistration>
    implements _LoginRegistration {}

class _LoginRegistration {
  @Column(nullable: false)
  String fullName;

  @Column(unique: true, nullable: true)
  String emailId;

  @Column(unique: true, primaryKey: true, nullable: false)
  String mobileNumber;

  @Column(nullable: false)
  String password;

  @Column(nullable: true)
  String profilePicture;

  @Column(nullable: false)
  DateTime timeStamp;
}
