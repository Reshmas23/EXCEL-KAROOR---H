// ignore_for_file: prefer_const_constructors



import 'package:flutter/material.dart';
import 'package:vidyaveechi_website/view/fonts/google_poppins_widget.dart';
import 'package:vidyaveechi_website/view/widgets/back_button/back_button_widget.dart';


clientDetailsFunction(BuildContext context) {
  double screenSize = MediaQuery.of(context).size.height;

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: SizedBox(
          width: screenSize / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GooglePoppinsWidgets(
                text: 'Client Details',
                fontsize: 15,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                width: 50,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                child: BackButtonContainerWidget(),
              ),
            ],
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // const CircleAvatar(
                  //   radius: 80,
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // GestureDetector(
                  //     onTap: () {
                  //       pickImageFromGallery();
                  //     },
                  //     child: Icon(Icons.camera_enhance)),
                  RowOfDetailsWidget(text: "Name", title: "fhgff",),
                  // LinerContainerWidget(),
                   RowOfDetailsWidget(text: "Moblie No.", title: "📱jgjhy "),
                  // LinerContainerWidget(),
                  RowOfDetailsWidget(text: "Whatsapp No.", title: "📱hgfhyfh "),
                  // LinerContainerWidget(),
                  RowOfDetailsWidget(text: "Email", title: "📧jyguygi "),
                  // LinerContainerWidget(),
                 RowOfDetailsWidget(text: "Gender", title: "🧑‍🦲khuio"),
                  // LinerContainerWidget(),
                  RowOfDetailsWidget(text: "D O B", title: "📅jhgkiui"),
                  // LinerContainerWidget(),
                  RowOfDetailsWidget(text: "Marriage Date", title: "📅6464"),
                  // LinerContainerWidget(),
                  RowOfDetailsWidget(text: "Case Type", title: "📮bkihju"),
                  // LinerContainerWidget(),
                  RowOfDetailsWidget(text: "Occupation", title: "✍️nhn"),
                  // LinerContainerWidget(),
                  RowOfDetailsWidget(text: "Address", title: "🏠 nhnmjm"),
                  // LinerContainerWidget(),
                  RowOfDetailsWidget(text: "Discription", title: "📝kasdfghjklqwertyuiopzxcvbnm,asdfghjkewdrfghjxcvbn ydtug jguyg kgui kigi7 iugtuiy hiouiou utfu6tg ityiy fyu hvghlvghcvgujb h.jkgyu; fyuvgt7u dt7vguvty cvc7utyghuvlgu  nkj"),
                  // LinerContainerWidget(),
                  RowOfDetailsWidget(text: "opposite Advocate", title: "🧑‍⚖️niuhi"),
                  // LinerContainerWidget(),
                  RowOfDetailsWidget(text: "Marriage Type", title: "💑lkijoij"),
                  // LinerContainerWidget(),
                  RowOfDetailsWidget(text: "No. of Children", title: "👶nko"),
                  // LinerContainerWidget(),
                  RowOfDetailsWidget(text: "Seperation Date", title: "📅4658"),
                  // LinerContainerWidget(),
                  RowOfDetailsWidget(text: "Entered date", title: "📅15364"),
                  // LinerContainerWidget(),
                  RowOfDetailsWidget(text: "Enter By", title: "✍️kjhk"),
                  // LinerContainerWidget(),
                  RowOfDetailsWidget(text: "State", title: "🏙️bkjnkl "),
                  // LinerContainerWidget(),
                  
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )
            ],
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

// ignore: must_be_immutable
class RowOfDetailsWidget extends StatelessWidget {
  String title;
  String text;
  RowOfDetailsWidget({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Container(
            height: 30,
            width: 180,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 191, 180, 180),
            ),
            child: Center(
              child: GooglePoppinsWidgets(
                  text: text,
                  color: Colors.black,
                  fontsize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),SizedBox(width: 10,),
            GooglePoppinsWidgets(text: title, fontsize: 14,fontWeight: FontWeight.bold,),
            // GooglePoppinsWidgets(text: title, fontsize: 14),
           
          ],
        ),
         SizedBox(height: 10,),
      ],
    );
    
  }
}

class LinerContainerWidget extends StatelessWidget {
  const LinerContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: screenSize,
      alignment: Alignment.center,
      child: const Divider(
        color: Color.fromARGB(255, 57, 53, 46),
        thickness: 1,
      ),
    );
  }
}

// Future<void> pickImageFromGallery() async {
//   final imagePicker = ImagePicker();
//   final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

//   if (pickedImage != null) {
//     File selectedImage = File(pickedImage.path);
//   }
// }
