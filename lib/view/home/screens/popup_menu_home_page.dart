import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';

/// Flutter code sample for [PopupMenuButton].

// This is the type used by the popup menu below.
enum SampleItem { itemOne, itemTwo, itemThree , itemFour, itemFive, itemSix}




class PopupMenuExample extends StatefulWidget {
  const PopupMenuExample({super.key});

  @override
  State<PopupMenuExample> createState() => _PopupMenuExampleState();
}

class _PopupMenuExampleState extends State<PopupMenuExample> {
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: PopupMenuButton<SampleItem>(
        icon: Icon(Icons.menu,size: 30,color: cgreen,),
        initialValue: selectedItem,
        onSelected: (SampleItem item) {
          setState(() {
            selectedItem = item;
          });
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
          const PopupMenuItem<SampleItem>(
            value: SampleItem.itemOne,
            child: Text('About'),
          ),
          const PopupMenuItem<SampleItem>(
            value: SampleItem.itemTwo,
            child: Text('Schools'),
          ),
          const PopupMenuItem<SampleItem>(
            value: SampleItem.itemThree,
            child: Text('Colleges'),
          ),
          const PopupMenuItem<SampleItem>(
            value: SampleItem.itemFour,
            child: Text('Study Materials'),
          ),
          const PopupMenuItem<SampleItem>(
            value: SampleItem.itemFive,
            child: Text('Careers'),
          ),
          const PopupMenuItem<SampleItem>(
            value: SampleItem.itemSix,
            child: Text('Contact Us'),
          ),
          
        ],
      ),
    );
  }
}
