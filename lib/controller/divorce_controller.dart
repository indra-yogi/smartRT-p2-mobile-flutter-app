import 'package:get/get.dart';
import 'package:p2_mobile_app/model/divorce_model.dart';
import 'package:p2_mobile_app/service/divorce_service.dart';

class DivorceController extends GetxController {
  var isLoading = true;
  // ignore: deprecated_member_use
  List<Divorce> divorceList = List<Divorce>();
  // ignore: deprecated_member_use

  @override
  void onInit() async {
    fetchDivorce();
    super.onInit();
  }

  void fetchDivorce() async {
      var divorce = await DivorceService.getDivorce();
      if (divorce != null) {
        divorceList.assignAll(divorce);
        update();
      }
  }
}