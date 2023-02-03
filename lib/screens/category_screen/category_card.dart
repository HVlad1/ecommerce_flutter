import 'package:ecommerce_flutter/colors.dart';
import 'package:ecommerce_flutter/screens/category_screen/category_details.dart';
import 'package:ecommerce_flutter/spacing.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  CategoryDetails(title: title, icon: icon,),
            ));
      },
      child: Container(
        width: Spacings.widthCategoryCard,
        decoration: BoxDecoration(
          borderRadius: Spacings.borderRadiusCategoryCard,
          color: CustomColors.primary,
          boxShadow: [
            BoxShadow(
              color: CustomColors.primary.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        height: Spacings.heightCategoryCard,
        child: Padding(
          padding: Spacings.paddingCategoryCardContent,
          child: Column(
            children: <Widget>[
              Icon(
                icon,
                size: Spacings.sizeIconCategoryCard,
                color: Colors.grey,
              ),
              const SizedBox(
                height: Spacings.heightSizedBoxCategoryCardContent,
              ),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
