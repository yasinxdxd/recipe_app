import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/ui/screens/widgets/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: ExactAssetImage('assets/images/aberk.png'),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.primaryColor.withOpacity(.5),
                  width: 5.0,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: size.width * .3,
              child: Row(
                children: [
                  Text(
                    'Abdullah Berk İpek',
                    style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                      height: 24,
                      child: Image.asset("assets/images/verified.png")),
                ],
              ),
            ),
            Text(
              'melihgumus547@gmail.com',
              style: TextStyle(
                color: Constants.blackColor.withOpacity(.3),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: size.height * .7,
              width: size.width,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileWidget(
                    icon: Icons.person,
                    title: 'Profilim',
                  ),
                  ProfileWidget(
                    icon: Icons.settings,
                    title: 'Ayarlar',
                  ),
                  ProfileWidget(
                    icon: Icons.notifications,
                    title: 'Bildirimler',
                  ),
                  ProfileWidget(
                    icon: Icons.chat,
                    title: 'Sıkça Sorulan Sorular',
                  ),
                  ProfileWidget(
                    icon: Icons.share,
                    title: 'Paylaş',
                  ),
                  ProfileWidget(
                    icon: Icons.logout,
                    title: 'Çıkış Yap',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
