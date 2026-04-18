import 'package:grocery1/core/di/servicelocator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
//import 'package:injectable/injectable.dart';

final servicelocator = GetIt.instance;
@InjectableInit()
void setupLocator() => servicelocator.init();
