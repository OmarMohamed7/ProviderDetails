import 'package:flutter/cupertino.dart';
import 'package:provider_details/model/home_model.dart';
import 'package:provider_details/service/api.dart';

class HomeViewMode extends ChangeNotifier {
  HomeModel _homeModel;

  List<Categories> _categories;
  List<Categories> get categories => _categories;
  List<Banners> _banners;
  List<Banners> get banners => _banners;
  List<Upcoming> _upcoming;
  List<Upcoming> get upcoming => _upcoming;
  List<Upcoming> _nearYou;
  List<Upcoming> get nearYou => _nearYou;

  HomeViewMode()
      : _homeModel = HomeModel(),
        _categories = [],
        _banners = [],
        _upcoming = [],
        _nearYou = [];

  getHomeData() async {
    await Future.delayed(const Duration(seconds: 3));

    final res = await HttpApi.getHomePageData();
    _homeModel = HomeModel.fromJson(res);
    _categories = _homeModel.categories!;
    _banners = _homeModel.banners!;
    _upcoming = _homeModel.upcoming!;
    _nearYou = _homeModel.nearBy!;

    notifyListeners();
  }

  void changeEvent() {
    _upcoming = [..._upcoming, Upcoming(sId: "test new ")];

    _upcoming[0].sId = "Omar";
    notifyListeners();
  }
}
