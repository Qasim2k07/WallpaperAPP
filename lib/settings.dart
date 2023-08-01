import 'package:flutter/material.dart';
import 'package:fluuterui/navigation_bar.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 21, 34),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 18, 26),
        title: const Center(
            child: Text(
          'Settings',
          style: TextStyle(fontSize: 26),
        )),
        actions: const [Padding(padding: EdgeInsets.fromLTRB(0, 0, 60, 0))],
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BottomTabBar()));
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Material(
              borderRadius: BorderRadius.circular(14),
              elevation: 20,
              child: Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffe4f5ff)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('About',
                          style: TextStyle(
                              color: Color(0xff094f6e),
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      Divider(),
                      Text('A simplistic Wallpaper App by Hasnain Qasim',
                          style: TextStyle(
                              color: Color(0xff2d7a9c),
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          'Offering a wide variety of high-quality wallpapers that are perfect for your phone or tablet. Easy to use and a choice of thousands of different wallpapers. You can also search for specific types of wallpapers. With our app, customize your device and make it truly your own. ',
                          style: TextStyle(color: Color(0xffC14F12))),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Material(
              elevation: 20,
              borderRadius: BorderRadius.circular(14),
              child: Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffe4f5ff)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 2),
                      Text('Report A Bug',
                          style: TextStyle(
                              color: Color(0xff094f6e),
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      Divider(),
                      Text('Need help? Send a E-mail here:',
                          style: TextStyle(
                              color: Color(0xff2d7a9c),
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('Business@gmail.com',
                          style: TextStyle(color: Color(0xffC14F12))),
                      SizedBox(height: 14),
                      Text('FeedBack',
                          style: TextStyle(
                              color: Color(0xff094f6e),
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      Divider(),
                      SizedBox(
                        height: 4,
                      ),
                      Text('Want To make a suggestion? Contact us here:',
                          style: TextStyle(
                              color: Color(0xff2d7a9c),
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('92+ 3330000001',
                          style: TextStyle(color: Color(0xffC14F12))),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          InkWell(
              child: Container(
            height: 40,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff2d7a9c)),
            child: const Center(
                child: Text(
              'Back To Home',
              style: TextStyle(color: Colors.white),
            )),
          )),
          const SizedBox(
            height: 3,
          ),
          Text(
            'App Build: ',
            style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 10,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
