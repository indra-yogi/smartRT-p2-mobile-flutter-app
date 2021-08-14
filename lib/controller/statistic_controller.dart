import 'package:get/get.dart';
import 'package:p2_mobile_app/model/statistic_model.dart';
import 'package:p2_mobile_app/service/statistic_service.dart';

class StatisticController extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var totalData = List<Statistic>().obs;

  void onInit() {
    super.onInit();
    statisticAllData();
  }

  void statisticAllData() async {
    isLoading(true);
    try {
      var statistic = await StatisticService().getAll();
      if (statistic != null) {
        totalData.value = statistic;
      }
    } finally {
      isLoading(false);
    }
  }
}