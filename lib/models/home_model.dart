



class HomeModel {
  String? result;
  String? message;
  Data? data;

  HomeModel({this.result, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  Home? home;

  Data({this.home});

  Data.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ? Home.fromJson(json['home']) : null;
  }
}

class Home {
  List<Plan>? plan = [];
  List<TopRatedPlaces>? topRatedPlaces = [];
  List<MostPopularPlaces>? mostPopularPlaces = [];
  List<NearestPlaces>? nearestPlaces = [];

  Home({this.plan,this.topRatedPlaces, this.mostPopularPlaces, this.nearestPlaces});

  Home.fromJson(Map<String, dynamic> json) {
    json['plan'].forEach((element) {
      plan?.add(Plan.fromJson(element));
    });

    json['top_rated_places'].forEach((element) {
      topRatedPlaces?.add(TopRatedPlaces.fromJson(element));
    });

    json['most_popular_places'].forEach((element) {
      mostPopularPlaces?.add(MostPopularPlaces.fromJson(element));
    });

    json['nearest_places'].forEach((element) {
      nearestPlaces?.add(NearestPlaces.fromJson(element));
    });
  }
}

class Plan {
  int? id;
  String? title;
  String? description;
  String? images;
  double? rating;
  int? reviewsCount;
  bool? favourite;
  Plan({
    this.id,
    this.title,
    this.description,
    this.images,
    this.rating,
    this.reviewsCount,
    this.favourite,
  });
  Plan.fromJson(Map<String, dynamic> json) {
    id= json['id'];
    title= json['title'];
    description= json['description'];
    images= json['images'];
    rating= json['rating'].toDouble();
    reviewsCount= json['reviews_count'];
    favourite= json['favourite'];
  }

}

class TopRatedPlaces {
  int? id;
  String? name;
  String? description;
  String? city;
  String? tag;
  String? image;
  double? lat;
  double? lng;
  double? distance;
  double? rating;
  int? reviews_count;
  bool? favourite;

  TopRatedPlaces(
      {this.id,
        this.name,
        this.description,
        this.city,
        this.tag,
        this.image,
        this.lat,
        this.lng,
        this.distance,
        this.rating,
        this.reviews_count,
        this.favourite});

  TopRatedPlaces.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    city = json['city'];
    tag = json['tag'];
    image = json['image'];
    lat = json['lat'];
    lng = json['lng'];
    distance = json['distance'].toDouble();
    rating = json['rating'].toDouble();
    reviews_count = json['reviews_count'];
    favourite = json['favourite'];
  }
}

class MostPopularPlaces {
  int? id;
  String? name;
  String? description;
  String? image;
  String? city;
  String? tag;
  double? lat;
  double? lng;
  double? distance;
  double? rating;
  int? reviews_count;
  bool? favourite;

  MostPopularPlaces(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.city,
        this.tag,
        this.lat,
        this.lng,
        this.distance,
        this.rating,
        this.reviews_count,
        this.favourite});

  MostPopularPlaces.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    city = json['city'];
    tag = json['tag'];
    lat = json['lat'];
    lng = json['lng'];
    distance = json['distance'].toDouble();
    rating = json['rating'].toDouble();
    reviews_count = json['reviews_count'];
    favourite = json['favourite'];
  }
}

class NearestPlaces {
  int? id;
  String? name;
  String? description;
  String? city;
  String? tag;
  String? image;
  double? lat;
  double? lng;
  double? distance;
  double? rating;
  int? reviews_count;
  bool? favourite;

  NearestPlaces({
    this.id,
    this.name,
    this.description,
    this.city,
    this.tag,
    this.image,
    this.lat,
    this.lng,
    this.distance,
    this.rating,
    this.reviews_count,
    this.favourite,
  });

  NearestPlaces.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    city = json['city'];
    tag = json['tag'];
    image = json['image'];
    lat = json['lat'];
    lng = json['lng'];
    distance = json['distance'].toDouble();
    rating = json['rating'].toDouble();
    reviews_count = json['reviews_count'];
    favourite = json['favourite'];
  }
}




















