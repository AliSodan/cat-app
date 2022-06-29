import 'package:cats_app/features/cat_list/domain/entities/cat_list_entity.dart';
import 'package:cats_app/features/cat_list/domain/entities/image_entity.dart';
import 'package:cats_app/features/cat_list/domain/entities/weightt_entity.dart';

class CatListModel extends CatListEntity {
  Weight weight;
  String id;
  String name;

  String origin;

  String description;

  String wikipediaUrl;

  Image image;

  CatListModel(
      {required this.weight,
      required this.id,
      required this.name,
      required this.origin,
      required this.description,
      required this.wikipediaUrl,
      required this.image})
      : super(
            weightEntity: weight,
            id: id,
            origin: origin,
            name: name,
            description: description,
            wikipedia_url: wikipediaUrl,
            image: image);

  factory CatListModel.fromJson(Map<String, dynamic> json) {
    return CatListModel(
        weight: /* json['weight'] */Weight.fromJson(json['weight']),
        id: json['id'],
        name: json['name'],
        origin: json['origin'],
        description: json['description'],
        wikipediaUrl: json['wikipedia_url'],
        image: Image.fromJson(json['image']));
  }
}

class Weight extends WeightEntity {
  // String imperial;
  // String metric;

  Weight({required String imperial, required String metric})
      : super(imperial: imperial, metric: metric);

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(imperial: json['imperial'], metric: json['metric']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imperial'] = this.imperial;
    data['metric'] = this.metric;
    return data;
  }
}

class Image extends ImageEntity {
  /* String? id;
  int? width;
  int? height;
  String? url; */

  Image({required String url})
      : super(
          url: url,
        );

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(url: json['url']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['url'] = this.url;
    return data;
  }
}
