import 'package:one_roof_server/controller/login_controller.dart';
import 'package:one_roof_server/controller/registeration_controller.dart';

import 'one_roof_server.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class OneRoofServerChannel extends ApplicationChannel {
  ManagedContext context;

  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config = OneRoofConfig(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        config.database.username,
        config.database.password,
        config.database.host,
        config.database.port,
        config.database.databaseName);

    context = ManagedContext(dataModel, persistentStore);

    // final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    // final store = PostgreSQLPersistentStore.fromConnectionInfo("one_roof_user",
    //     "one_roof_password", "192.168.43.134", 5432, "one_roof");
    // context = ManagedContext(dataModel, store);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    // router.route("/example").linkFunction((request) async {
    //   return Response.ok("Hello World")..contentType = ContentType.text;
    // });
    router
        .route("/api/login/:username/:password")
        .link(() => LoginController(context));

    router.route("/api/register").link(() => RegisterationController(context));

    return router;
  }
}

class OneRoofConfig extends Configuration {
  OneRoofConfig(String path) : super.fromFile(File(path));

  DatabaseConfiguration database;
}
