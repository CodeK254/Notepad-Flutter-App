import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ShareFiles{
  static Future<void> shareText(String text) async {
    try{
      ShareResult shareResult = await Share.share(
        text, 
        subject: "codekarma1003@gmail.com",
      );
      if(shareResult.status != ShareResultStatus.success){
        Get.snackbar(
          "Failed!!!",
          "Unable to share the file",
        );
      }
    } catch(e){
      Get.snackbar(
        "Error!!!",
        "$e"
      );
    }
  }
}