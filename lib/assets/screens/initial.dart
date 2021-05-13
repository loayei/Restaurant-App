import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurants_app/assets/helpers/screen_nav.dart';
import 'package:restaurants_app/assets/helpers/style.dart';
import 'package:restaurants_app/assets/providers/appLoading.dart';
import 'package:restaurants_app/assets/providers/category.dart';
import 'package:restaurants_app/assets/providers/products.dart';
import 'package:restaurants_app/assets/providers/restaurant.dart';
import 'package:restaurants_app/assets/providers/userAuth.dart';
import 'package:restaurants_app/assets/screens/login.dart';
import 'package:restaurants_app/assets/screens/restaurant.dart';
import 'package:restaurants_app/assets/screens/searchedProducts.dart';
import 'package:restaurants_app/assets/widgets/categories.dart';
import 'package:restaurants_app/assets/widgets/featured_products.dart';
import 'package:restaurants_app/assets/widgets/loading.dart';
import 'package:restaurants_app/assets/widgets/restaurant.dart';
import 'package:restaurants_app/assets/widgets/title.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'category.dart';

class Initial extends StatefulWidget {
  @override
  _InitialState createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProv>(context);
    final categoryProv = Provider.of<CategoryProv>(context);
    final restaurantProv = Provider.of<RestaurantProv>(context);
    final productProv = Provider.of<ProductProv>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        elevation: 0.5,
        backgroundColor: black,
        title: CustomText(
          text: "RestaurantApp",
          color: white,
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  changeScreen(context, ShoppingCartScr());
                },
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: black,
                ),
                accountName: CustomText(
                  text: user.userMod?.name,
                  color: white,
                  weight: FontWeight.bold,
                  size: 18,
                ),
                accountEmail: CustomText(
                  text: user.userMod?.email,
                  color: grey,
                )),
            ListTile(
              onTap: () {
                changeScreen(context, Initial());
              },
              leading: Icon(Icons.home_outlined),
              title: CustomText(
                text: "Home",
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.bookmark_border_outlined),
              title: CustomText(
                text: "Order History",
              ),
            ),
            ListTile(
              onTap: () {
                changeScreen(context, ShoppingCartScr());
              },
              leading: Icon(Icons.shopping_cart_outlined),
              title: CustomText(
                text: "Cart",
              ),
            ),
            ListTile(
              onTap: () {
                user.signOut();
                changeScreenReplacement(context, LoginScreen());
              },
              leading: Icon(Icons.exit_to_app_outlined),
              title: CustomText(
                text: "Sign Out",
              ),
            ),
          ],
        ),
      ),
      backgroundColor: white,
      body: app.isLoading
          ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Loading()],
              ),
            )
          : SafeArea(
              child: ListView(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: black,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, left: 8, right: 8, bottom: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.search,
                            color: red,
                          ),
                          title: TextField(
                            textInputAction: TextInputAction.search,
                            onSubmitted: (pattern) async {
                              app.loadingSwitch();
                              await productProv.search(productName: pattern);
                              changeScreen(context, SearchedProductsScreen());
                              app.loadingSwitch();
                            },
                            decoration: InputDecoration(
                              hintText: "Search for food or restaurant",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryProv.categories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              // app.LoadingSwitch();
                              await productProv.startProductsByCategory(
                                  categoryName:
                                      categoryProv.categories[index].name);
                              //app.LoadingSwitch();
                              changeScreen(
                                  context,
                                  CategoryScreen(
                                    categoryModel:
                                        categoryProv.categories[index],
                                  ));
                            },
                            child: CategoryWidget(
                              category: categoryProv.categories[index],
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                          text: "Featured",
                          size: 20,
                          color: grey,
                        ),
                      ],
                    ),
                  ),
                  Featured(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomText(
                          text: "Popular restaurants",
                          size: 20,
                          color: grey,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: restaurantProv.restaurants
                        .map((item) => GestureDetector(
                              onTap: () async {
                                app.loadingSwitch();
                                await productProv.startProductsByRestaurant(
                                    restaurantId: item.id);
                                app.loadingSwitch();
                                changeScreen(
                                    context,
                                    RestaurantScreen(
                                      restaurantModel: item,
                                    ));
                              },
                              child: RestaurantWidget(
                                restaurant: item,
                              ),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
    );
  }
}
