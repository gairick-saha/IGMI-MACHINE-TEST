class SearchTableModel {
  SearchTableModel({
    this.status,
    this.message,
    this.listed,
  });

  final int? status;
  final String? message;
  final List<ListedBusniess>? listed;

  SearchTableModel copyWith({
    int? status,
    String? message,
    List<ListedBusniess>? listed,
  }) =>
      SearchTableModel(
        status: status ?? this.status,
        message: message ?? this.message,
        listed: listed ?? this.listed,
      );

  factory SearchTableModel.fromJson(Map<String, dynamic> json) =>
      SearchTableModel(
        status: json["status"],
        message: json["message"],
        listed: json["listed"] == null
            ? []
            : List<ListedBusniess>.from(
                json["listed"]!.map((x) => ListedBusniess.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "listed": listed == null
            ? []
            : List<dynamic>.from(listed!.map((x) => x.toJson())),
      };
}

class ListedBusniess {
  ListedBusniess({
    this.businessName,
    this.image,
    this.rating,
    this.id,
    this.address,
    this.description,
    this.restaurantType,
    this.timeAvailable = const [],
    this.seatAvailable,
    this.getTime,
    this.serviceProvider,
    this.price,
  });

  final String? businessName;
  final String? image;
  final String? rating;
  final String? id;
  final String? address;
  final String? description;
  final List<RestaurantType>? restaurantType;
  final List<TimeAvailable> timeAvailable;
  final String? seatAvailable;
  final String? getTime;
  final String? serviceProvider;
  final dynamic price;

  ListedBusniess copyWith({
    String? businessName,
    String? image,
    String? rating,
    String? id,
    String? address,
    String? description,
    List<RestaurantType>? restaurantType,
    List<TimeAvailable>? timeAvailable,
    String? seatAvailable,
    String? getTime,
    String? serviceProvider,
    dynamic price,
  }) =>
      ListedBusniess(
        businessName: businessName ?? this.businessName,
        image: image ?? this.image,
        rating: rating ?? this.rating,
        id: id ?? this.id,
        address: address ?? this.address,
        description: description ?? this.description,
        restaurantType: restaurantType ?? this.restaurantType,
        timeAvailable: timeAvailable ?? this.timeAvailable,
        seatAvailable: seatAvailable ?? this.seatAvailable,
        getTime: getTime ?? this.getTime,
        serviceProvider: serviceProvider ?? this.serviceProvider,
        price: price ?? this.price,
      );

  factory ListedBusniess.fromJson(Map<String, dynamic> json) => ListedBusniess(
        businessName: json["business_name"],
        image: json["image"],
        rating: json["rating"],
        id: json["id"],
        address: json["address"],
        description: json["description"],
        restaurantType: json["restaurant_type"] == null
            ? []
            : List<RestaurantType>.from(json["restaurant_type"]!
                .map((x) => RestaurantType.fromJson(x))),
        timeAvailable: json["time_available"] == null
            ? []
            : List<TimeAvailable>.from(
                json["time_available"]!.map((x) => TimeAvailable.fromJson(x))),
        seatAvailable: json["seat_available"],
        getTime: json["get_time"],
        serviceProvider: json["service_provider"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "business_name": businessName,
        "image": image,
        "rating": rating,
        "id": id,
        "address": address,
        "description": description,
        "restaurant_type": restaurantType == null
            ? []
            : List<dynamic>.from(restaurantType!.map((x) => x.toJson())),
        "time_available":
            List<dynamic>.from(timeAvailable.map((x) => x.toJson())),
        "seat_available": seatAvailable,
        "get_time": getTime,
        "service_provider": serviceProvider,
        "price": price,
      };
}

class RestaurantType {
  RestaurantType({
    this.name,
    this.id,
  });

  final String? name;
  final String? id;

  RestaurantType copyWith({
    String? name,
    String? id,
  }) =>
      RestaurantType(
        name: name ?? this.name,
        id: id ?? this.id,
      );

  factory RestaurantType.fromJson(Map<String, dynamic> json) => RestaurantType(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

class TimeAvailable {
  TimeAvailable({
    this.time,
  });

  final String? time;

  TimeAvailable copyWith({
    String? time,
  }) =>
      TimeAvailable(
        time: time ?? this.time,
      );

  factory TimeAvailable.fromJson(Map<String, dynamic> json) => TimeAvailable(
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
      };
}
