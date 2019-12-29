import 'package:inject/inject.dart';
import 'package:kalaapp/store/absensi/absensi.dart';
import 'package:kalaapp/store/absensi/store.dart';

@module
class StateModule {
 
  @provide
  @singleton
  AbsensiStore provideAbsensiStore() => AbsensiStore();

  @provide
  @singleton
  AbsensiStoreState provideStoreState() => AbsensiStoreState(provideAbsensiStore());

}
