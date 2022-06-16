import 'package:dro/core/app_export.dart';
import 'package:dro/data/data_export.dart';

// major screens
import 'home/home.dart';
import 'doctors/doctors.dart';
import 'pharmacy/pharmacy.dart';
import 'community/community.dart';
import 'profile/profile.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  var _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = [
    Home(),
    Doctors(),
    Pharmacy(),
    Community(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: kBlack800),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: _selectedIndex,
          selectedIconTheme: Theme.of(context).iconTheme.copyWith(
                color: kPurple,
              ),
          selectedItemColor: kPurple,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_add_alt_1_outlined,
                ),
                label: 'Doctors'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_shopping_cart_outlined,
                ),
                label: 'Pharmacy'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.question_answer_outlined,
                ),
                label: 'Community'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                ),
                label: 'Profile'),
          ],
        ),
      ),
      floatingActionButton: CheckOutButton(),
    );
  }
}