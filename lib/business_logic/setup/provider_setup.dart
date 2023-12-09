import 'package:get_it/get_it.dart';
import 'package:learning_anglish_app/business_logic/view_models/exams_vm/exams_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final GetIt locator = GetIt.instance;

List<SingleChildWidget> providers = [
  ...independentServices,
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<ExamsViewModel>(create: (_) => ExamsViewModel()),
  ChangeNotifierProvider<ThemesViewModel>(create: (_) => ThemesViewModel()),
];
