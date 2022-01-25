import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _task1 = prefs.getBool('ff_task1') ?? _task1;
    _tasks =
        prefs.getStringList('ff_tasks')?.map((x) => x == 'true')?.toList() ??
            [];
  }

  SharedPreferences prefs;

  bool _task1 = false;
  bool get task1 => _task1;
  set task1(bool _value) {
    _task1 = _value;
    prefs.setBool('ff_task1', _value);
  }

  bool task2 = false;

  bool task3 = false;

  bool task4 = false;

  List<bool> _tasks = [];
  List<bool> get tasks => _tasks;
  set tasks(List<bool> _value) {
    _tasks = _value;
    prefs.setStringList('ff_tasks', _value.map((x) => x.toString()).toList());
  }

  void addToTasks(bool _value) {
    _tasks.add(_value);
    prefs.setStringList('ff_tasks', _tasks.map((x) => x.toString()).toList());
  }

  void removeFromTasks(bool _value) {
    _tasks.remove(_value);
    prefs.setStringList('ff_tasks', _tasks.map((x) => x.toString()).toList());
  }

  bool task5 = false;

  DateTime dateToday;
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
