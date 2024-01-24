import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/layout_constant.dart';
import '../../controller/services/category_items_list_provider.dart';
import '../screens/resturants.dart';

class CatigoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategoryItemListService>(context);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: categoryData.categoryList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Resturants.id, arguments: {
              'categoryimage': categoryData.categoryList[index].image,
              'categoryid': categoryData.categoryList[index].id,
              'category': index
            });
          },
          child: Card(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(categoryData.categoryList[index].image),
                      fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.9),
                      Colors.black.withOpacity(.3),
                    ])),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                            "", // '${AppLocale.of(BuildContext, context).getTranslations(categoryData.categoryList[index].name)}',
                            style: categoryS),
                      ),
                      Transform.translate(
                        offset: const Offset(50, -50),
                      ),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
