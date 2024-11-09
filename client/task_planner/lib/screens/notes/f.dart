import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FolderRow extends StatelessWidget {
  const FolderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Folders',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _buildFolderButtons(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build a list of folder buttons
  List<Widget> _buildFolderButtons() {
    List<String> folderNames = [
      "Add Folder",
      "First Folder",
      "Second Folder",
      "Third Folder",
      "Fourth Folder"
    ];
    List<Widget> buttons = [];

    for (var name in folderNames) {
      buttons.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ElevatedButton.icon(
          onPressed: () {
            // Define action here for each button
          },
          icon: name == "Add Folder"
              ? const Icon(Iconsax.folder_add, color: Colors.white)
              : const Icon(Iconsax.folder_2, color: Colors.white),
          label: Text(name, style: const TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade800,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ));
    }
    return buttons;
  }
}

void main() {
  runApp(const MaterialApp(
    home: FolderRow(),
  ));
}
