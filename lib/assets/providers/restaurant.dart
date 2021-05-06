import 'package:flutter/material.dart';
import 'package:restaurants_app/assets/models/restaurants.dart';
import '../models/restaurants.dart';
import '../helpers/restaurant.dart';

class RestaurantProv with ChangeNotifier {
  RestaurantServices _restaurantServices = RestaurantServices();
  List<RestaurantMod> restaurants = [];
  List<RestaurantMod> restaurantsFound = [];

  RestaurantMod restaurant;

  RestaurantProv.initialize(){
    _startRestaurants();
  }

  _startRestaurants() async {
    restaurants = await _restaurantServices.getRestaurants();
    notifyListeners();
  }

  Future search({String name}) async {
    restaurantsFound = await _restaurantServices.searchRestaurants(restaurantName: name);
    notifyListeners();
  }
}