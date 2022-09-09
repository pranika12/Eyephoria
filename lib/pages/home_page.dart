import 'dart:async';

import 'package:eyephoria_pranika_fyp/controller/authentication_controller.dart';
import 'package:eyephoria_pranika_fyp/pages/loader.dart';
import 'package:eyephoria_pranika_fyp/pages/tabs/first_tab.dart';
import 'package:eyephoria_pranika_fyp/utils/shared_preds.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabnavigator/tabnavigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _tabController = StreamController<AppTab>.broadcast();
  final _initTab = AppTab.home;
  final AuthService authService = AuthService();

  Stream<AppTab> get tabStream => _tabController.stream;

  final _map = <AppTab, TabBuilder>{
    AppTab.home: () {
      return FirstTab();
    },
    AppTab.appointment: () {
      return Column(
        children: const [],
      );
    },
    AppTab.orders: () {
      return Column(
        children: const [],
      );
    },
    AppTab.profile: () {
      return Column(
        children: const [],
      );
    },
    AppTab.info: () {
      final authentication = Get.find<Authentication>();
      return Column(
        children: [
          Container(
              child: ElevatedButton(
                  onPressed: () async {
                    await authentication.logout();
                    Get.offAll(const Loader());
                  },
                  child: const Text("Logout"))),
        ],
      );
    }
  };

  Widget _buildBody() {
    return TabNavigator(
      initialTab: _initTab,
      selectedTabStream: tabStream,
      mappedTabs: _map,
    );
  }

  logout() async {}

  Widget _buildbottomNavigationBar() {
    return StreamBuilder<AppTab>(
      stream: tabStream,
      initialData: _initTab,
      builder: (context, snapshot) {
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.amber,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule, color: Colors.amber),
              label: 'Appointments',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.remove_red_eye, color: Colors.amber),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face, color: Colors.amber),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Info',
            ),
          ],
          currentIndex: snapshot.hasData ? snapshot.data!.value : 0,
          onTap: (value) => _tabController.sink.add(AppTab.byValue(value)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildbottomNavigationBar(),
    );
  }

  @override
  void dispose() {
    _tabController.close();
    super.dispose();
  }
}

class AppTab extends TabType {
  const AppTab._(int value) : super(value);

  static const home = AppTab._(0);
  static const appointment = AppTab._(1);
  static const orders = AppTab._(2);
  static const profile = AppTab._(3);
  static const info = AppTab._(4);

  static AppTab byValue(int value) {
    switch (value) {
      case 0:
        return home;
      case 1:
        return appointment;
      case 2:
        return orders;
      case 3:
        return profile;
      case 4:
        return info;
      default:
        throw Exception('no tab for such value');
    }
  }
}
