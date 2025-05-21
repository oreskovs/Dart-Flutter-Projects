import 'package:flutter/material.dart';

import 'package:shoppinglist_app/models/category.dart';

const categories = {
  Types.vegetables: Category('Vegetables', Color.fromARGB(255, 0, 255, 128)),
  Types.fruit: Category('Fruit', Color.fromARGB(255, 145, 255, 0)),
  Types.meat: Category('Meat', Color.fromARGB(255, 255, 102, 0)),
  Types.dairy: Category('Dairy', Color.fromARGB(255, 0, 208, 255)),
  Types.carbs: Category('Carbs', Color.fromARGB(255, 0, 60, 255)),
  Types.sweets: Category('Sweets', Color.fromARGB(255, 255, 149, 0)),
  Types.spices: Category('Spices', Color.fromARGB(255, 255, 187, 0)),
  Types.convenience: Category('Convenience', Color.fromARGB(255, 191, 0, 255)),
  Types.hygiene: Category('Hygiene', Color.fromARGB(255, 149, 0, 255)),
  Types.other: Category('Other', Color.fromARGB(255, 0, 225, 255)),
};
