import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/data/network/networkapi_service.dart';
import 'package:courses_app/res/Apis/apis.dart';
import 'package:courses_app/utils/routes/routes_name.dart';

class MainClass {
  MainClass._ilu();
  static final MainClass instance = MainClass._ilu();

  //  RouteName Class Get
  final _routesnamr = RouteName();
  RouteName get routeName => _routesnamr;

  //  Apis Class Get
  final _apis = Apis();
  Apis get apis => _apis;

  //  Color Class Get
  final _color = AppColor();
  AppColor get color => _color;

  // Get Network Firebase Service Class
  final _networkFirebaseService = NetworkFirebaseService();
  NetworkFirebaseService get networkFirebaseService => _networkFirebaseService;
}
