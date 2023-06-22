import 'package:image_picker/image_picker.dart';

selectPickImage(ImageSource imageSource) async{
  final ImagePicker _image = ImagePicker();

  XFile? _file = await _image.pickImage(source: imageSource);
  if(_file != null){
    return await _file.readAsBytes();
  }
  print("Fotoğraf çekerken hata");
}