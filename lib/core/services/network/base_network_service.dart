import 'dart:io';

import '../../../app/models/general_response.dart';
import 'package:get/get.dart';
import 'package:vexana/vexana.dart';

enum Api {
  test,
  live;

  String get path {
    switch (this) {
      case Api.test:
        return "https://api2.wamessage.app";
      case Api.live:
        return "https://api.wamessage.app";
    }
  }
}

class BaseNetworkService extends GetxService {
  final Api _apiSelection = Api.live; //!! Api path - Uygulamayı çıkmadan önce kontrol edin
  Api get apiSelection => _apiSelection;

  @override
  void onInit() {
    networkManager = _networkManagerInstance;
    super.onInit();
  }

  NetworkManager get _networkManagerInstance {
    switch (_apiSelection) {
      case Api.live:
        return NetworkManager<GeneralResponse>(
          isEnableLogger: false,
          skippingSSLCertificate: true,
          options: BaseOptions(
            baseUrl: Api.live.path,
            headers: {
              'Content-type': 'application/json',
              'Accept': 'application/json',
              'Accept-Language': Get.locale?.languageCode == "tr" ? "tr" : "en",
              "Platform": GetPlatform.isAndroid ? "android" : "ios",
            },
            receiveTimeout: const Duration(milliseconds: 30000),
            connectTimeout: const Duration(milliseconds: 30000),
          ),
          errorModel: GeneralResponse(),
        );
      case Api.test:
        return NetworkManager<GeneralResponse>(
          isEnableLogger: false,
          skippingSSLCertificate: true,
          options: BaseOptions(
            baseUrl: Api.test.path,
            headers: {
              'Content-type': 'application/json',
              'Accept': 'application/json',
              'Accept-Language': Get.locale?.languageCode == "tr" ? "tr" : "en",
              "Platform": GetPlatform.isAndroid ? "android" : "ios",
            },
            receiveTimeout: const Duration(milliseconds: 30000),
            connectTimeout: const Duration(milliseconds: 30000),
          ),
          errorModel: GeneralResponse(),
        );
    }
  }

  final Rx<INetworkManager> _networkManager = Rx(
    NetworkManager<GeneralResponse>(
      isEnableLogger: false,
      skippingSSLCertificate: true,
      options: BaseOptions(
        baseUrl: Api.live.path,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Accept-Language': Get.locale?.languageCode == "tr" ? "tr" : "en",
          "Platform": GetPlatform.isAndroid ? "android" : "ios",
        },
        receiveTimeout: const Duration(milliseconds: 30000),
        connectTimeout: const Duration(milliseconds: 30000),
      ),
      errorModel: GeneralResponse(),
    ),
  );

  INetworkManager get networkManager => _networkManager.value;
  set networkManager(INetworkManager val) => _networkManager.value = val;
  setToken(String str) {
    networkManager.addBaseHeader(MapEntry(HttpHeaders.authorizationHeader, str));
  }

  clearToken() {
    networkManager.removeHeader(HttpHeaders.authorizationHeader);
  }
}
