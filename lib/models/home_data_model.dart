class HomeModel{
  bool? status;
  HomeDataModel? data;
  HomeModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel{
   List<BannerModel>? banners=[];
   List<ProductModel>? products=[];

  HomeDataModel.fromJson(Map<String,dynamic> json){
    json['banners'].forEach((element){
      banners!.add(BannerModel.fromJson(element));
    });
    json['products'].forEach((element){
      products!.add(ProductModel.fromJson(element));
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
  late int price;
  late int oldPrice;
  late String image;
  late String name;
  late int discount;
  late String description;
  late List<dynamic> images;
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