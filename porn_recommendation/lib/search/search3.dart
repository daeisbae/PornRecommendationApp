import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:porn_recommendation/component.dart';
import 'package:porn_recommendation/style.dart';
import 'package:search_choices/search_choices.dart';

class SearchPage3 extends StatelessWidget {
  const SearchPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: const [
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 3,
          child: SelectCategories(),
        ),
        Spacer(
          flex: 1,
        )
      ],
    ));
  }
}

class SelectCategories extends StatefulWidget {
  const SelectCategories({Key? key}) : super(key: key);

  @override
  _SelectCategoriesState createState() => _SelectCategoriesState();
}

class _SelectCategoriesState extends State<SelectCategories> {
  List<String> listCategories = [];
  List<int> listCategoriesSelected = [];
  @override
  void initState() {
    super.initState();
    loadTxt('data/pornCategories.txt').then((value) {
      for (String category in LineSplitter().convert(value)) {
        listCategories.add(category);
      }
      // debugPrint(multiSelectList.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          fillStrokeText("Preferred Type of Porn", lightPink, 14),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: searchBar(),
          ),
          SizedBox(
            height: size.height * 0.2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GradientBtn(
                goBack: true,
                gradient: purpleGradientColor,
              ),
              SearchBtn(),
            ],
          )
        ]);
  }

  SearchChoices<String> searchBar() {
    return SearchChoices.multiple(
      items: listCategories
          .map((categories) => DropdownMenuItem(
                child: Text(categories),
                value: categories,
              ))
          .toList(),
      selectedAggregateWidgetFn: (list) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: list,
          ),
        );
      },
      selectedItems: listCategoriesSelected,
      icon: Icon(Icons.arrow_drop_down, color: lightPink, size: 30),
      displayClearIcon: false,
      onChanged: (items) {
        setState(() {
          listCategoriesSelected = items;
        });
      },
      selectedValueWidgetFn: (item) {
        return InputChip(
          label: Text(item, style: TextStyle(color: white)),
          backgroundColor: lightPink,
          deleteIcon: Icon(Icons.cancel, color: white),
          onDeleted: () {
            setState(() {
              listCategoriesSelected.remove(listCategories.indexOf(item));
            });
          },
        );
      },
      displayItem: (item, selected) {
        return ChoiceChip(
          label: Text(item.value, style: TextStyle(color: Colors.white)),
          backgroundColor: lightPink,
          selected: selected ? true : false,
          selectedColor: deepPink,
          disabledColor: lightPink,
        );
      },
      isExpanded: true,
      underline: SizedBox(),
    );
  }
}

class SearchBtn extends StatelessWidget {
  const SearchBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 100,
        height: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: pinkGradientColor,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, color: Colors.grey, offset: Offset(-3, 3))
            ]),
        child: Text("Search", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
