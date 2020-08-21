import 'package:one_roof_server/one_roof_server.dart';

class DeviceInfo extends ManagedObject<_DeviceInfo> implements _DeviceInfo {}

class _DeviceInfo {
  @Column(unique: true, primaryKey: true, nullable: false)
  String mobileNumber;

  @Column(nullable: false)
  String deviceType;

  @Column(unique: true, nullable: false)
  String deviceId;

  @Column(nullable: false)
  String deviceName;
}
