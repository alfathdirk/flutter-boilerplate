import 'package:kalaapp/injector/modules/state_store.dart';
import 'package:kalaapp/repository/repository.dart';
import 'package:kalaapp/injector/modules/rest_network.dart';
import 'package:kalaapp/main.dart';
import 'package:inject/inject.dart';
import 'package:kalaapp/store/absensi/store.dart';

import 'app_component.inject.dart' as g;

@Injector(const [NetworkModule, StateModule])
abstract class AppComponent {
  @provide
  MyApp get app;

  static Future<AppComponent> create(NetworkModule networkModule, StateModule stateModule) async {
    return await g.AppComponent$Injector.create(networkModule, stateModule);
  }

  @provide
  Repository getRepository();

  @provide
  AbsensiStoreState getAbsensiStore();

}
