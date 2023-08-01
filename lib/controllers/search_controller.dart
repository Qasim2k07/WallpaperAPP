import 'package:fluuterui/Models/search_wallpaper_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchingController extends GetxController {
  SearchWallpaperModel? _searchWallpaperModel;
  bool _loading = false;
  String? _error;

    

  bool get loading => _loading;
  SearchWallpaperModel? get searchWallpaperModel => _searchWallpaperModel;
  String? get error => _error;
  setLoading(bool loading) {
    _loading = loading;
    update();
  }

  setError(String error) {
    _error = error;
  }

  setSearchWallpapers(SearchWallpaperModel? searchWallpaperModel) {
    _searchWallpaperModel = searchWallpaperModel;
  }

  void callSearchWallpapers(String search) async {
    setLoading(true);
    var response = await http.get(Uri.parse(
        "https://pixabay.com/api/?key=25754157-4e1b882704c1dc224c14d190d&q=$search"));
    if (response.statusCode == 200) {
      setSearchWallpapers(searchWallpaperModelFromJson(response.body));
      setLoading(false);
      return;
    }
    setError("Error fetching Wallpapers");
    setLoading(false);
  }
}
