import 'package:cloth_catalog_ios/controller/global_controller.dart';
import 'package:cloth_catalog_ios/widgets/current_weather_widget.dart';
import 'package:cloth_catalog_ios/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  void setCurrentPageIndex(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (currentPageIndex) {
      case 0:
        page = MainScreenPage();
        break;
      // case 1:
      //   page = ClothPage();
      //   break;
      // case 2:
      //   page = Placeholder();
      //   break;
      default:
        throw UnimplementedError('no widget for $currentPageIndex');
    }

    return Scaffold(
      body: SafeArea(child: page),
      bottomNavigationBar:
          clothNavigationBar(currentPageIndex, setCurrentPageIndex),
    );
  }
}

class MainScreenPage extends StatelessWidget {
  MainScreenPage({super.key});

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => globalController.checkLoading().isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(height: 20),
                  const HeaderWidget(),
                  //for current temp
                  CurrentWeatherWidget(
                    weatherDataCurrent:
                        globalController.getWeatherData().getCurrentWeather(),
                  ),
                ],
              ),
            )),
    );
  }
}

Widget clothNavigationBar(
    int currentPageIndex, Function(int) setCurrentPageIndex) {
  return NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.search),
          label: 'Wardrobe',
        ),
        NavigationDestination(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int index) {
        setCurrentPageIndex(index);
      });
}
