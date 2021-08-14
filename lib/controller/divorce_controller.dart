import 'package:get/get.dart';
import 'package:p2_mobile_app/model/divorce_model.dart';
import 'package:p2_mobile_app/service/divorce_service.dart';

class DivorceController extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var divorceList = List<Divorce>().obs;
  // ignore: deprecated_member_use
  var divorceVList = List<Divorce>().obs;

  @override
  void onInit() {
    fetchDivorce();
    super.onInit();
  }

  void fetchDivorce() async {
    isLoading(true);
    try {
      var divorce = await DivorceService.getDivorce();
      if (divorce != null) {
        divorceList.value = divorce;
      }
    } finally {
      isLoading(false);
    }
  }
}