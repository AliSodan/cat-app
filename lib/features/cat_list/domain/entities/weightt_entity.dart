import 'package:equatable/equatable.dart';

class WeightEntity extends Equatable{
  final String imperial;
  final String metric;
 const WeightEntity ({required this.imperial,required this.metric});
  @override
  // TODO: implement props
  List<Object?> get props => [imperial,metric];

}