import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'status_enum.dart';

@injectable
class BaseModel extends ChangeNotifier {
  Status _status = Status.LOADING;
  String errorMessage = "";
  BuildContext? context;
  Status get status => _status;
  void setStatus(Status viewStatus) {
    _status = viewStatus;
    notifyListeners();
  }

  void retry(Function _retry) {
    _retry();
    notifyListeners();
  }

  void setErrorMessage(String errms) {
    errorMessage = errms;
    // notifyListeners();
  }
}
