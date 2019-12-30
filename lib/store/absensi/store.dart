

import 'package:kalaapp/store/absensi/absensi.dart';

class AbsensiStoreState {
  AbsensiStore _absensiStore;

  AbsensiStoreState(this._absensiStore);

  getTitle() => _absensiStore.title;

  setTitle(String title) {
    _absensiStore.setTitle(title);
  }

  setAbsen(Map title) {
    _absensiStore.setAbsen(title);
  }

  getAbsen() => _absensiStore.absenOption;
  
}
