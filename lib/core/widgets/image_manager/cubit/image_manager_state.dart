import 'package:image_picker/image_picker.dart';

abstract class ImageManagerState{}
class ImageManagerInitialState extends ImageManagerState{}
class ImageManagerPickedState extends ImageManagerState
{
  XFile image;
  ImageManagerPickedState({required this.image});
}
