import 'app_component.dart' as _i1;
import '../modules/rest_network.dart' as _i2;
import '../../repository/repository.dart' as _i3;
import 'dart:async' as _i4;
import '../../main.dart' as _i5;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._(this._networkModule);

  final _i2.NetworkModule _networkModule;

  _i3.Repository _singletonRepository;

  static _i4.Future<_i1.AppComponent> create(
      _i2.NetworkModule networkModule) async {
    final injector = AppComponent$Injector._(networkModule);

    return injector;
  }

  _i5.MyApp _createMyApp() => _i5.MyApp();
  _i3.Repository _createRepository() =>
      _singletonRepository ??= _networkModule.provideRepository();
  @override
  _i5.MyApp get app => _createMyApp();
  @override
  _i3.Repository getRepository() => _createRepository();
}
