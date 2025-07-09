import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:myntra_ui_clone/Screens/myntrainsider.dart';

import 'everydaypage.dart';
import 'profilepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: MediaQuery.of(context).size.width * 0.5,
          leading: MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyntraInsider()),
              );
            },
            child: Row(
              children: [
                Image.asset('assets/images/logo.png'),
                const SizedBox(width: 5),
                const Text(
                  "BECOME\nINSIDER >",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            const Icon(Icons.search, size: 30, color: Colors.black),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            const Icon(Icons.notifications_none_outlined,
                size: 30, color: Colors.black),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            const Icon(Icons.favorite_border_outlined,
                size: 30, color: Colors.black),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            const Icon(Icons.shopping_bag_outlined,
                size: 30, color: Colors.black),
            SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          ],
        ),
        body: _getPage(currentindex),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/bottomlogo.png', height: 25),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: "Everyday",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_3_outlined),
              label: "Profile",
            ),
          ],
          selectedItemColor: Colors.pink,
          currentIndex: currentindex,
          onTap: (value) {
            setState(() {
              currentindex = value;
            });
          },
        ),
        floatingActionButton: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(width: 5),
            borderRadius: BorderRadius.circular(50),
          ),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white70,
            foregroundColor: Colors.black,
            elevation: double.maxFinite,
            child: Image.asset('assets/images/bottomlogo.png', width: 30),
          ),
        ),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 1:
        return const EveryDayPage();
      case 2:
        return const ProfilePage();
      case 0:
      default:
        return _buildHomeContent(context);
    }
  }

  Widget _buildHomeContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: FloatingActionButton.extended(
                    onPressed: () {},
                    backgroundColor: Colors.black,
                    icon: Image.asset('assets/images/fashion.jpg', width: 50),
                    label: const Text("Fashion"),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.04),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: FloatingActionButton.extended(
                    onPressed: () {},
                    backgroundColor: Colors.white70,
                    icon: Image.asset('assets/images/beauty.png', width: 50),
                    label: const Text("Beauty",
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
            ],
          ),
          _buildCategoryScroller(context),
          _buildSignUpButton(context),
          Image.asset('assets/images/offer.jpg',
              width: MediaQuery.of(context).size.width),
          _buildImageSlider(),
          _buildBadgeRow(context),
          _buildAllTimeFavourites(context),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildCategoryScroller(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'label': 'CATEGORY', 'image': 'assets/images/category.png'},
      {'label': 'MEN', 'image': 'assets/images/men.jpg'},
      {'label': 'WOMEN', 'image': 'assets/images/women.png'},
      {'label': 'KIDS', 'image': 'assets/images/kids.png'},
      {'label': 'FOOTWEAR', 'image': 'assets/images/footwear.jpg'},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, index) {
          final category = categories[index];
          return Container(
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(category['image']!),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(category['label']!),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.96,
        height: MediaQuery.of(context).size.height * 0.05,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white70,
          ),
          child: const Text("Sign Up For Exciting Deals!"),
        ),
      ),
    );
  }

  Widget _buildImageSlider() {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: AnotherCarousel(
        images: const [
          AssetImage('assets/images/slider1.jpg'),
          AssetImage('assets/images/slider2.png'),
          AssetImage('assets/images/slider3.jpg'),
        ],
        dotSize: 6,
        dotColor: Colors.grey,
        dotBgColor: Colors.transparent,
        dotIncreasedColor: Colors.teal,
      ),
    );
  }

  Widget _buildBadgeRow(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          _badge(Icons.verified_outlined, "100% Original\nProducts"),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          _badge(Icons.local_shipping_outlined, "Free Shipping\non 1st Order"),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          _badge(Icons.sync_alt_outlined, "Easy Returns\nwithin 14 Days"),
        ],
      ),
    );
  }

  Widget _badge(IconData icon, String label) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
      child: Row(
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 5),
          Text(label, style: const TextStyle(fontSize: 9)),
        ],
      ),
    );
  }

  Widget _buildAllTimeFavourites(BuildContext context) {
    final List<String> favImages = [
      'fav1.png',
      'fav2.png',
      'fav3.png',
      'fav4.png',
      'fav5.png',
      'fav6.png'
    ];

    return Column(
      children: [
        const SizedBox(height: 30),
        const Text("ALL-TIME FAVOURITES",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
        const SizedBox(height: 30),
        for (int i = 0; i < favImages.length; i += 2)
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.025),
              _favCard(context, favImages[i]),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              if (i + 1 < favImages.length) _favCard(context, favImages[i + 1]),
            ],
          ),
      ],
    );
  }

  Widget _favCard(BuildContext context, String imageName) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 0.2)),
      child: Column(
        children: [
          SizedBox(
            height: 120,
            width: MediaQuery.of(context).size.width * 0.46,
            child: Image.asset('assets/images/$imageName'),
          ),
          const Text("Under 1099",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }
}
