import 'package:kalaapp/store/absensi/store.dart';

import '../../main.dart';

class StoreComponents {
  StoreComponents._();
  
  static final AbsensiStoreState absensiState = appComponent.getAbsensiStore();
}