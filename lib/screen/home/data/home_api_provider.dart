import 'package:get/get.dart';
import 'package:testgetx/config/config.dart';
import 'package:testgetx/screen/home/model/productModel.dart';

// ignore: one_member_abstracts
abstract class IHomeProvider {
  Future<Response<CasesModel>> getRequest(String path);
  Future<Response<CasesModel>> postRequest(String path,pid);
}

class HomeProvider extends GetConnect implements IHomeProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => CasesModel.fromRawJson(val);
    httpClient.baseUrl = Config.API_URL;
    super.onInit();
  }

  @override
  Future<Response<CasesModel>> getRequest(String path) => get(path);

  @override
  Future<Response<CasesModel>> postRequest(String path,body) => post(path, body);
}
