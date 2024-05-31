
import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/widgets/responsive/responsive.dart';


class OurTutionCenterContainer extends StatelessWidget {
  const OurTutionCenterContainer({
    super.key,
    //required this.sscrollcontroller,
  });

//  final ScrollController sscrollcontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          SizedBox(
            //................................. OUR TEAM
            height: 280,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ResponsiveWebSite.isMobile(context)
                  ? Column(
                      children: [
                        SizedBox(
                            height: 50,
                            width:
                                ResponsiveWebSite.isTablet(context) ? 200 : 300,
                            child: Column(
                              children: [
                                Center(
                                  child: GooglePoppinsWidgets(
                                    text: "OUR TUITION CENTER",
                                    fontsize: 20,
                                    color: const Color.fromARGB(255, 3, 9, 75),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 05),
                                  child: Container(
                                    color: const Color.fromARGB(255, 3, 9, 75),
                                    height: 02,
                                    width: 80,
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: Image.asset(
                              'webassets/excel_karror/girl_with_book.jpg',
                              fit: BoxFit.fitHeight,
                            ))
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            height: 400,
                            width:
                                ResponsiveWebSite.isTablet(context) ? 200 : 300,
                            child: Center(
                              child: GooglePoppinsWidgets(
                                text: "OUR TUITION CENTER",
                                fontsize: ResponsiveWebSite.isTablet(context)
                                    ? 30
                                    : 50,
                                color:const Color.fromARGB(255, 3, 9, 75),
                              ),
                            )),
                        Container(
                          color: const Color.fromARGB(255, 3, 9, 75),
                          height: 300,
                          width: 01,
                        ),
                        SizedBox(
                            height:
                                ResponsiveWebSite.isTablet(context) ? 280 : 600,
                            width:
                                ResponsiveWebSite.isTablet(context) ? 450 : 600,
                            child: Image.asset(
                              'webassets/excel_karror/girl_with_book.jpg',
                              fit: BoxFit.fitHeight,
                            )),
                      ],
                    ),
            ),
          ),
          // StreamBuilder(
          //     stream: FirebaseFirestore.instance
          //         .collection('StaffManagement')
          //         .doc('StaffManagement')
          //         .collection('Active').orderBy('index')
          //         .snapshots(),
          //     builder: (context, snapshot) {
          //    if (snapshot.hasData) {
          //        return 
                 SizedBox(
                    // color: Colors.black,
                    height: ResponsiveWebSite.isMobile(context) ? 500 : 350,
                    // width: 600,
                    child: ResponsiveWebSite.isDesktop(context)
                        ? ListView.separated(
                            physics: const AlwaysScrollableScrollPhysics(),
                            // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                           // controller: sscrollcontroller,
                            itemBuilder: (context, index) {
                            //  final data = CreateEmployeeClassModel.fromMap(snapshot.data!.docs[index].data());
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 300,
                                  child: Image.network(
                                    images[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 20,
                              );
                            },
                            itemCount: 4)
                         : GridView.count(
                            crossAxisCount: 2,
                            padding: const EdgeInsets.all(20),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            primary: false,
                            children: List.generate(
                                4,
                                (index) {
                                    //    final data = CreateEmployeeClassModel.fromMap(snapshot.data!.docs[index].data());
                                  return
                                  SizedBox(
                                      // margin: ,
                                      height: 100,
                                      width: 100,
                                      // color: Colors.amber,
                                      child: Expanded(flex: 1,
                                        child: Image.network(
                                          images[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                }
                                    
                                    ),
                          )
                          )
               /////////////////////////////
            //  }else{
            //   return const Center();
            //  }
            //   }),
        ],
      ),
    );
  }
}

// List<String> personNameList = [
//   'Anoop',
//   ' Rekha ',
//   ' Diya ',
//   'Jinny',
// ];
// List<String> personOccu = [
//   'Teacher',
//   'Head master',
//   ' Manager',
//   'Staff',
// ];

List<String> images =[
  'https://firebasestorage.googleapis.com/v0/b/excel-karoor-48ae3.appspot.com/o/excelkaroor_images%2Fexl%20(1).JPG?alt=media&token=6a0a963a-ee95-4a2e-b495-e0fdab1bc299',
  'https://firebasestorage.googleapis.com/v0/b/excel-karoor-48ae3.appspot.com/o/excelkaroor_images%2Fexl%20(2).JPG?alt=media&token=eef2ca7f-d661-4e42-b61a-494f4cbc7a3e',
  'https://firebasestorage.googleapis.com/v0/b/excel-karoor-48ae3.appspot.com/o/excelkaroor_images%2Fexl%20(3).JPG?alt=media&token=d4098cee-4178-4c22-bce2-5f920f9da130',
  'https://firebasestorage.googleapis.com/v0/b/excel-karoor-48ae3.appspot.com/o/excelkaroor_images%2Fexl%20(4).JPG?alt=media&token=ff5f07ee-11da-49f7-bcdd-5a272768721e',
];