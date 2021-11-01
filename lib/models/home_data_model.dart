class HomeModel{
  late  bool status;
  late HomeDataModel data;
  HomeModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel{
  late List<BannerModel> banners;
  late List<ProductModel> products;

  HomeDataModel.fromJson(Map<String,dynamic> json){
    json['banners'].forEach((element){
      banners.add(BannerModel.fromJson(element));
    });
    json['products'].forEach((element){
      products.add(ProductModel.fromJson(element));
    });
  }

}

class BannerModel{
  late int id;
  late String image;

  BannerModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel{
  late int id;
  late double price;
  late double oldPrice;
  late String image;
  late String name;
  late double discount;
  late String description;
  late List<String> images;
  late bool inFavorites;
  late bool inCart;

  ProductModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    image = json['image'];
    name = json['name'];
    discount = json['discount'];
    description = json['description'];
    images = json['images'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}