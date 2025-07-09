import 'package:flutter/material.dart';
import 'homepage.dart';
import 'profilepage.dart';

class EveryDayPage extends StatefulWidget {
  const EveryDayPage({super.key});

  @override
  State<EveryDayPage> createState() => _EveryDayPageState();
}

class _EveryDayPageState extends State<EveryDayPage> {
  int currentindex = 1;

  final List<Widget> pageList = [
    HomePage(),
    // Removed: EveryDayPage(),
    ProfilePage()
  ];

  void onTabTapped(int index) {
    if (index == currentindex) return;

    setState(() {
      currentindex = index;
    });

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => pageList[index]));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Myntra Everyday",
              style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          actions: [
            const Icon(Icons.search, size: 30, color: Colors.black),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            const Icon(Icons.favorite_border_outlined,
                size: 30, color: Colors.black),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            const Icon(Icons.shopping_bag_outlined,
                size: 30, color: Colors.black),
            SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(width: 1, color: Colors.grey))),
          child: BottomNavigationBar(
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
            onTap: onTabTapped,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Image(image: AssetImage('assets/images/1.jpg')),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    const Text('CATEGORIES ON THE RISE',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text("Get, Set, Restock!",
                        style: TextStyle(fontSize: 17)),
                    const SizedBox(height: 18),
                    Image.asset('assets/images/c5.jpg',
                        width: MediaQuery.of(context).size.width),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                color: Colors.teal,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Image.asset('assets/images/deals.png',
                        width: MediaQuery.of(context).size.width * 0.5),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      height: 230,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(width: 40),
                          ...List.generate(4, (index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 220,
                              width: 180,
                              child: Stack(
                                children: [
                                  Image.asset('assets/images/cart1.jpg'),
                                  const Positioned(
                                    bottom: 15,
                                    left: 30,
                                    child: Text(
                                      'Under 899',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                          backgroundColor: Colors.black54),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
