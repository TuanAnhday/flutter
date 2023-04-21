import 'dart:io';

import 'package:ai_care/models/wallet/wallet.dart';
import 'package:ai_care/repositories/wallet/wallet.repository.dart';
import 'package:ai_care/utils/exception.dart';

class WalletService {
  Future<List<Wallet>> getWalletOfStudent(String studentId) async {
    final response = await WalletRepository.getWalletOfStudent(studentId);
    return response.statusCode == HttpStatus.ok
        ? (response.data['data'] as List).map((e) => Wallet.fromJson(e as Map<String, dynamic>)).toList()
        : throw NetworkException();
  }
}
