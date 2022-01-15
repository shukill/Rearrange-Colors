import 'package:get/get.dart';
import '../../../core/helpers.dart';

class HomeController extends GetxController {
  RxList currentList = [].obs;
  RxBool enabled = true.obs;

  @override
  void onInit() {
    if (currentList.isEmpty) {
      currentList.value =
          Helpers().initialList; //Filling my global list with the initial value
    }
    super.onInit();
  }

  void swap(int oldInd, int newInd) {
    var temp = currentList.removeAt(oldInd);
    currentList.insert(newInd, temp);
    update();
  }

  void resetList() {
    enabled(true);
    currentList.value = Helpers().initialList;
  }
}
