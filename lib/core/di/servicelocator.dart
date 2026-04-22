// run    => flutter pub run build_runner build
import 'package:get_it/get_it.dart';
import 'package:grocery1/core/di/servicelocator.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();
