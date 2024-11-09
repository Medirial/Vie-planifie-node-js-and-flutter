import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task_planner/screens/calendar_page.dart';
import 'package:task_planner/theme/colors/light_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:task_planner/widgets/task_column.dart';
import 'package:task_planner/widgets/active_project_card.dart';
import 'package:task_planner/widgets/top_container.dart';

class HomePage extends StatelessWidget {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: const Color.fromARGB(255, 0, 0, 0),
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static Widget calendarIcon() {
    return Container(
      width: 50.0, // Set the desired width
      height: 50.0, // Set the desired height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0), // Set a small border radius
        color: Colors.black, // Background color
      ),
      child: Center(
        child: Icon(
          Icons.calendar_today,
          size: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 200,
              width: width,
              padding: EdgeInsets.all(0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Iconsax.notification,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              size: 30.0),
                          Icon(Iconsax.search_normal,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              size: 25.0),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: 90.0,
                            height: 90.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: LightColors.kDarkYellow,
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Outer progress ring
                                Container(
                                  width: 90.0,
                                  height: 90.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      width: 5.0,
                                    ),
                                  ),
                                ),
                                // Inner avatar
                                CircleAvatar(
                                  backgroundColor: LightColors.kBlue,
                                  radius: 35.0,
                                  backgroundImage: AssetImage(
                                    'assets/images/x.png',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'RIAL Mohamed',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Développeur full stack',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: const Color.fromARGB(
                                        115, 238, 235, 235),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('Mes Taches'),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CalendarPage()),
                                  );
                                },
                                child: calendarIcon(),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust the radius as needed
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 0, 0, 0)
                                      .withOpacity(0.04), // Shadow color
                                  offset: Offset(
                                      0, 4), // Horizontal and vertical offset
                                  blurRadius: 8.0, // Blur radius
                                  spreadRadius: 2.0, // Spread radius
                                ),
                              ],
                            ),
                            child: TaskColumn(
                              icon: Iconsax.alarm,
                              iconBackgroundColor:
                                  Color.fromARGB(255, 203, 215, 126),
                              title: 'Faire',
                              subtitle: '2 tâches ',
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust the radius as needed
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.04), // Shadow color
                                  offset: Offset(
                                      0, 4), // Horizontal and vertical offset
                                  blurRadius: 8.0, // Blur radius
                                  spreadRadius: 2.0, // Spread radius
                                ),
                              ],
                            ),
                            child: TaskColumn(
                              icon: Iconsax.programming_arrow,
                              iconBackgroundColor:
                                  Color.fromARGB(255, 90, 85, 85),
                              title: 'En cours',
                              subtitle: '1 tâches',
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust the radius as needed
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.04), // Shadow color
                                  offset: Offset(
                                      0, 4), // Horizontal and vertical offset
                                  blurRadius: 8.0, // Blur radius
                                  spreadRadius: 2.0, // Spread radius
                                ),
                              ],
                            ),
                            child: TaskColumn(
                              icon: Iconsax.copy_success,
                              iconBackgroundColor:
                                  Color.fromARGB(255, 167, 160, 211),
                              title: 'Accompli',
                              subtitle: '2 tâches',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Projets Acteuls'),
                          SizedBox(height: 5.0),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor:
                                    const Color.fromARGB(255, 40, 40, 40),
                                loadingPercent: 0.4,
                                title: 'Developpement API X1',
                                subtitle: '22 heures de progrès',
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor:
                                    const Color.fromARGB(255, 167, 160, 211),
                                loadingPercent: 0.8,
                                title: 'Testez application Toto ',
                                subtitle: '15 heures de progrès',
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor:
                                    const Color.fromARGB(255, 221, 221, 221),
                                loadingPercent: 0.6,
                                title: 'Making History Notes',
                                subtitle: '20 heures de progrès',
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                cardColor: LightColors.kRed,
                                loadingPercent: 0.6,
                                title: 'Making History Notes',
                                subtitle: '20 heures de progrès',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
