import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:percent_indicator/percent_indicator.dart';

class ActiveProjectsCard extends StatelessWidget {
  final Color cardColor;
  final double loadingPercent;
  final String title;
  final String subtitle;

  ActiveProjectsCard({
    required this.cardColor,
    required this.loadingPercent,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: AspectRatio(
        aspectRatio: 2.2,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(20.0), // Adjusted border radius
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularPercentIndicator(
                animation: true,
                radius: 40.0, // Adjusted radius for a smaller indicator
                percent: loadingPercent,
                lineWidth: 5.0,
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: Colors.white10,
                progressColor: Colors.white,
                center: Text(
                  '${(loadingPercent * 100).round()}%',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 14.0, // Adjusted font size for better balance
                  ),
                ),
              ),
              SizedBox(width: 15), // Spacing between indicator and text
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.0, // Font size for title
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14.0, // Font size for subtitle
                          color: Colors.white54,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
