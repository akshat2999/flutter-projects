class SizeConfig {
  static double _screenHeight;
  static double _screenWidth;
  static double _blockHeight = 0;
  static double _blockWidth = 0;

  static double heightMultiplier;
  static double widthMultiplier;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static bool isMobilePortrait = false;

  void init(double maxHeight, double maxWidth) {
    _screenHeight = maxHeight;
    _screenWidth = maxWidth;
    _blockHeight = _screenHeight / 100;
    _blockWidth = _screenWidth / 100;
    if (_screenWidth < 450) isMobilePortrait = true;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;

    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;
    print("Kyra: Height: $heightMultiplier, Width: $widthMultiplier, Text: $textMultiplier, Image: $imageSizeMultiplier");
  }
}
