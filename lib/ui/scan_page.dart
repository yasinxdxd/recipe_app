import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recipe_app/ui/root_page.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  //List of Recipies data
  static List<Recipe> recipeList = [
    Recipe(
        recipeId: 0,
        category: "Italian",
        recipeName: "Cheseey Pizza",
        rating: 0,
        cookingTime: "45 min",
        imageURL: 'assets/images/pizza image.jpg',
        isFavorated: false,
        decription: "Delicious pizza you have never eat before!",
        isSelected: false),
    Recipe(
        recipeId: 1,
        category: "Turkish",
        recipeName: "Red Lentil Soup",
        rating: 0,
        cookingTime: "25 min",
        imageURL: 'assets/images/soup image.jpg',
        isFavorated: false,
        decription:
            "Delicious traditional tastes from the bridge between Middle East and Europe!",
        isSelected: false),
  ];

  //Get the favorated items
  static List<Recipe> getFavoritedRecipies() {
    List<Recipe> _travelList = ScanPage.recipeList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  /*
  static List<Recipe> addedToCartRecipies() {
    List<Recipe> _selectedRecipies = ScanPage.recipeList;
    return _selectedRecipies
        .where((element) => element.isSelected == true)
        .toList();
  }*/

  static bool createRecipe(
      String name, String cookingTime, String category, String description) {
    List<Recipe> _recipeList = ScanPage.recipeList;

    bool res = !(name.isEmpty ||
        cookingTime.isEmpty ||
        category.isEmpty ||
        description.isEmpty);
    if (res) {
      _recipeList.add(
        Recipe(
            recipeId: ScanPage.recipeList.length,
            category: category,
            recipeName: name,
            rating: 0,
            cookingTime: cookingTime,
            imageURL: '', //assets/images/corba.png
            isFavorated: false,
            decription: description,
            isSelected: false),
      );
    }

    return res;
  }

  static void deleteRecipe(int index) {
    List<Recipe> _recipeList = ScanPage.recipeList;
    _recipeList.removeAt(index);
  }

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String name = "";
  String category = "";
  String cookingTime = "";
  String description = "";

  List<Recipe> _recipeList = ScanPage.recipeList;

  @override
  void initState() {
    _recipeList = ScanPage.recipeList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    _recipeList = ScanPage.recipeList;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Constants.primaryColor.withOpacity(.15),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('favorite');
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Constants.primaryColor.withOpacity(.15),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          color: Constants.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
            top: 100,
            right: 20,
            left: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Create a Recipe!',
                      style: TextStyle(
                        color: Constants.primaryColor.withOpacity(.80),
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: size.width * 0.4,
                        child: TextField(
                          onChanged: (value) {
                            name = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Name",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: size.width * 0.4,
                        child: TextField(
                          onChanged: (value) {
                            category = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Catogary",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: size.width * 0.4,
                        child: TextField(
                          onChanged: (value) {
                            cookingTime = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Cooking Time",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: size.width * 0.4,
                        child: TextField(
                          onChanged: (value) {
                            description = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Description",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      width: 600,
                      height: 600,
                      child: FittedBox(
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(
                              () {
                                bool res = ScanPage.createRecipe(
                                    name, cookingTime, category, description);

                                if (res) {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: const RootPage(),
                                          type:
                                              PageTransitionType.bottomToTop));
                                }
                              },
                            );
                          },
                          child: const Text("Create"),
                          backgroundColor: Constants.primaryColor,
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
