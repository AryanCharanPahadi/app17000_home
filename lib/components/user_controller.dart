import 'package:get/get.dart';
import '../helper/shared_prefernce.dart';

class UserController extends GetxController {
  var username = ''.obs;
  var officeName = ''.obs;
  var version = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData(); // Load user data on initialization
  }

  // Method to load user data from shared preferences
  Future<void> loadUserData() async {
    var userData = await SharedPreferencesHelper.getUserData();
    if (userData != null && userData['user'] != null) {
      username.value = userData['user']['username'] ?? '';
      officeName.value = userData['user']['office_name'] ?? '';
      version.value = userData['user']['offline_version'] ?? '';
    }
  }

  // Method to clear user data on logout
  void clearUserData() {
    username.value = '';
    officeName.value = '';
    version.value = '';
  }
}
