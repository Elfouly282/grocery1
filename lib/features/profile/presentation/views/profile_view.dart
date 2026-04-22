import 'package:flutter/material.dart';
import 'package:grocery1/core/resources/appassets.dart';
import 'package:grocery1/features/profile/presentation/widgets/profile_menu_item.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../delivery_addresses/presentation/views/delivery_addresses_view.dart';
import '../../../personal_details/presentation/views/personal_details_view.dart';
import '../widgets/divider_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.appbarBackground,
      appBar: AppBar(
        backgroundColor: ColorManager.appbarBackground,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios, size: 19),
        ),
        title: Text('My Profile', style: TextStyle(fontSize: 18,fontFamily: 'inter')),
      ),

      body: Column(
        children: [

          DividerWidget(),
          SizedBox(height: 15,),
          ProfileMenuItem(
              icon: Icons.person_2_outlined,
              title: "Personal details",
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PersonalDetailsView()),
                );

              }),

          DividerWidget(),

          ProfileMenuItem(
              icon: Icons.location_on_rounded,
              title: "Delivery addresses",
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) =>   DeliveryAddressesView()),
                );
              }),

          DividerWidget(),

          ProfileMenuItem(
              icon: Icons.notifications_active_outlined,
              title: "Notifications",
              onTap: (){
                //Navigator.pushNamed(context, '/notifications');
              }),

          DividerWidget(),

          ProfileMenuItem(
              icon: Icons.credit_card,
              title: "Payment methods",
              onTap: (){
                //Navigator.pushNamed(context, '/payment-methods');
              }),

          DividerWidget(),

          ProfileMenuItem(
              icon: Icons.settings_rounded,
              title: "Settings",
              onTap: (){
                //Navigator.pushNamed(context,'/settings');
              }),

          DividerWidget(),

          ProfileMenuItem(
              icon: Icons.help_outline_outlined,
              title: "Help & Support",
              onTap: (){
                //Navigator.pushNamed(context, '/help-support');
              }),

          DividerWidget(),

          ProfileMenuItem(
              icon: Icons.logout,
              title: "Logout",
              titleColor: ColorManager.error,
              onTap: (){
                //Navigator.pushNamed(context, '/log-out');
              }),

          DividerWidget(),

        ],
      ),
    );
  }
}
