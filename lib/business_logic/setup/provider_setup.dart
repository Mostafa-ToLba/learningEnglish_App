import 'package:learning_anglish_app/business_logic/view_models/exams_vm/exams_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/lessonScreen_vm/lessonScreen_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/mainScreen_vm/mainScreen_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> providers = [
  ...independentServices,
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<ExamsViewModel>(create: (_) => ExamsViewModel()),
  ChangeNotifierProvider<ThemesViewModel>(create: (_) => ThemesViewModel()),
  ChangeNotifierProvider<LessonScreenViewModel>(create: (_) => LessonScreenViewModel()),
  ChangeNotifierProvider<MainScreenViewModel>(create: (_) => MainScreenViewModel()),
];
