import 'package:demo/bottombar_demo.dart';
import 'package:demo/demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetListView extends StatefulWidget {
  @override
  State<GetListView> createState() => _GetListViewState();
}

class _GetListViewState extends State<GetListView> {
  final PageController _pageController = PageController(initialPage: 0);

  // the index of the current page
  int _activePage = 0;

  // this list holds all the pages
  final List<Widget> _pages = [PageOne(), PageOne(), const PageThree()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // the page view
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              // PageController(
              //     initialPage: _activePage,
              //     keepPage: true,
              //     viewportFraction: 0);
              setState(() {
                _activePage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          ),
          // Display the dots indicator
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 100,
            child: Container(
              color: Colors.black54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                    _pages.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () {
                              _pageController.animateToPage(index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                            child: CircleAvatar(
                              radius: 8,
                              // check if a dot is connected to the current page
                              // if true, give it a different color
                              backgroundColor: _activePage == index
                                  ? Colors.amber
                                  : Colors.grey,
                            ),
                          ),
                        )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Page One
class PageOne extends StatefulWidget {
  PageOne({Key? key}) : super(key: key);
  // final double position = 0.0;

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  double? position;

  ScrollController _scrollController = ScrollController(keepScrollOffset: true);
  @override
  void initState() {
    super.initState();

    getOffSet().then((value) {
      setState(() {
        position = value;
      });
      SchedulerBinding.instance
          .addPostFrameCallback((_) => _scrollController.jumpTo(position!));
    });

    _scrollController.addListener(() {
      saveOffset(_scrollController.offset);
      print(_scrollController.offset);
    });
  }

  // _scrollController.animateTo(_scrollController.position.maxScrollExtent,
  //     duration: Duration(milliseconds: 500), curve: Curves.ease);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              "data Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with th"),
          Text(
              "data Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with th"),
          Text(
              "data Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with th"),
          Text("test here"),
          Text("test here"),
          Text("test here"),
          Text("test here"),
          Text("test here"),
          Text("test here"),
          Text(
              "data Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with th"),
          Text(
              "data Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with th"),
          Text(
              "data Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with th"),
          Text(
              "data Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with th"),
          Text(
              "data Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with th"),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("hello there"),
          Text("hello there"),
          Text("hello there"),
          Text("hello there"),
          Text("hi"),
          Text("hi"),
          Text("hi"),
          Text("hi"),
          Text("hi"),
          Text("hi"),
        ],
      ),
    );
  }

  void saveOffset(double offset) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('offSet', offset);
  }

  Future<double> getOffSet() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('offSet')!;
  }
}

// Page Two
class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.green,
        child: const Text(
          'Green Page',
          style: TextStyle(fontSize: 50, color: Colors.white),
        ));
  }
}

// Page Three
class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.blue,
        child: const Text(
          'Blue Page',
          style: TextStyle(fontSize: 50, color: Colors.white),
        ));
  }
}
