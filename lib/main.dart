import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Clone App',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/youtube-logo.png',
          width: 100,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.cast_outlined),
            color: Colors.black,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            color: Colors.black,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: () {},
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 14.0,
              right: 16,
              top: 14.0,
              bottom: 14.0,
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/profile.png',
              ),
            ),
          ),
        ],
      ),
      body: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget customBottomNavigation() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      clipBehavior: Clip.none,
      child: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 10,
          selectedFontSize: 10,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/youtube-shorts.png',
                color: Colors.black,
                width: 24,
                height: 24,
              ),
              label: 'Shorts',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.white,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.subscriptions_outlined,
                color: Colors.black,
              ),
              label: 'Subscription',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.video_collection_outlined,
                color: Colors.black,
              ),
              label: 'Library',
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonAdd() {
    return Container(
      width: 40,
      height: 40,
      child: Icon(
        Icons.add,
        size: 32,
      ),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 2,
          )),
    );
  }

  Widget categoryButton(bool isSelect, String text) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: isSelect ? Colors.black54 : Colors.black12,
          border: Border.all(
            color: isSelect ? Colors.transparent : Colors.black12,
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
        child: Text(
          text,
          style: TextStyle(
            color: isSelect ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget videoItem(
    String thumbnailPath,
    String imageChannelPath,
    String title,
    String time,
    String info,
  ) {
    return Container(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.asset(
                thumbnailPath,
                height: 210,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                margin: EdgeInsets.only(bottom: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 24.0,
              top: 12.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.asset(
                    imageChannelPath,
                    width: 40,
                    height: 40,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        info,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget exploreButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 4.0, horizontal: 8.0),
        child: Row(
          children: [
            Icon(Icons.explore_outlined),
            SizedBox(width: 6),
            Text(
              'Explore',
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0), //(x,y)
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      exploreButton(),
                      Container(
                        width: 1,
                        height: 32,
                        margin: EdgeInsets.only(right: 16.0),
                        color: Colors.grey,
                      ),
                      categoryButton(true, 'All'),
                      categoryButton(false, 'Mixes'),
                      categoryButton(false, 'Music'),
                      categoryButton(false, 'Comedies'),
                      categoryButton(false, 'Street food'),
                      SizedBox(width: 8),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'SEND FEEDBACK',
                        ),
                      ),
                      SizedBox(width: 16)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    videoItem(
                      'assets/thumbnail1.jpg',
                      'assets/channel1.jpg',
                      'ADELE - All I Ask (Cover by Leroy Sanchez)',
                      '4.15',
                      'Leroy Sanchez . 21M views . 5 year ago',
                    ),
                    videoItem(
                      'assets/thumbnail2.jpg',
                      'assets/channel2.jpeg',
                      'Backstreet Boys - I Want It That Way | Music Travel Love ft. Francis Greg (Cover)',
                      '3.20',
                      'Music Travel Love . 8.5M views . 1 month ago',
                    ),
                    videoItem(
                      'assets/thumbnail3.jpg',
                      'assets/channel3.jpg',
                      'James Arthur - Say You Won\'t Let Go',
                      '3.30',
                      'James Arthur . 1.3B views . 5 year ago',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            customBottomNavigation(),
            buttonAdd(),
          ],
        ),
      ],
    );
  }
}
