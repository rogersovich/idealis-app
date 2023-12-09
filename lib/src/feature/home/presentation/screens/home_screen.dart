import 'package:flutter/material.dart';
import 'package:idealis_app/size_config.dart';
import 'package:idealis_app/src/core/constant/color_constant.dart';
import 'package:idealis_app/src/core/utils/image_util.dart';
import 'package:idealis_app/src/core/utils/text_util.dart';
import 'package:idealis_app/src/feature/introduction/presentation/widgets/introduction_screen.dart';

// ignore: constant_identifier_names
enum MenuItemType { NEW, LOCKED, DEFAULT, SOON }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

   void _navigateToOnBoarding(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const OnBoardingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          title: buildTextCustom(context, 'Home',
              color: kBlackColor, fontSize: 9, weight: 'w600'),
          leading: IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => _navigateToOnBoarding(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.login_rounded),
              onPressed: () {},
            ),

            // Add more IconButton widgets for additional icons
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(context, 10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //todo Profile Section
                Card(
                  color: kPrimaryColors.shade500, // Use your preferred color
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(context, 6))),
                  child: Padding(
                    padding: EdgeInsets.all(
                        getProportionateScreenHeight(context, 8)),
                    child: Row(
                      children: [
                        Expanded(
                            child: RichText(
                          text: const TextSpan(
                            style: TextStyle(decoration: TextDecoration.none),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Halo Idealisme,\n',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                  text: 'Aplikasih ini bisa membantumu',
                                  style: TextStyle(fontSize: 14, height: 1.6)),
                              TextSpan(
                                  text: '\ndalam financial loh',
                                  style: TextStyle(fontSize: 14, height: 1.4)),
                            ],
                          ),
                        )),
                        SizedBox(
                            width: getProportionateScreenWidth(context, 30)),
                        buildImage(context, 'avatar-money.png',
                            width: 20, height: 20),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(context, 10)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(context, 10)),
                  child: buildTextCustom(context, "Layanan Kami",
                      weight: 'w600', fontSize: 8),
                ),
                SizedBox(height: getProportionateScreenHeight(context, 14)),
                //todo Grid Menu
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 25,
                  childAspectRatio: 1.4,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildMenuItem(
                        icon: Icons.edit_document,
                        label: 'Pencatatan',
                        type: MenuItemType.NEW,
                        context: context),
                    _buildMenuItem(
                        icon: Icons.account_balance_wallet,
                        label: 'Tabungan',
                        context: context),
                    _buildMenuItem(
                        icon: Icons.hourglass_empty,
                        label: 'Masa Depan',
                        type: MenuItemType.LOCKED,
                        context: context),
                    _buildMenuItem(
                        icon: Icons.shopping_bag_outlined,
                        label: 'Kantong',
                        type: MenuItemType.LOCKED,
                        context: context),
                    _buildMenuItem(
                        icon: Icons.phone_android,
                        label: 'Barang',
                        type: MenuItemType.LOCKED,
                        context: context),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(context, 10)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(context, 10)),
                  child: buildTextCustom(context, "Segera",
                      weight: 'w600', fontSize: 8),
                ),
                SizedBox(height: getProportionateScreenHeight(context, 10)),
                //todo Grid Menu
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 6,
                  childAspectRatio: 1.5,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildMenuItem(
                        icon: Icons.directions_car,
                        label: 'Kendaraan',
                        type: MenuItemType.SOON,
                        context: context),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildMenuItem(
      {required IconData icon,
      required String label,
      required BuildContext context,
      MenuItemType type = MenuItemType.DEFAULT}) {
    Offset iconOffset;
    Widget iconIndicator;

    // Set the color based on the type
    switch (type) {
      case MenuItemType.NEW:
        iconOffset = const Offset(16.0, -10.0);
        iconIndicator = Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(context, 4)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2), color: kSecondaryColor),
            child: buildTextCustom(context, "NEW",
                color: kWhiteColor, weight: 'w600', fontSize: 4));
        break;
      case MenuItemType.LOCKED:
        iconOffset = const Offset(12.0, -12.0);
        iconIndicator = Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(context, 5)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kSecondaryColor),
            child: Icon(
              Icons.lock, // Replace with the actual icon you want
              size: 16.0,
              color: kWhiteColor,
            ));
        break;
      case MenuItemType.SOON:
        iconOffset = const Offset(12.0, -12.0);
        iconIndicator = Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(context, 5)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kSecondaryColor),
            child: Icon(
              Icons.build, // Replace with the actual icon you want
              size: 16.0,
              color: kWhiteColor,
            ));
      default:
        iconOffset = const Offset(0.0, 0.0);
        iconIndicator = Container(); // Empty container for default
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(context, 8)),
              margin: EdgeInsets.only(
                  bottom: getProportionateScreenWidth(context, 8)),
              decoration: BoxDecoration(
                  color: type != MenuItemType.SOON
                      ? kPrimaryColor
                      : Colors.black26,
                  borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(context, 6))),
              child: Icon(
                icon,
                size: 30,
                color: kWhiteColor,
              ),
            ),
            Positioned(
                top: 0.0,
                right: 0.0,
                child: Transform.translate(
                  offset: iconOffset,
                  child: iconIndicator,
                ))
          ],
        ),
        buildTextCustom(context, label, fontSize: 6, align: 'center'),
      ],
    );
  }
}
