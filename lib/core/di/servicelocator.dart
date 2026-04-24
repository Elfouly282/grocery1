// run => dart run build_runner build --delete-conflicting-outputs

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'servicelocator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();