// class HomeModel {
//   String? result;
//   String? message;
//   Data? data;
//
//   HomeModel({this.result, this.message, this.data});
//
//   HomeModel.fromJson(Map<String, dynamic> json) {
//     result = json['result'];
//     message = json['message'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
// }
//
// class Data {
//   Home? home;
//
//   Data({this.home});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     home = json['home'] != null ? Home.fromJson(json['home']) : null;
//   }
// }
//
// class Home {
//   List<Plan>? plan = [];
//   List<TopRatedPlaces>? topRatedPlaces = [];
//   List<MostPopularPlaces>? mostPopularPlaces = [];
//   List<NearestPlaces>? nearestPlaces = [];
//
//   Home({this.plan,this.topRatedPlaces, this.mostPopularPlaces, this.nearestPlaces});
//
//   Home.fromJson(Map<String, dynamic> json) {
//     json['plan'].forEach((element) {
//       plan?.add(Plan.fromJson(element));
//     });
//
//     json['top_rated_places'].forEach((element) {
//       topRatedPlaces?.add(TopRatedPlaces.fromJson(element));
//     });
//
//     json['most_popular_places'].forEach((element) {
//       mostPopularPlaces?.add(MostPopularPlaces.fromJson(element));
//     });
//
//     json['nearest_places'].forEach((element) {
//       nearestPlaces?.add(NearestPlaces.fromJson(element));
//     });
//   }
// }
//
// class Plan {
//   int? id;
//   String? title;
//   String? description;
//   String? images;
//   bool? favourite;
//   double? rating;
//
//   int? reviewsCount;
//   Plan({
//     this.id,
//     this.title,
//     this.description,
//     this.images,
//     this.reviewsCount,
//     this.rating,
//
//   });
//   Plan.fromJson(Map<String, dynamic> json) {
//     id= json['id'];
//     title= json['title'];
//     description= json['description'];
//     images= json['images'];
//     rating= json['rating'];
//
//     reviewsCount= json['reviews_count'];
//     favourite= json['favourite'] ?? false;
//   }
//
// }
//
// class TopRatedPlaces {
//   int? id;
//   String? name;
//   String? description;
//   String? image;
//   double? lat;
//   double? lng;
//   String? city;
//   String? tag;
//   double? rating;
//   int? reviewsCount;
//   bool? favourite;
//
//   TopRatedPlaces(
//       {this.id,
//         this.name,
//         this.description,
//         this.image,
//         this.lat,
//         this.lng,
//         this.reviewsCount,
//         this.favourite,
//         this.city,
//         this.tag,
//         this.rating
//
//
//       });
//
//   TopRatedPlaces.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     image = json['image'];
//     lat = json['lat'];
//     lng = json['lng'];
//     city = json['city'];
//     tag = json['tag'];
//     reviewsCount = json['reviews_count'];
//     favourite = json['favourite'];
//     rating = json['rating'];
//   }
// }
//
// class MostPopularPlaces {
//   int? id;
//   String? name;
//   String? description;
//   String? image;
//   double? lat;
//   double? lng;
//   double? rating;
//   int? reviews_count;
//   String? city;
//   String? tag;
//   bool? favourite;
//
//   MostPopularPlaces(
//       {this.id,
//         this.name,
//         this.description,
//         this.image,
//         this.lat,
//         this.lng,
//         this.reviews_count,
//         this.favourite,
//         this.city,
//         this.tag,
//         this.rating,
//       });
//
//   MostPopularPlaces.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     image = json['image'];
//     lat = json['lat'];
//     lng = json['lng'];
//     rating = json['rating'];
//     city = json['city'];
//     tag = json['tag'];
//     reviews_count = json['reviews_count'];
//     favourite = json['favourite'];
//   }
// }
//
// class NearestPlaces {
//   int? id;
//   String? name;
//   String? description;
//   String? image;
//   double? lat;
//   double? lng;
//   double? rating;
//   int? reviews_count;
//   bool? favourite;
//   String? city;
//   String? tag;
//   NearestPlaces({
//     this.id,
//     this.name,
//     this.description,
//     this.image,
//     this.lat,
//     this.lng,
//     this.reviews_count,
//     this.favourite,
//     this.city,
//     this.tag,
//     this.rating,
//   });
//
//   NearestPlaces.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     image = json['image'];
//     lat = json['lat'];
//     lng = json['lng'];
//     reviews_count = json['reviews_count'];
//     favourite = json['favourite'];
//     city = json['city'];
//     tag = json['tag'];
//     rating = json['rating'];
//   }
// }