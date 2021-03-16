class DimensionService {
  static final DimensionService _dimentionService =
      DimensionService.createInstance();
  DimensionService.createInstance();
  factory DimensionService() {
    return _dimentionService;
  }

  double? _height;
  double? get deviceHeight => _height;

  set height(double height) {
    _height = height;
  }

  double? _width;

  double? get deviceWidth => _width;

  set width(double width) {
    _width = width;
  }
}
