import 'package:flutter/material.dart';
import '/backend/backend.dart';
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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _ResentSearches =
          prefs.getStringList('ff_ResentSearches') ?? _ResentSearches;
    });
    _safeInit(() {
      _lastSeenReports = prefs.containsKey('ff_lastSeenReports')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastSeenReports')!)
          : _lastSeenReports;
    });
    _safeInit(() {
      _isFirstTime = prefs.getBool('ff_isFirstTime') ?? _isFirstTime;
    });
    _safeInit(() {
      _appVersionCode = prefs.getInt('ff_appVersionCode') ?? _appVersionCode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _ResentSearches = [];
  List<String> get ResentSearches => _ResentSearches;
  set ResentSearches(List<String> value) {
    _ResentSearches = value;
    prefs.setStringList('ff_ResentSearches', value);
  }

  void addToResentSearches(String value) {
    ResentSearches.add(value);
    prefs.setStringList('ff_ResentSearches', _ResentSearches);
  }

  void removeFromResentSearches(String value) {
    ResentSearches.remove(value);
    prefs.setStringList('ff_ResentSearches', _ResentSearches);
  }

  void removeAtIndexFromResentSearches(int index) {
    ResentSearches.removeAt(index);
    prefs.setStringList('ff_ResentSearches', _ResentSearches);
  }

  void updateResentSearchesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ResentSearches[index] = updateFn(_ResentSearches[index]);
    prefs.setStringList('ff_ResentSearches', _ResentSearches);
  }

  void insertAtIndexInResentSearches(int index, String value) {
    ResentSearches.insert(index, value);
    prefs.setStringList('ff_ResentSearches', _ResentSearches);
  }

  DateTime? _lastSeenReports;
  DateTime? get lastSeenReports => _lastSeenReports;
  set lastSeenReports(DateTime? value) {
    _lastSeenReports = value;
    value != null
        ? prefs.setInt('ff_lastSeenReports', value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastSeenReports');
  }

  int _globalReportsCount = 0;
  int get globalReportsCount => _globalReportsCount;
  set globalReportsCount(int value) {
    _globalReportsCount = value;
  }

  bool _seenoffer = false;
  bool get seenoffer => _seenoffer;
  set seenoffer(bool value) {
    _seenoffer = value;
  }

  bool _isFirstTime = true;
  bool get isFirstTime => _isFirstTime;
  set isFirstTime(bool value) {
    _isFirstTime = value;
    prefs.setBool('ff_isFirstTime', value);
  }

  int _appVersionCode = 1;
  int get appVersionCode => _appVersionCode;
  set appVersionCode(int value) {
    _appVersionCode = value;
    prefs.setInt('ff_appVersionCode', value);
  }
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
