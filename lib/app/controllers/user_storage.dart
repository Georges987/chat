import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserStorage extends GetxController {
  final box = GetStorage();

  void saveUser(String username, String email) async {
    await box.write('username', username);
    await box.write('email', email);
  }

  void saveUsername(String username) async {
    await box.write('username', username);
  }

  void saveEmail(String email) async {
    await box.write('email', email);
  }

  void savePassword(String password) async {
    await box.write('password', password);
  }

  String? get username => box.read('username');

  String? get email => box.read('email');

  String? get password => box.read('password');

  void deleteUser() async {
    await box.remove('username');
    await box.remove('email');
    await box.remove('password');
  }
}
