import 'package:kalaapp/repository/repository.dart';
import 'package:kalaapp/injector/modules/rest_network.dart';
import 'package:kalaapp/main.dart';
import 'package:inject/inject.dart';

import 'app_component.inject.dart' as g;

@Injector(const [NetworkModule])
abstract class AppComponent {
  @provide
  MyApp get app;

  static Future<AppComponent> create(NetworkModule networkModule) async {
    return await g.AppComponent$Injector.create(networkModule);
  }

  @provide
  Repository getRepository();

}
