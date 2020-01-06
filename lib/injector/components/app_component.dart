import 'package:kalaapp/injector/modules/state_store.dart';
import 'package:kalaapp/main.dart';
import 'package:inject/inject.dart';
import 'package:kalaapp/store/absensi/store.dart';
import 'package:kalaapp/store/login/store.dart';

import 'app_component.inject.dart' as g;

@Injector(const [StateModule])
abstract class AppComponent {
  @provide
  MyApp get app;

  static Future<AppComponent> create(StateModule stateModule) async {
    return await g.AppComponent$Injector.create(stateModule);
  }

  @provide
  LoginStoreState getLoginStore();

  @provide
  AbsensiStoreState getAbsensiStore();

}
