import 'package:flutter/material.dart';
import 'package:local_event/app_state.dart';
import 'package:local_event/styleguide.dart';
import '../../model/category.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  const CategoryWidget({required this.category});
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    final _isSelected = appState.selectedCategoryId == category.categoryId;

    return GestureDetector(
      onTap: () {
        if (!_isSelected) {
          appState.updateCategoryId(category.categoryId);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
            color: _isSelected ? Colors.white : Colors.transparent,
            border: Border.all(
                color: _isSelected ? Colors.white : Color(0x99FFFFFF),
                width: 3),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            category.icon,
            color: _isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.white,
            size: 40,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            category.name,
            style: _isSelected ? selectedCategoryTextStyle : categoryTextStlye,
          ),
        ]),
      ),
    );
  }
}
