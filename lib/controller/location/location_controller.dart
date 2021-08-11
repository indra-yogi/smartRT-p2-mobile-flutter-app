import 'package:get/get.dart';
import 'package:p2_mobile_app/model/location/city_model.dart';
import 'package:p2_mobile_app/model/location/district_model.dart';
import 'package:p2_mobile_app/model/location/neighbourhood_model.dart';
import 'package:p2_mobile_app/model/location/province_model.dart';
import 'package:p2_mobile_app/model/location/village_model.dart';
import 'package:p2_mobile_app/service/location_service.dart';

class LocationController extends GetxController {
  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var neighbourList = List<Neighbourhood>().obs;
  // ignore: deprecated_member_use
  var villageList = List<Village>().obs;
  // ignore: deprecated_member_use
  var districtList = List<District>().obs;
  // ignore: deprecated_member_use
  var cityList = List<City>().obs;
  // ignore: deprecated_member_use
  var provinceList = List<Province>().obs;

  @override
  void onInit() {
    fetchProvince();
    super.onInit();
  }

  void fetchNeighbourhood(id) async {
    isLoading(true);
    try {
      var neighbour = await LocationService.getNeighbourhood(id);
      if (neighbour != null) {
        neighbourList.value = neighbour;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchVillage(id) async {
    isLoading(true);
    try {
      var village = await LocationService.getVillage(id);
      if(village != null) {
        villageList.value = village;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchProvince() async {
    isLoading(true);
    try {
      var province = await LocationService.getProvince();
      if(province != null) {
        provinceList.value = province;
      }
    } finally {
      isLoading(false);
    }
  }
}