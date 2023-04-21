import 'dart:io';

import 'package:ai_care/models/activity/activity.dart';
import 'package:ai_care/utils/exception.dart';

import '../../repositories/activity/activity.repository.dart';

class ActivityService {
  Future<List<Activity>> getByClassAndDate(Map<String, dynamic> params) async {
    final response = await ActivityRepository.getByClassAndDate(params);
    return response.statusCode == HttpStatus.ok
        ? (response.data['data'] as List).map((e) => Activity.fromJson(e as Map<String, dynamic>)).toList()
        : throw NetworkException(message: {'message': response.data['message']});
  }

  Future<List<Activity>> getByClassId(String classId) async {
    final response = await ActivityRepository.getByClassId(classId);
    return response.statusCode == HttpStatus.ok
        ? (response.data['data'] as List).map((e) => Activity.fromJson(e as Map<String, dynamic>)).toList()
        : throw NetworkException(message: {'message': response.data['message']});
  }
}
