
import 'package:flutter/material.dart';
import '/business_logic/setup/base_notifier.dart';

class ExamsViewModel extends BaseNotifier
{
  final PageController pageController = PageController();
  int currentPage = 0;

  int selectedIndex = 0;
  List<String> questionList = [
    "had written",
    "has written",
    "had been written",
    "wrote",
  ];

  List<String> questionNums = [
    "A",
    "B",
    "C",
    "D",
  ];

  chooseQuestion({index})
  {
    selectedIndex = index ;
    print(index);
    notifyListeners();
  }
}