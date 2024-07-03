 import 'package:flutter/material.dart%20';

class PageViewExample extends StatefulWidget {
  @override
  _PageViewExampleState createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  int _currentPageIndex = 0;

  void _incrementPageIndex() {
    setState(() {
      _currentPageIndex = (_currentPageIndex + 1) % 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView Example'),
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: [
          Center(
            child: Text('Page 1'),
          ),
          Center(
            child: Text('Page 2'),
          ),
          Center(
            child: Text('Page 3'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementPageIndex();
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}