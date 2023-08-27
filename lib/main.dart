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

  Future<List<Model>> fetchData() async {
    final response = await http.get(Uri.parse(
        "https://api.edamam.com/search?q=chicken&app_id=f8a801f5&app_key=91fba361c52986fcfd09242f1a23d0eb&from=0&to=20"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Model> models = [];

      for (var item in data['hits']) {
        models.add(Model.fromJson(item['recipe']));
      }

      return models;
    } else {
      throw Exception("Failed to fetch data");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getApiData();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
            children: [
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
                          width: 240,
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

                          ),
                        ),
                        Icon(Icons.menu, size: 30),
                      ],
                    ),
                    Divider(thickness: 3, color: Colors.grey.shade100),
                  ],
                ),
              ),

            ]
        ),
      ),
      body: FutureBuilder<List<Model>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                       crossAxisCount: 2,
                                     mainAxisSpacing: 10,
                                     mainAxisExtent: 160
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final model = snapshot.data![index];
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeDetailsPage(model: model,)));
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
                              image: NetworkImage(model.image.toString()),
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
                                child: Text(model.label.toString(),style: TextStyle(color: Colors.white,),),
                              ),
                              // SizedBox(height: 48,),
                              Container(
                                margin: EdgeInsets.all(3),
                                color: Colors.black.withOpacity(0.5),
                                child: Text(model.source.toString(),style: TextStyle(color: Colors.white70,),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4,top: 4),
                            child: Row(
                              children: [
                                Text('${model.calories?.toStringAsFixed(0)} CAL'),
                                SizedBox(height: 20,width: 30,child: Center(child: Text('|')),),
                                Text('${model.ingredientLines.length.toString()} INGR'),
                              ],
                            ),
                          ),
                        ),
                        // Text('${x.ingredients!.length.toString()} ingr'),

                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),


    );
  }
}

