import 'package:flutter/material.dart';
import 'package:usw_circle_link/api_service.dart';
import 'package:usw_circle_link/model/Circle.dart';


class CircleViewModel extends ChangeNotifier {
  final ApiService apiService;
  List<Circle> circles = [];
  bool isLoading = false;
  String? errorMessage;

  CircleViewModel({required this.apiService});

  Future<void> fetchCircles(String uuid) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      circles = await apiService.fetchCircles(uuid);
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
