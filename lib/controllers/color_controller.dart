import 'package:fluuterui/Models/color_wallpaper_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ColorController extends GetxController {
  ColorWallpaperModel? _colorWallpaperModel;
  bool _loading = false;
  String? _error;

  bool get loading => _loading;
  ColorWallpaperModel? get colorWallpaperModel => _colorWallpaperModel;
  String? get error => _error;
  setLoading(bool loading) {
    _loading = loading;
    update();
  }

  setError(String error) {
    _error = error;
  }

  setColorWallpapers(ColorWallpaperModel? colorWallpaperModel) {
    _colorWallpaperModel = colorWallpaperModel;
  }

  void callColorWallpapers(String colorName) async {
    setLoading(true);
    var response = await http.get(Uri.parse(
        "https://pixabay.com/api/?key=25754157-4e1b882704c1dc224c14d190d&colors=$colorName&page=1&per_page=200"));
    if (response.statusCode == 200) {
      setColorWallpapers(colorWallpaperModelFromJson(response.body));
      setLoading(false);
      return;
    }
    setError("Error fetching Wallpapers");
    setLoading(false);
  }
}
