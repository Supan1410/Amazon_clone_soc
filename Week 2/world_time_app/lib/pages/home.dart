import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is Map<String, dynamic>) {
        data = args;
      }
    }

    String bgImage = data['isDaytime'] == true ? 'day.png' : 'night.png';
    Color? bgColor = data['isDaytime'] == true ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          // Background image covers full screen
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SafeArea(
            child: Stack(
              children: [
                // Custom vertical layout using Positioned.fill + Column
                Positioned.fill(
                  child: Column(
                    children: [
                      Spacer(flex: 1), // 1/4th of height

                      // Location + flag (larger box and text)
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(180, 187, 235, 238),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (data['flag'] != null)
                              Image.asset(
                                'assets/${data['flag']}',
                                height: 70,
                                width: 105,
                              ),
                            SizedBox(width: 20.0),
                            Text(
                              data['location'] ?? '',
                              style: TextStyle(
                                fontSize: 48.0,
                                letterSpacing: 2.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Spacer(flex: 1),

                      // Time at center
                      Text(
                        data['time'] ?? '',
                        style: TextStyle(
                          fontSize: 56.0,
                          color: const Color.fromARGB(255, 3, 104, 236),
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Spacer(flex: 2),
                    ],
                  ),
                ),

                // Edit Location button at bottom right
                Positioned(
                  bottom: 30,
                  right: 20,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      if (result != null) {
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag'],
                          };
                        });
                      }
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: const Color.fromARGB(255, 231, 3, 3),
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 231, 3, 3),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

