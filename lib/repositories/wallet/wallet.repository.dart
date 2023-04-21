import 'package:ai_care/config/application.dart';

mixin WalletRepository {
  static Future<dynamic> getWalletOfStudent(String studentId) {
    return Application.api.get('/api/wallets/wallet-of-student/$studentId');
  }
}
