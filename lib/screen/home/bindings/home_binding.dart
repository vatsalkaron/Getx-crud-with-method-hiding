import 'package:get/get.dart';
import 'package:testgetx/screen/home/controllers/product_controller.dart';
import '../data/home_api_provider.dart';
import '../data/home_repository.dart';
import '../data/repository_adapter.dart';

class HomeBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<IHomeProvider>(() => HomeProvider()),
      Bind.lazyPut<IHomeRepository>(() => HomeRepository(provider: Get.find())),
      Bind.lazyPut(() => ProductController(homeRepository: Get.find())),
    ];
  }
}
