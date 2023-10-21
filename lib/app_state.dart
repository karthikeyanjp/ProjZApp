import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _teslapublickey =
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDfhP3cYscZahrf75CqQyNu30/g9WKRejI9ViVuViIahIlKg9CSQM4GKtyDdTmhTX6FaY1H00PeC/GO1pW0+gQc7REdxcz2xd/rSqo2ZneEF7ggZ4dcAp7zNUdtY1NOSvRtCEqTkMDqVg4A6uPVxOx68qJ9HPtypI9KQT4JhUqqsBvVL939+emzvqULZ+y1dNg/Pj+wGp4/irOAcpx3K799WHZQgvfdAns9bn1fo2CnK4pjxX3QXP2Oey2zd+rQ8NBuWV18cToA/gc9ht725owJdAAK2sXRUaH+nF9IYD3aJ0HWgp5diJv8ep2KlRsZeLT+s+uBrwVbaLWFaJo/GtgZ9tDLy8OuxVznkb6ENxnda2RLRtaucJCTkOKFMYaB5koyo4QozrlCyjN5OJD9JqS+pukRX3KdyMvbflg+8eULRP6HLNpven77PNvNdqqli4VxBPV6iiBhVuvt4e3GeBNlX0jGfIhTY/LoKtg0rpsgHgJP/wLX4C5nN7IfGhHpq90= karthikp@KarthikeyansAir.attlocal.net';
  String get teslapublickey => _teslapublickey;
  set teslapublickey(String _value) {
    _teslapublickey = _value;
  }

  String _authcode = '';
  String get authcode => _authcode;
  set authcode(String _value) {
    _authcode = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
