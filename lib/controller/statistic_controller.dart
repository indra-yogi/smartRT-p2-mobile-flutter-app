import 'package:get/get.dart';
import 'package:p2_mobile_app/model/statistic_model.dart';
import 'package:p2_mobile_app/service/statistic_service.dart';

class StatisticController extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var maritalData = List<Statistic>().obs;
  // ignore: deprecated_member_use
  var divorceData = List<Statistic>().obs;

  void onInit() {
    statisticMaritalData();
    statisticDivorceData();
    super.onInit();
  }

  void statisticMaritalData() async {
    isLoading(true);
    try {
      var statistic = await StatisticService.getMaritalChart();
      if (statistic != null) {
        maritalData.value = statistic;
      }
    } finally {
      isLoading(false);
    }
  }

  void statisticDivorceData() async {
    isLoading(true);
    try {
      var statistic = await StatisticService.getDivorceChart();
      if (statistic != null) {
        divorceData.value = statistic;
      }
    } finally {
      isLoading(false);
    }
  }
}