import 'package:get/get.dart';
import 'package:p2_mobile_app/model/marital_model.dart';
import 'package:p2_mobile_app/service/marital_service.dart';

class MaritalController extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var maritalList = List<Marital>().obs;

  @override
  void onInit() {
    fetchMarital();
    super.onInit();
  }

  void fetchMarital() async {
    isLoading(true);
    try {
      var marital = await MaritalService.getMarital();
      if (marital != null) {
        maritalList.value = marital;
      }
    } finally {
      isLoading(false);
    }
  }
}