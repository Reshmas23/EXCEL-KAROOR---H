import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/model/event_models/events_model.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';

allEventListFinction(BuildContext context, EventModel data){
 showDialog(context: context,
  builder: (context) {
    return AlertDialog(title:  Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BackButton(),
        TextFontWidget(text: "     Event", fontsize: 18,fontWeight: FontWeight.bold,),
      ],
    ),
      content:  Container(
        height: 320,
        width: 500,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [ TextFontWidget(text: "Event Name *", fontsize: 12.6),
                Container(
                  decoration: const BoxDecoration(  color: cWhite,
                  boxShadow: [BoxShadow(blurRadius: 1,)]),
                  height: 40,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: TextFontWidget(text: data.eventName, fontsize: 13),
                ),
              ],
            ),
             Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [ TextFontWidget(text: "Date*", fontsize: 12.6),
                 Container(
                  decoration: const BoxDecoration(  color: cWhite,
                  boxShadow: [BoxShadow(blurRadius: 1,)]),
                  height: 40,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: TextFontWidget(text: data.eventDate, fontsize: 13),
                             ),
               ],
             ),
             Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [ TextFontWidget(text: "Venue*", fontsize: 12.6),
                 Container(
                   decoration: const BoxDecoration(  color: cWhite,
                  boxShadow: [BoxShadow(blurRadius: 1,)]),
                  height: 40,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: TextFontWidget(text: data.venue, fontsize: 13),
                             ),
               ],
             ),
             Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [ TextFontWidget(text: "Description*", fontsize: 12.6),
                 Container(
                   decoration: const BoxDecoration(  color: cWhite,
                  boxShadow: [BoxShadow(blurRadius: 1,)]),
                  height: 40,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: TextFontWidget(text: data.eventDescription, fontsize: 13),
                             ),
               ],
             ),
             Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [ TextFontWidget(text: "Signed By*", fontsize: 12.6),
                 Container(
                   decoration: const BoxDecoration(  color: cWhite,
                  boxShadow: [BoxShadow(blurRadius: 1,)]),
                  height: 40,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: TextFontWidget(text: data.signedBy, fontsize: 13),
                             ),
               ],
             ),
          ],
        ),
      ),
    );
  },);
}