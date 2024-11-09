import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:io';

import 'package:task_planner/theme/colors/light_colors.dart';

class PageProfil extends StatefulWidget {
  const PageProfil({Key? key}) : super(key: key);

  @override
  _PageProfilState createState() => _PageProfilState();
}

class _PageProfilState extends State<PageProfil> {
  File? _imageProfil;

  Future<void> _choisirImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageProfil = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: LightColors.kDarkYellow,
    ));
    return Scaffold(
      backgroundColor: LightColors.kDarkYellow,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 190,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => _optionsChoixImage(),
                      );
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.transparent,
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: _imageProfil != null
                            ? FileImage(_imageProfil!)
                            : const AssetImage('assets/images/x.png')
                                as ImageProvider,
                        child: _imageProfil == null
                            ? const Image(
                                image: AssetImage('assets/images/x.png'))
                            : null,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 0),
            Text(
              'RIAL Mohamed',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Développeur Full Stack',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade400,
              ),
            ),
            const SizedBox(height: 30),
            boutonProfil(
              text: "Paramètres du Profil",
              onPressed: () {
                // Action des paramètres du profil
              },
              leftIcon: Iconsax.setting,
              backgroundColor: Colors.yellow.shade600,
            ),
            const SizedBox(height: 50),
            BoutonPersonnalise(
              text: "Paramètres",
              onPressed: () {
                // Action des paramètres
              },
              leftIcon: Iconsax.settings,
            ),
            const SizedBox(height: 20),
            BoutonPersonnalise(
              text: "Notifications",
              onPressed: () {
                // Action des notifications
              },
              leftIcon: Iconsax.notification,
            ),
            const SizedBox(height: 20),
            BoutonPersonnalise(
              text: "À propos de l'Application",
              onPressed: () {
                // Action à propos de l'application
              },
              leftIcon: Iconsax.info_circle,
            ),
            const SizedBox(height: 20),
            Divider(
              color: const Color.fromARGB(
                  76, 158, 158, 158), // Couleur de la ligne
              thickness: 1.0, // Épaisseur de la ligne
              indent: 20.0, // Padding gauche
              endIndent: 20.0, // Padding droit
            ),
            const SizedBox(height: 20),
            BoutonDeconnexion(
              text: "Déconnecter",
              onPressed: () {
                // Action de déconnexion
              },
              leftIcon: Iconsax.logout,
            ),
          ],
        ),
      ),
    );
  }

  // Options de Choix d'Image (Caméra/Galerie)
  Widget _optionsChoixImage() {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton.icon(
            icon: const Icon(Iconsax.camera, color: Colors.white),
            label: const Text('Prendre une Photo',
                style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pop(context);
              _choisirImage(ImageSource.camera);
            },
          ),
          TextButton.icon(
            icon: const Icon(Iconsax.gallery, color: Colors.white),
            label: const Text('Choisir depuis la Galerie',
                style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pop(context);
              _choisirImage(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }
}

// Widget Bouton Personnalisé
class BoutonPersonnalise extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData leftIcon;
  final Color backgroundColor;

  const BoutonPersonnalise({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.leftIcon,
    this.backgroundColor = const Color.fromARGB(255, 60, 60, 60),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(leftIcon, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Icon(Iconsax.arrow_right, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

class BoutonDeconnexion extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData leftIcon;
  final Color backgroundColor;

  const BoutonDeconnexion({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.leftIcon,
    this.backgroundColor = const Color.fromARGB(255, 141, 63, 63),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(leftIcon, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class boutonProfil extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData leftIcon;
  final Color backgroundColor;

  const boutonProfil({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.leftIcon,
    this.backgroundColor = const Color.fromARGB(255, 141, 63, 63),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(leftIcon, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
