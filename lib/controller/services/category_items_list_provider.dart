import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../model/resurants_model.dart';
import '../resturant_list_provider.dart';

class CategoryList {
  final int id;
  final String name;
  final String image;
  const CategoryList(
      {required this.name, required this.image, required this.id});
}

class CategoryItemListService with ChangeNotifier {
  final List<CategoryList> _categoryList = [
    CategoryList(id: 1, name: 'all', image: 'assets/images/home/plate.jpg'),
    CategoryList(
        id: 2, name: 'fastfood', image: 'assets/images/home/burger.jpg'),
    CategoryList(
        id: 3, name: 'healthyfood', image: 'assets/images/home/sallad.jpg'),
    CategoryList(id: 4, name: 'pizza', image: 'assets/images/home/pizza.jpg'),
    CategoryList(
        id: 5, name: 'sandwichis', image: 'assets/images/home/sanwich.jpg'),
    CategoryList(
        id: 6, name: 'desserts', image: 'assets/images/home/disserts.jpg'),
    CategoryList(id: 7, name: 'coffe', image: 'assets/images/home/coffe.jpg'),
    CategoryList(id: 8, name: 'jucies', image: 'assets/images/home/juices.jpg'),
  ];
  List<CategoryList> get categoryList {
    return [..._categoryList];
  }

  List<ResturantList> filtterR(int categoryId, BuildContext context) {
    final allR = Provider.of<ResturantListProvider>(context).resturantlist;
    List<ResturantList> filtterdR = [];
    switch (categoryId) {
      case 1:
        filtterdR = allR;

        break;
      case 2:
        for (int i = 0; i < allR.length; i++) {
          for (int j = 0; j < allR[i].category.length; j++) {
            if (allR[i].category[j] == 'fastfood') {
              filtterdR.add(allR[i]);
            }
          }
        }
        print('1 executed');
        break;
      case 3:
        for (int i = 0; i < allR.length; i++) {
          for (int j = 0; j < allR[i].category.length; j++) {
            if (allR[i].category[j] == 'healthyfood') {
              filtterdR.add(allR[i]);
            }
          }
        }
        break;
      case 4:
        for (int i = 0; i < allR.length; i++) {
          for (int j = 0; j < allR[i].category.length; j++) {
            if (allR[i].category[j] == 'pizza') {
              filtterdR.add(allR[i]);
            }
          }
        }
        break;
      case 5:
        for (int i = 0; i < allR.length; i++) {
          for (int j = 0; j < allR[i].category.length; j++) {
            if (allR[i].category[j] == 'sandwich') {
              filtterdR.add(allR[i]);
            }
          }
        }
        break;
      case 6:
        for (int i = 0; i < allR.length; i++) {
          for (int j = 0; j < allR[i].category.length; j++) {
            if (allR[i].category[j] == 'dessert') {
              filtterdR.add(allR[i]);
            }
          }
        }
        break;
      case 7:
        for (int i = 0; i < allR.length; i++) {
          for (int j = 0; j < allR[i].category.length; j++) {
            if (allR[i].category[j] == 'coffe') {
              filtterdR.add(allR[i]);
            }
          }
        }
        break;
      case 8:
        for (int i = 0; i < allR.length; i++) {
          for (int j = 0; j < allR[i].category.length; j++) {
            if (allR[i].category[j] == 'jucies') {
              filtterdR.add(allR[i]);
            }
          }
        }
        break;
      default:
        // ignore: unnecessary_statements
        filtterdR;
    }

    return filtterdR;
  }
}
