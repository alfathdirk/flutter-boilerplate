import 'app_component.dart' as _i1;
import '../modules/rest_network.dart' as _i2;
import '../../repository/repository.dart' as _i3;
import '../modules/state_store.dart' as _i4;
import '../../store/absensi/store.dart' as _i5;
import 'dart:async' as _i6;
import '../../main.dart' as _i7;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._(this._networkModule, this._stateModule);

  final _i2.NetworkModule _networkModule;

  _i3.Repository _singletonRepository;

  final _i4.StateModule _stateModule;

  _i5.AbsensiStoreState _singletonAbsensiStoreState;

  static _i6.Future<_i1.AppComponent> create(
      _i2.NetworkModule networkModule, _i4.StateModule stateModule) async {
    final injector = AppComponent$Injector._(networkModule, stateModule);

    return injector;
  }

  _i7.MyApp _createMyApp() => _i7.MyApp();
  _i3.Repository _createRepository() =>
      _singletonRepository ??= _networkModule.provideRepository();
  _i5.AbsensiStoreState _createAbsensiStoreState() =>
      _singletonAbsensiStoreState ??= _stateModule.provideStoreState();
  @override
  _i7.MyApp get app => _createMyApp();
  @override
  _i3.Repository getRepository() => _createRepository();
  @override
  _i5.AbsensiStoreState getAbsensiStore() => _createAbsensiStoreState();
}
