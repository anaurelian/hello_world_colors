class AppSettings {
  // --------------------------------------------
  // Singleton
  // --------------------------------------------

  factory AppSettings() {
    return _singleton;
  }

  AppSettings._internal();

  static final AppSettings _singleton = AppSettings._internal();

  double _blobSpeed = 100.0;

  double get blobSpeed => _blobSpeed;

  set blobSpeed(double value) {
    _blobSpeed = value;
  }
}