import 'package:get/get.dart';
import 'package:rearrange/core/helpers.dart';

class HomeController extends GetxController {
  RxList currentList = [].obs;
  RxBool enabled = true.obs;

  @override
  void onInit() {
    if (currentList.isEmpty) {
      currentList.value = Helpers
          .initialColorList; //Filling my global list with the initial value
    }
    super.onInit();
  }

  void swap(int oldInd, int newInd) {
    var temp = currentList[oldInd];
    currentList[oldInd] = currentList[newInd];
    currentList[newInd] = temp;
  }
}
