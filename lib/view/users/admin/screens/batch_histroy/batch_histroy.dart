import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/colors/colors.dart';
import 'package:vidyaveechi_website/view/fonts/text_widget.dart';

class BatchHistroyPage extends StatelessWidget {
  const BatchHistroyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 500,
        width: 500,
        child: Column(
          children: [
            Container(
              width: 410,
              height: 50,
              decoration: const BoxDecoration(
                  color: cWhite,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [BoxShadow(blurRadius: 1)]),
              child: DropdownSearch<Map<String, dynamic>>(
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      labelText: "Select Batch", border: OutlineInputBorder()),
                ),
              ),
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              child: VerticalDivider(
                color: cBlack.withOpacity(0.3),
                thickness: 1,
              ),
            ),
            // const VerticalDivider(width: 1,color: cBlack,),
            Container(
              width: 410,
              height: 250,
              decoration: const BoxDecoration(
                  color: cWhite,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [BoxShadow(blurRadius: 1)]),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 30,
                            width: 180,
                            child: Row(
                              children: [
                                Image.asset(
                                  "webassets/images/next-week.png",
                                  height: 20,
                                ),
                                 TextFontWidget(
                                    text: " Batch", fontsize: 14),
                              ],
                            )),
                         TextFontWidget(text: "2019-2020", fontsize: 14)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 30,
                            width: 180,
                            child: Row(
                              children: [
                                Image.asset(
                                  "webassets/images/next-week.png",
                                  height: 20,
                                ),
                                TextFontWidget(
                                    text: " Total Class", fontsize: 14),
                              ],
                            )),
                         TextFontWidget(text: "20", fontsize: 14)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 30,
                            width: 180,
                            child: Row(
                              children: [
                                Image.asset(
                                  "webassets/images/next-week.png",
                                  height: 20,
                                ),
                                TextFontWidget(
                                    text: " Total Students", fontsize: 14),
                              ],
                            )),
                         TextFontWidget(text: "201", fontsize: 14)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 30,
                            width: 180,
                            child: Row(
                              children: [
                                Image.asset(
                                  "webassets/images/next-week.png",
                                  height: 20,
                                ),
                                 TextFontWidget(
                                    text: " Total Staff", fontsize: 14),
                              ],
                            )),
                       TextFontWidget(text: "20", fontsize: 14)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 30,
                            width: 180,
                            child: Row(
                              children: [
                                Image.asset(
                                  "webassets/images/next-week.png",
                                  height: 20,
                                ),
                                 TextFontWidget(
                                    text: " Total Full A+", fontsize: 14),
                              ],
                            )),
                         TextFontWidget(text: "51", fontsize: 14)
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
