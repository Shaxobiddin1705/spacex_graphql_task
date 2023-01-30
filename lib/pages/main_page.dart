import 'package:flutter/material.dart';
import 'package:spacex_graphql_task/pages/company_information/company_information_page.dart';
import 'package:spacex_graphql_task/pages/vehicles/vehicles_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final unselectedColor = const Color(0xFFF1F1F1);
  final selectedColor = const Color(0xFFE31E24);
  int _selectedIndex = 0;

  final _pages = [VehiclesPage.view(), CompanyInformationPage.view()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A2E42),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/vehicles_icon.png', width: 22, height: 22, fit: BoxFit.cover,
                color: _selectedIndex == 0 ? selectedColor : unselectedColor),
            label: 'Vehicles',
            backgroundColor: unselectedColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/company_icon.png', width: 22, height: 22, fit: BoxFit.cover,
                color: _selectedIndex == 1 ? selectedColor : unselectedColor),
            label: 'Company',
            backgroundColor: unselectedColor,
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        elevation: 10,
        backgroundColor: const Color(0xFF212640),
        selectedItemColor: selectedColor,
        selectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: selectedColor),
        unselectedItemColor: unselectedColor,
        unselectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: unselectedColor),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}
