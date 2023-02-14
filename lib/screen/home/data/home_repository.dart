import 'package:testgetx/config/config.dart';
import 'package:testgetx/screen/home/model/productModel.dart';

import 'home_api_provider.dart';
import 'repository_adapter.dart';

class HomeRepository implements IHomeRepository {
  HomeRepository({required this.provider});
  final IHomeProvider provider;

  @override
  Future<CasesModel> getProduct() async {
    final cases = await provider.getRequest(Config.getProduct);
    if (cases.status.hasError) {
      return Future.error(cases.statusText!);
    } else {
      return cases.body!;
    }
  }

  @override
  Future<CasesModel> deleteProduct(body) async {
    final cases = await provider.postRequest(Config.deleteProduct,body);
    if (cases.status.hasError) {
      return Future.error(cases.statusText!);
    } else {
      return cases.body!;
    }
  }

  @override
  Future<CasesModel> addProduct(body) async{
    final cases = await provider.postRequest(Config.addProduct,body);
    if (cases.status.hasError) {
      return Future.error(cases.statusText!);
    } else {
      return cases.body!;
    }
  }

  @override
  Future<CasesModel> editProduct(body) async{
    final cases = await provider.postRequest(Config.editProduct,body);
    if (cases.status.hasError) {
      return Future.error(cases.statusText!);
    } else {
      return cases.body!;
    }
  }

}
