import 'package:one_roof_server/model/device_info_model.dart';
import 'package:one_roof_server/one_roof_server.dart';

class DeviceInfoController extends ResourceController {
  DeviceInfoController(this.context);
  final ManagedContext context;

  @Operation.post()
  Future<Response> deviceInfo() async {
    final deviceInfo = DeviceInfo()..read(await request.body.decode());
    final checkQuery = Query<DeviceInfo>(context)
      ..where((x) => x.mobileNumber).equalTo(deviceInfo.mobileNumber);

    final deviceDetails = await checkQuery.fetchOne();
    if (deviceDetails != null)
      return Response.ok({"status": "information already present"});
    else {
      final query = Query<DeviceInfo>(context)..values = deviceInfo;

      final insertedDeviceInfo = await query.insert();

      return insertedDeviceInfo == null
          ? Response.ok({"status": 0})
          : Response.ok({"status": 1});

      // if (insertedDeviceInfo == null)
      //   return Response.ok({"status": 1});
      // else
      //   return Response.ok({"status": 0});
    }
  }
}
