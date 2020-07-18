import 'package:one_roof_server/one_roof_server.dart';

class FlatsInfo extends ManagedObject<_FlatsInfo> implements _FlatsInfo {}

class _FlatsInfo {
  @Column(unique: true, primaryKey: true, nullable: false, autoincrement: true)
  int flatId;

  @Column(unique: true, nullable: false)
  Document flatInfo;
}
