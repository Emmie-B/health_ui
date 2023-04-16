import "package:flutter/material.dart";

void main() {
  runApp(New());
}

class New extends StatelessWidget {
  New({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List symptoms = [
    "🤒 Temperature",
    "🤧 Snuffle",
    "🤕 Headache",
    "🤧 Snuffle",
    "🤧 Snuffle",
  ];
  List doctors = [
    Doctors(
        name: 'Dr Koroma',
        profession: 'Pediatrician',
        rating: "⭐️ 5",
        image: "assets/images/doctor2.png"),
    Doctors(
        name: 'Dr Bangura',
        profession: 'Pediatrician',
        rating: "⭐️ 5",
        image: "assets/images/nutritionist.png"),
    Doctors(
        name: 'Dr Koroma',
        profession: 'Pediatrician',
        rating: "⭐️ 5",
        image: "assets/images/nurse.png"),
    Doctors(
        name: 'Dr Koroma',
        profession: 'Pediatrician',
        rating: "⭐️ 5",
        image: "assets/images/doctor2.png"),
    Doctors(
        name: 'Dr Koroma',
        profession: 'Pediatrician',
        rating: "⭐️ 5",
        image: "assets/images/doctor2.png"),
    Doctors(
        name: 'Dr Koroma',
        profession: 'Pediatrician',
        rating: "⭐️ 5",
        image: "assets/images/doctor2.png"),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        automaticallyImplyLeading: false,
        title: Text(
          'Emmie Bangs 👋',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Image.asset(
              'assets/images/profile.png',
              height: 50,
              width: 50,
            ),
          )
        ],
        toolbarHeight: 70,
        elevation: 0,
        // toolbarHeight: h*.3 ,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visit(
                      color: Colors.deepPurpleAccent,
                      type: "Clinic",
                      prompt: "Make an appointment",
                      ww: (w - 20) * .5,
                      icon: Icon(
                        Icons.add,
                        color: Colors.deepPurpleAccent,
                        size: 30,
                      ),
                    ),
                    Visit(
                      color: Colors.white12,
                      type: "Clinic",
                      prompt: "Make an appointment",
                      ww: (w - 20) * .5,
                      icon: Icon(
                        Icons.home_outlined,
                        fill: 1,
                        color: Colors.deepPurpleAccent,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                  child: Text("What are your symptoms?"),
                  alignment: Alignment.topLeft,
                ),
                SizedBox(
                  height: 12,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: symptoms
                        .map((toms) => Container(
                              margin: EdgeInsets.all(8),
                              height: 50,
                              width: 130,
                              child: Align(
                                child: Text(toms),
                                alignment: Alignment.center,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                  child: Text("What are your symptoms?"),
                  alignment: Alignment.topLeft,
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 500,
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: doctors
                        .map(
                          (doctor) => Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  doctor.image,
                                  height: 50,
                                  width: 50,
                                ),
                                Text(doctor.name),
                                Text(doctor.profession),
                                Text(doctor.rating)
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.deepPurpleAccent,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() {
        currentIndex = index;
          
        }),
        // backgroundColor: Colors.deepOrangeAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            
            

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Schedule',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Message',
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Visit extends StatelessWidget {
  final String? type;
  final double? ww;
  final double? hh;
  final String? prompt;
  final Color? color;
  final Icon? icon;
  Visit(
      {super.key,
      this.type,
      this.prompt,
      this.icon,
      this.ww,
      this.hh,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: EdgeInsets.all(20),
      height: hh,
      width: ww,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: icon,
            backgroundColor: Colors.white,
            radius: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type!,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                prompt!,
                style: TextStyle(color: Colors.white60, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Doctors {
  String? image;
  String name;
  String? profession;
  String? rating;

  Doctors({required this.name, this.profession, this.rating, this.image});
}
