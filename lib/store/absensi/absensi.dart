import 'package:mobx/mobx.dart';

part 'absensi.g.dart';

class AbsensiStore = _AbsensiStore with _$AbsensiStore;

abstract class _AbsensiStore with Store {

  @observable
  String title = '';

  @observable
  Map absenOption = new Map();

  @action
  void setTitle(String title) {
    this.title = title;
  }

  @action
  void setAbsen(Map identifier) {
    this.absenOption = identifier;
  }

}

