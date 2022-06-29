import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable{
  String url;
  ImageEntity ({required this.url});

  @override
  // TODO: implement props
  List<Object?> get props =>[url];
}