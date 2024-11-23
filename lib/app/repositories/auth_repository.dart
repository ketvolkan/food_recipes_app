import 'package:get/get.dart';

import '../../core/services/network/base_network_service.dart';

class AuthRepository extends GetxService {
  final _baseNetworkService = Get.find<BaseNetworkService>();
}
