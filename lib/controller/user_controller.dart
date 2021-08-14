import 'package:get/get.dart';
import 'package:p2_mobile_app/model/user_model.dart';
import 'package:p2_mobile_app/service/user_service.dart';

class UserController extends GetxController {
  // ignore: deprecated_member_use
  var selectedUser = User().obs;
  var isLoading = true.obs;

  void onInit() {
    super.onInit();
    currentUser();
  }

  void currentUser() async {
    isLoading(true);
    try {
      var user = await UserService().getUserDetail();
      if (user != null) {
        selectedUser.value = user;
        print(user);
      }
    } finally {
      isLoading(false);
    }
  }
}