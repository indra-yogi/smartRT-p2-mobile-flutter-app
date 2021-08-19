import 'package:get/get.dart';
import 'package:p2_mobile_app/model/marital_model.dart';
import 'package:p2_mobile_app/service/marital_service.dart';

class MaritalController extends GetxController {
  // ignore: deprecated_member_use
  var maritalList = List<Marital>();
  // ignore: deprecated_member_use

  @override
  void onInit() {
    fetchMarital();
    super.onInit();
  }

  void fetchMarital() async {
      var marital = await MaritalService.getMarital();
      if (marital != null) {
        maritalList.assignAll(marital);
        update();
      }
  }
}