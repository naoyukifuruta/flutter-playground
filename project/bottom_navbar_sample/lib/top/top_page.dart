import 'package:bottom_navbar_sample/first/first_page.dart';
import 'package:bottom_navbar_sample/second/second_page.dart';
import 'package:bottom_navbar_sample/third/third_page.dart';
import 'package:bottom_navbar_sample/top/top_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopPage extends StatelessWidget {
  final List<String> _tabNames = [
    "First",
    "Second",
    "Third",
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TopModel>(
      create: (_) => TopModel(),
      child: Consumer<TopModel>(
        builder: (context, model, child) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  _tabNames[model.currentIndex],
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.blue,
              ),
              body: _topPageBody(context),
              bottomNavigationBar: SizedBox(
                child: BottomNavigationBar(
                  onTap: model.onTabTapped,
                  currentIndex: model.currentIndex,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.filter_1),
                      label: _tabNames[0],
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.filter_2),
                      label: _tabNames[1],
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.filter_3),
                      label: _tabNames[2],
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }

  Widget _topPageBody(BuildContext context) {
    final model = Provider.of<TopModel>(context);
    final currentIndex = model.currentIndex;
    return Stack(
      children: <Widget>[
        _tabPage(currentIndex, 0, FirstPage()),
        _tabPage(currentIndex, 1, SecondPage()),
        _tabPage(currentIndex, 2, ThirdPage()),
      ],
    );
  }

  Widget _tabPage(int currentIndex, int tabIndex, StatelessWidget page) {
    return Visibility(
      visible: currentIndex == tabIndex,
      maintainState: true,
      child: page,
    );
  }
}
