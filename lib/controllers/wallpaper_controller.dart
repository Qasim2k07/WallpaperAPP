import 'package:fluuterui/Models/latest_wallpaper_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WallpaperController extends GetxController {
  LatestWallpapersModel? _latestWallpapersModel;
  bool _loading = false;
  String? _error;

  WallpaperController() {
    callLatestWallpapers();
  }

  bool get loading => _loading;
  LatestWallpapersModel? get latestWallpapersModel => _latestWallpapersModel;
  String? get error => _error;
  setLoading(bool loading) {
    _loading = loading;
    update();
  }

  setError(String error) {
    _error = error;
  }

  setLatestWallpapers(LatestWallpapersModel? latestWallpapersModel) {
    _latestWallpapersModel = latestWallpapersModel;
  }

  void callLatestWallpapers() async {
    setLoading(true);
    var response = await http.get(Uri.parse(
        "https://pixabay.com/api/?key=25754157-4e1b882704c1dc224c14d190d&per_page=200&order=latest&safesearch=true&orientation=horizontal&page=1"));
    if (response.statusCode == 200) {
      setLatestWallpapers(latestWallpapersModelFromJson(response.body));
      setLoading(false);
      return;
    }
    setError("Error fetching Wallpapers");
    setLoading(false);
  }
}
