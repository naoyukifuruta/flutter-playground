import 'package:bottom_navbar_sample/first/first_page.dart';
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
    final double deviceHeight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider<TopModel>(
      create: (_) => TopModel(),
      child: Consumer<TopModel>(
        builder: (context, model, child) {
          return Scaffold(
              appBar: AppBar(
                toolbarHeight: deviceHeight * 0.06,
                centerTitle: true,
                title: Text(
                  _tabNames[model.currentIndex],
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.blue,
              ),
              body: _topPageBody(context),
              bottomNavigationBar: SizedBox(
                height: deviceHeight * 0.1,
                child: BottomNavigationBar(
                  onTap: model.onTabTapped,
                  currentIndex: model.currentIndex,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.edit),
                      label: _tabNames[0],
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.group),
                      label: _tabNames[1],
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.insights),
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
        _tabPage(currentIndex, 1, FirstPage()),
        _tabPage(currentIndex, 2, FirstPage()),
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
