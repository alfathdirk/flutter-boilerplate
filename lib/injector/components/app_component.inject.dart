import 'app_component.dart' as _i1;
import '../modules/state_store.dart' as _i2;
import '../../store/login/store.dart' as _i3;
import '../../store/absensi/store.dart' as _i4;
import 'dart:async' as _i5;
import '../../main.dart' as _i6;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._(this._stateModule);

  final _i2.StateModule _stateModule;

  _i3.LoginStoreState _singletonLoginStoreState;

  _i4.AbsensiStoreState _singletonAbsensiStoreState;

  static _i5.Future<_i1.AppComponent> create(
      _i2.StateModule stateModule) async {
    final injector = AppComponent$Injector._(stateModule);

    return injector;
  }

  _i6.MyApp _createMyApp() => _i6.MyApp();
  _i3.LoginStoreState _createLoginStoreState() =>
      _singletonLoginStoreState ??= _stateModule.provideRepository();
  _i4.AbsensiStoreState _createAbsensiStoreState() =>
      _singletonAbsensiStoreState ??= _stateModule.provideStoreState();
  @override
  _i6.MyApp get app => _createMyApp();
  @override
  _i3.LoginStoreState getLoginStore() => _createLoginStoreState();
  @override
  _i4.AbsensiStoreState getAbsensiStore() => _createAbsensiStoreState();
}
