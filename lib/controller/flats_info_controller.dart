import 'package:one_roof_server/model/flats_model.dart';
import 'package:one_roof_server/one_roof_server.dart';

class FlatsInfoController extends ResourceController {
  FlatsInfoController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getFlatInfo() async {
    // final Map<String, dynamic> mapData = {"flatInfo": {}};
    final List<Map<String, dynamic>> mapDataList = [];
    final flatQuery = await Query<FlatsInfo>(context).fetch();
    print("flatquery====> $flatQuery");
    if (flatQuery == null || flatQuery == [])
      return Response.ok({"flats": {}, "status": false});

    flatQuery.forEach((element) {
      // mapData['flatId'] = element.flatId;
      // mapData['flatInfo'] = element.flatInfo.data;
      mapDataList.add({"flatId": element.flatId,"flatInfo": element.flatInfo.data});
    });
    print(mapDataList);
    return Response.ok({"flats": mapDataList, "status": true});
  }
}
