import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:usw_circle_link/models/circle_screen_model.dart';


class ClubIntroViewModel extends StateNotifier<ClubIntro?> {
  ClubIntroViewModel() : super(null);

  bool isLoading = false;

  Future<void> fetchClubIntro(String token) async {
    isLoading = true;
    state = null;

    var headers = {'Authorization': 'Bearer $token'};

    var request = http.Request(
      'GET',
      Uri.parse('http://43.200.140.186:8080/clubs/intro/1'),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> jsonData = jsonDecode(responseBody)['data'];

      state = ClubIntro.fromJson(jsonData);
    } else {
      print(response.reasonPhrase);
    }

    isLoading = false;
  }
}

final clubIntroProvider = StateNotifierProvider<ClubIntroViewModel, ClubIntro?>(
      (ref) => ClubIntroViewModel(),
);