import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:porn_recommendation/component.dart';
import 'package:porn_recommendation/style.dart';
import 'package:search_choices/search_choices.dart';

class SearchPage2 extends StatelessWidget {
  SearchPage2({Key? key}) : super(key: key);

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
          child: SelectPornstars(),
        ),
        Spacer(
          flex: 1,
        )
      ],
    ));
  }
}

class SelectPornstars extends StatefulWidget {
  const SelectPornstars({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectPornstars> createState() => _SelectPornstarsState();
}

class _SelectPornstarsState extends State<SelectPornstars> {
  List<String> listPornstars = [];
  List<int> listPornstarsSelected = [];

  @override
  void initState() {
    super.initState();
    loadTxt('data/pornstars.txt').then((value) {
      print(value);
      for (String pornstar in LineSplitter().convert(value)) {
        listPornstars.add(pornstar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        fillStrokeText("Preferred Pornstar", lightPink, 14),
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
        ButtonRow()
      ],
    );
  }

  SearchChoices<String> searchBar() {
    return SearchChoices.multiple(
      items: listPornstars
          .map((pornstar) => DropdownMenuItem(
                child: Text(pornstar),
                value: pornstar,
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
      selectedItems: listPornstarsSelected,
      icon: Icon(Icons.arrow_drop_down, color: lightPink, size: 30),
      displayClearIcon: false,
      onChanged: (items) {
        setState(() {
          listPornstarsSelected = items;
        });
      },
      selectedValueWidgetFn: (item) {
        return InputChip(
          label: Text(item, style: TextStyle(color: white)),
          backgroundColor: lightPink,
          deleteIcon: Icon(Icons.cancel, color: white),
          onDeleted: () {
            setState(() {
              listPornstarsSelected.remove(listPornstars.indexOf(item));
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

class ButtonRow extends StatelessWidget {
  const ButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GradientBtn(
          goBack: true,
          gradient: purpleGradientColor,
        ),
        GradientBtn(
          goBack: false,
          gradient: pinkGradientColor,
          path: '/search3',
        )
      ],
    );
  }
}
