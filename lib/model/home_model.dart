class HomeModel {
  List<Categories>? categories;
  List<Banners>? banners;
  List<Upcoming>? upcoming;
  List<Upcoming>? nearBy;

  HomeModel()
      : categories = [],
        banners = [],
        upcoming = [],
        nearBy = [];

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(Banners.fromJson(v));
      });
    }
    if (json['upcoming'] != null) {
      upcoming = <Upcoming>[];
      json['upcoming'].forEach((v) {
        upcoming!.add(Upcoming.fromJson(v));
      });
    }
    if (json['nearBy'] != null) {
      nearBy = <Upcoming>[];
      json['nearBy'].forEach((v) {
        nearBy!.add(Upcoming.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (banners != null) {
      data['banners'] = banners!.map((v) => v.toJson()).toList();
    }
    if (upcoming != null) {
      data['upcoming'] = upcoming!.map((v) => v.toJson()).toList();
    }
    if (nearBy != null) {
      data['nearBy'] = nearBy!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? sId;
  Name? name;
  Name? image;
  String? color;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;

  Categories(
      {this.sId,
      this.name,
      this.image,
      this.color,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    image = json['image'] != null ? Name.fromJson(json['image']) : null;
    color = json['color'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['color'] = color;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }

  @override
  bool operator ==(covariant Categories other) => other.sId == sId;

  @override
  int get hashCode => sId.hashCode;
}

class Name {
  String? ar;
  String? en;

  Name({this.ar, this.en});

  Name.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ar'] = ar;
    data['en'] = en;
    return data;
  }
}

class Banners {
  String? sId;
  String? name;
  Name? image;
  int? expirationDate;
  String? route;
  String? type;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;

  Banners(
      {this.sId,
      this.name,
      this.image,
      this.expirationDate,
      this.route,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Banners.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'] != null ? Name.fromJson(json['image']) : null;
    expirationDate = json['expirationDate'];
    route = json['route'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['expirationDate'] = expirationDate;
    data['route'] = route;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }

  @override
  bool operator ==(covariant Banners other) => other.sId == sId;

  @override
  int get hashCode => sId.hashCode;
}

class Upcoming {
  String? sId;
  Name? name;
  City? city;
  List<Categories>? categories;
  List<Organizers>? organizers;
  int? startDateTime;
  Location? location;
  Name? address;
  String? bannerImage;
  String? backgroundImage;
  List<Sponsors>? sponsors;

  Upcoming(
      {this.sId,
      this.name,
      this.city,
      this.categories,
      this.organizers,
      this.startDateTime,
      this.location,
      this.address,
      this.bannerImage,
      this.backgroundImage,
      this.sponsors});

  Upcoming.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['organizers'] != null) {
      organizers = <Organizers>[];
      json['organizers'].forEach((v) {
        organizers!.add(Organizers.fromJson(v));
      });
    }
    startDateTime = json['startDateTime'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    address = json['address'] != null ? Name.fromJson(json['address']) : null;
    bannerImage = json['bannerImage'];
    backgroundImage = json['backgroundImage'];
    if (json['sponsors'] != null) {
      sponsors = <Sponsors>[];
      json['sponsors'].forEach((v) {
        sponsors!.add(Sponsors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (organizers != null) {
      data['organizers'] = organizers!.map((v) => v.toJson()).toList();
    }
    data['startDateTime'] = startDateTime;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['bannerImage'] = bannerImage;
    data['backgroundImage'] = backgroundImage;
    if (sponsors != null) {
      data['sponsors'] = sponsors!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  bool operator ==(covariant Upcoming other) => other.sId == sId;

  @override
  int get hashCode => sId.hashCode;
}

class City {
  String? sId;
  Name? name;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic iV;

  City({this.sId, this.name, this.createdAt, this.updatedAt, this.iV});

  City.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Organizers {
  String? sId;
  String? name;
  String? password;
  String? email;
  String? phone;
  bool? isActive;
  String? staffType;
  bool? superAdmin;
  int? createdAt;
  int? updatedAt;
  int? iV;
  bool? otp;

  Organizers(
      {this.sId,
      this.name,
      this.password,
      this.email,
      this.phone,
      this.isActive,
      this.staffType,
      this.superAdmin,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.otp});

  Organizers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    password = json['password'];
    email = json['email'];
    phone = json['phone'];
    isActive = json['isActive'];
    staffType = json['staffType'];
    superAdmin = json['superAdmin'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['password'] = password;
    data['email'] = email;
    data['phone'] = phone;
    data['isActive'] = isActive;
    data['staffType'] = staffType;
    data['superAdmin'] = superAdmin;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['otp'] = otp;
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}

class Sponsors {
  String? sId;
  String? logo;

  Sponsors({this.sId, this.logo});

  Sponsors.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['logo'] = logo;
    return data;
  }
}
