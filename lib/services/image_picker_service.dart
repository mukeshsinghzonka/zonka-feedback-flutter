import 'package:image_picker/image_picker.dart';

class ImagePickerService{

 final ImagePicker picker = ImagePicker();

  Future<XFile?> pickImage() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return pickedFile;
  }

  Future<XFile?> takeImage() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
    return pickedFile;
  }

  

}