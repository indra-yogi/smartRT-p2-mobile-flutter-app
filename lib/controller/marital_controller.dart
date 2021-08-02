import 'package:get/get.dart';
import 'package:p2_mobile_app/model/marital_model.dart';
import 'package:p2_mobile_app/service/marital_service.dart';

class MaritalController extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var maritalList = List<Marital>().obs;
  // ignore: deprecated_member_use
  var maritalVList = List<Marital>().obs;
  var selectedMarital = Marital().obs;
  Marital marital;
  

  @override
  void onInit() {
    fetchMarital();
    fetchMaritalDetail(marital);
    fetchValidateMarital();
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

  void fetchValidateMarital() async {
    isLoading(true);
    try {
      var marital = await MaritalService.getValidateMarital();
      if (marital != null) {
        maritalVList.value = marital;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchMaritalDetail(id) async {
    isLoading(true);
    try {
      var selectedmarital = await MaritalService.getMaritalDetail(id);
      if (selectedmarital != null) {
        selectedMarital.value = selectedmarital;
      }
    } finally {
      isLoading(false);
    }
  }
}
