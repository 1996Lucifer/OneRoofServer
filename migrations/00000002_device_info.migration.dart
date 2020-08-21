import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration2 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable("_DeviceInfo", [
      SchemaColumn("mobileNumber", ManagedPropertyType.string,
          isPrimaryKey: true,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: true),
      SchemaColumn("deviceType", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("deviceId", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: true),
      SchemaColumn("deviceName", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {
    await database.store.execute(
        "INSERT INTO _DeviceInfo (mobileNumber,deviceType,deviceId,deviceName) VALUES (@mobileNumber,@deviceType,@deviceId,@deviceName)",
        substitutionValues: {
          "mobileNumber": "9634592428",
          "deviceType": "android",
          "deviceId": "76da3285e7d3c5f5",
          "deviceName": "ONEPLUS A6010"
        });
  }
}
