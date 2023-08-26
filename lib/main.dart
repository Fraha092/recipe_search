import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_search/model.dart';

import 'RecipeDetailsPage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  final TextEditingController searchController=TextEditingController();

  List<Model> list=[];
  List<Model> searchedList=[];
  String? text;
  String? health;
  String? type;
  String? query;
  bool data=true;
 // final url='https://api.edamam.com/search?q=chicken&app_id=cc8c3533&app_key=07639895be5a68794e6338cf0992b049&from=0&to=100&calories=591-722&health=alcohol-free';

  getApiData()async{
    final url='https://api.edamam.com/search?q=chicken&app_id=cc8c3533&app_key=07639895be5a68794e6338cf0992b049&from=0&to=20';
    var response=await http.get(Uri.parse(url));
    Map json=jsonDecode(response.body);
    print("response data:::${response.body.toString()}");

    json["hits"].forEach((e){
      Model model=Model(
        url: e['recipe']['uri'],
        image: e['recipe']['image'],
        source: e['recipe']['source'],
        label: e['recipe']['label'],
        calories: e['recipe']['calories'],
        ingredients: (e['recipe']['ingredients'] as List<dynamic>)
            .map((ingredient) => ingredient['text'].toString())
            .toList(),
        shareAs: e['recipe']['shareAs'],
        healthLabels: (e['recipe']['healthLabels'] as List<dynamic>)
            .map((health) => health.toString())
            .toList(),
        cuisineType: (e['recipe']['cuisineType'] as List<dynamic>)
            .map((type) => type.toString())
            .toList(),

      );
      setState(() {
        list.add(model);
      });
    });
    searchedList=List.from(list);
  }

  void filteredList(String query){
    setState(() {
      searchedList=list.where((model) => model.label!.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/image 13.png', width: 30, height: 42),
                        Container(
                          height: 40,
                          width: 250,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.15),
                                blurRadius: 3,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: TextField(
                            controller: searchController,
                            cursorColor: Colors.black26,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search...',
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFCBCFD4),
                                fontFamily: 'Open Sans',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                              ),
                              prefixIcon: Icon(Icons.search, size: 18, color: Color(0xFF3C444C)),
                            ),
                            onChanged: (v){
                              filteredList(v);
                            },
                            // onTap: () async {
                            // },
                          ),
                        ),
                        Icon(Icons.menu, size: 30),
                      ],
                    ),
                    Divider(thickness: 3, color: Colors.grey.shade100),


                   // SizedBox(height: 10,),

                    GridView.builder(
                      shrinkWrap: true,
                        primary: true,
                        physics: ScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 160
                        ),
                        itemCount: searchedList.length,
                        itemBuilder: (context, i){
                          final x=searchedList[i];
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeDetailsPage(
                                image: searchedList[i].image.toString(),
                                url: searchedList[i].url.toString(),
                                source: searchedList[i].source.toString(),
                                label: searchedList[i].label.toString(),
                                calories: searchedList[i].calories.toString(),
                                shareAs: searchedList[i].shareAs.toString(),
                                ingredients: searchedList[i].ingredients.toString(),
                                healthLabels: searchedList[i].healthLabels.toString(),
                                cuisineType: searchedList[i].cuisineType.toString(),)));
                            },
                            child: Card(
                              borderOnForeground: false,
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,width: 280,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(x.image.toString()),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height:40,
                                         margin: EdgeInsets.all(3),
                                          color: Colors.grey.withOpacity(0.5),
                                          child: Text(x.label.toString(),style: TextStyle(color: Colors.white,),),
                                        ),
                                       // SizedBox(height: 48,),
                                        Container(
                                         margin: EdgeInsets.all(3),
                                          color: Colors.black.withOpacity(0.5),
                                          child: Text(x.source.toString(),style: TextStyle(color: Colors.white70,),),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 4,top: 4),
                                      child: Row(
                                        children: [
                                          Text('${x.calories?.toStringAsFixed(0)} CAL'),
                                         SizedBox(height: 20,width: 30,child: Center(child: Text('|')),),
                                          Text('${x.ingredients!.length.toString()} INGR'),
                                        ],
                                      ),
                                    ),
                                  ),
                                 // Text('${x.ingredients!.length.toString()} ingr'),

                                ],
                              ),
                            ),
                          );
                        }
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

