import 'package:cbj_hub/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection(String environment) async =>
    $initGetIt(getIt, environment: environment);

abstract class Env {
  static const String test = 'test';
  static const String devPc = 'dev_pc';
  static const String devPi = 'dev_pi';
  static const String prod = 'prod';
}
