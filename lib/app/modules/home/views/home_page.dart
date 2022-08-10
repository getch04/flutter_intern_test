import 'package:flutter/material.dart';
import 'package:flutter_intern_test/app/common/util/exports.dart';
import 'package:flutter_intern_test/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_intern_test/app/modules/widgets/custom_text_field_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Item {
  const Item({
    required this.title,
    required this.desc,
    required this.imgurl,
  });
  final String title;
  final String desc;
  final String imgurl;
}

class TopItem {
  const TopItem({
    required this.title,
    required this.exp,
    required this.imgurl,
  });
  final String title;
  final String exp;
  final String imgurl;
}

class LastItem {
  const LastItem({
    required this.title,
    required this.imgurl,
  });
  final String title;
  final String imgurl;
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());

  List<Item> items = <Item>[
    const Item(
        title: 'Home beauty tutor Services',
        desc: 'Chose Best beauty Cources And Learn From Best Tutor',
        imgurl: 'assets/images/Rectangle 2331.jpg'),
    const Item(
        title: 'Online Tutor Services',
        desc: 'Chose Best Beauty Cources And Learn From Best Tutor',
        imgurl: 'assets/images/Rectangle 2335.jpg'),
    const Item(
        title: 'Salon At Home',
        desc: 'Stay Home And Experiance Best Beauty Salon',
        imgurl: 'assets/images/Rectangle 2337.jpg'),
  ];

  List<LastItem> lastItems = <LastItem>[
    const LastItem(
        title: 'bleach & Detan', imgurl: 'assets/images/Rectangle 2210.jpg'),
    const LastItem(title: 'Face', imgurl: 'assets/images/Rectangle 2211.jpg'),
    const LastItem(title: 'hair ', imgurl: 'assets/images/Rectangle 2212.jpg'),
  ];
  List<TopItem> topItems = <TopItem>[
    const TopItem(
        title: 'Good Luck',
        exp: '4-8 Years',
        imgurl: 'assets/images/Rectangle 2098.jpg'),
    const TopItem(
        title: 'Hair COMBO',
        exp: '10-12 Years',
        imgurl: 'assets/images/Rectangle 2099.jpg'),
    const TopItem(
        title: 'Makeup looks',
        exp: '4-8 Years',
        imgurl: 'assets/images/Rectangle 2100.jpg'),
    const TopItem(
        title: 'nail arts',
        exp: '2-4 Years',
        imgurl: 'assets/images/Rectangle 2101.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4.5;
    final double itemWidth = size.width / 2;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  const Image(
                    image: AssetImage(AppImages.image_1),
                    semanticLabel: 'image 1',
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 70,
                    left: 125,
                    child: SizedBox(
                      height: 25,
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: TextField(
                        cursorHeight: 20,
                        autofocus: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white,
                          hintText: "Search Your courses",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade600, fontSize: 12),
                          prefixIcon: const Icon(Icons.search),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                child: GridView.builder(
                  itemCount: items.length,
                  controller: ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (itemWidth / itemHeight),
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image(
                            image: AssetImage(items[index].imgurl),
                            height: size.height * 0.15,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.117,
                          left: size.height * 0.012,
                          right: size.height * 0.012,
                          bottom: 0,
                          child: Container(
                            height: size.height * 0.1,
                            width: size.height * 0.02,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(14)),
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index].title,
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    items[index].desc,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: const TextStyle(fontSize: 10),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      bottom: 2, // Space between underline and text
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xff88609F),
                          width: 3.0, // Underline thickness
                        ),
                      ),
                    ),
                    child: const Text(
                      "Top rated salon courc",
                      style: TextStyle(
                          fontFamily: 'Varela Round',
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      "es at Home",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Varela Round',
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Text(
                'Best Courses And Best Experience Mentor',
                style: GoogleFonts.aBeeZee(
                    color: const Color.fromARGB(68, 37, 72, 121), fontSize: 16),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 1,
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: (1 / 1.6),
                  shrinkWrap: true,
                  children: List.generate(topItems.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        // color: Colors.red,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 145,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: RatingBar(
                                        initialRating: 4,
                                        direction: Axis.horizontal,
                                        itemCount: 5,
                                        itemSize: 15,
                                        ratingWidget: RatingWidget(
                                            full: const Icon(Icons.star,
                                                color: Colors.orange),
                                            half: const Icon(
                                              Icons.star_half,
                                              color: Colors.orange,
                                            ),
                                            empty: const Icon(
                                              Icons.star_outline,
                                              color: Colors.orange,
                                            )),
                                        onRatingUpdate: (value) {
                                          // setState(() {
                                          controller.ratingValue.value = value;
                                          // });
                                        },
                                      ),
                                    ),
                                    Text(
                                      'EXP: ' + topItems[index].exp,
                                      style: GoogleFonts.aBeeZee(
                                          color: AppColors.black),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                      child: Text(
                                        'View Package',
                                        style: GoogleFonts.aBeeZee(
                                            color: Color(0xff5D398C)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18.0),
                                child: Image(
                                  alignment: Alignment.topCenter,
                                  image: AssetImage(topItems[index].imgurl),
                                  height: size.height * 0.225,
                                  // width: size.width * 0.39,

                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              top: size.height * 0.19,
                              left: size.height * 0.02,
                              right: size.height * 0.02,
                              bottom: size.height * 0.088,
                              child: Container(
                                height: size.height * 0.02,
                                width: size.height * 0.16,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(14)),
                                  color: Color(0xff7c4f95),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    topItems[index].title.toUpperCase(),
                                    style: GoogleFonts.alike(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  bottom: 2, // Space between underline and text
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xff88609F).withOpacity(0.5),
                      width: 2.0, // Underline thickness
                    ),
                  ),
                ),
                child: Text(
                  "HOME SALON PAKAGE",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 22,
                      color: const Color(0xff442E61),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'best beautition at your home',
                style: GoogleFonts.aBeeZee(
                    color: const Color(0xff442E61A6), fontSize: 16),
              ),
              SizedBox(
                height: 176,
                width: size.height,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: lastItems.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 50, right: 25),
                            child: Container(
                              width: size.width * 0.3,
                              height: 120,
                              decoration: const BoxDecoration(
                                color: Color(0xff7c4f95),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      lastItems[index].imgurl,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 7.5,
                              bottom: 30,
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 30,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    lastItems[index].title.toUpperCase(),
                                    style: GoogleFonts.alike(fontSize: 10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: size.height * 0.5,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Contact Us',
                        style: GoogleFonts.alike(fontSize: 24),
                      ),
                      customInputField(hint: 'Enter Your Name'),
                      customInputField(hint: 'Enter Your Email ID'),
                      customInputField(hint: 'Enter Your Contact No'),
                      customInputField(hint: 'Enter Zip Code'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class customInputField extends StatelessWidget {
  final String hint;
  const customInputField({
    Key? key,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        cursorHeight: 20,
        autofocus: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xff936fa8),
          hintText: hint,
          hintStyle:
              GoogleFonts.aBeeZee(color: const Color(0xffFFFFFF), fontSize: 12),
          // prefixIcon: const Icon(Icons.search),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
