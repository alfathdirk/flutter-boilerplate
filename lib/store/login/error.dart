import 'package:mobx/mobx.dart';

part 'error.g.dart';

class ErrorLoginStore = _ErrorLoginStore with _$ErrorLoginStore;

abstract class _ErrorLoginStore with Store {

  // store variables:-----------------------------------------------------------
  @observable
  String errorMessage;

  @observable
  bool showError = false;
}