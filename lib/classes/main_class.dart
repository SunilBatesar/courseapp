import 'package:courses_app/res/Apis/apis.dart';
import 'package:courses_app/utils/routes/routes_name.dart';

class MainClass {
  MainClass._ilu();
  static final MainClass instance = MainClass._ilu();
   
  //  RouteName Class Get
  final _routesnamr = RouteName();
  RouteName get getrouteName => _routesnamr;

  //  Apis Class Get
  final _apis = Apis();
  Apis get apis => _apis;
}
