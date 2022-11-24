import 'package:flutter/material.dart';
import 'package:scroll_tab_view_problem_answer/top.dart';
import 'package:scroll_tab_view_problem_answer/widget/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;


  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    controller.addListener(() {
      setState(() {});
    });
    super.didChangeDependencies();
  }

  double getHeight(int index) {
    if (index == 0) {
      return 200;
    } else if(index == 1){
      return 300;
    }
    return 400;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int i = 0; i < 1; i++) ...{const TopWidget()},
              Container(
                color: Colors.black,
                height: getHeight(controller.index),
                child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    appBar: AppBar(
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(50),
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          isScrollable: true,
                          padding: EdgeInsets.zero,
                          indicatorPadding: EdgeInsets.zero,
                          labelPadding: EdgeInsets.zero,
                          indicatorWeight: 4,
                          indicatorColor: Colors.transparent,
                          labelColor: Colors.black,
                          labelStyle: const TextStyle(color: Colors.black),
                          controller: controller,
                          tabs: [
                            Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                    color: controller.index == 0
                                        ? Colors.redAccent
                                        : null,
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                                child: const Tab(
                                  text: "Tab 1",
                                )),
                            Container(
                                decoration: BoxDecoration(
                                    color: controller.index == 1
                                        ? Colors.redAccent
                                        : null,
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                                height: 60,
                                width: MediaQuery.of(context).size.width / 3,
                                child: const Tab(
                                  text: "Tab 2",
                                )),
                            Container(
                                decoration: BoxDecoration(
                                    color: controller.index == 2
                                        ? Colors.redAccent
                                        : null,
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                                height: 60,
                                width: MediaQuery.of(context).size.width / 3,
                                child: const Tab(
                                  text: "Tab 3",
                                )),
                          ],
                        ),
                      ),
                    ),
                    body: TabBarView(
                      controller: controller,
                      children: const [
                        TabItems(text: "First tab content with 100 height"),
                        TabItems(text: "Second tab content with 200 height"),
                        TabItems(text: "Third tab content with 300 height"),
                      ],
                    ),
                  ),
                ),
              ),
              for (int i = 0; i < 6; i++) ...{const TopWidget()},
            ],
          ),
        ),
      ),
    );
  }
}
