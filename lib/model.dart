class Model{
  String? image, url, source,label;
  List<String>? ingredients;
  double? calories;
  String? shareAs;
  List<String> healthLabels;
  List<String> cuisineType;
  List<String> ingredientLines;



  Model({this.image,this.url,this.source,this.label,this.calories,this.ingredients,this.shareAs,required this.healthLabels,required this.cuisineType, required this.ingredientLines,   });
//      required this.ingredientLines,

  factory Model.fromJson(Map<String, dynamic>json)=>Model(
    image:  json["image"],
    label: json["label"],
    url: json["url"],
    source: json["source"],
    //ingredients: List<String>.from(json["ingredients"].map((x) => ingredients.fromJson(x))),
    ingredientLines: List<String>.from(json["ingredientLines"].map((x) => x)),
    calories: json["calories"]?.toDouble(),
    cuisineType:  List<String>.from(json["cuisineType"].map((x) => x)),
    healthLabels: List<String>.from(json["healthLabels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() =>{

    "image": image,
    "label": label,
    "source": source,
    "url": url,
    "ingredientLines": List<dynamic>.from(ingredientLines.map((x) => x)),
    "calories": calories,
    "cuisineType": List<dynamic>.from(cuisineType.map((x) => x)),
    "healthLabels": List<dynamic>.from(healthLabels.map((x) => x)),


  };

}

