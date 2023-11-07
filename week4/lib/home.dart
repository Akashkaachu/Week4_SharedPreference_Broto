import 'package:flutter/material.dart';
import 'package:week4/sign_up.dart';

class HomePg extends StatelessWidget {
  const HomePg({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.deepOrange,
      drawer: Drawer(
          child: ListTile(
        trailing: const CircleAvatar(
          backgroundImage: AssetImage("assets/images/hoooi.jpg"),
          radius: 40,
        ),
        leading: const Icon(Icons.logout_rounded),
        title: InkWell(
          //inkwell or guestordirector can be used
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("LogOut"),
                  content: const Text("Log Out of your account"),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => SignupScrn(),
                              ),
                              (route) => false);
                        },
                        child: const Text("Log out")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel"))
                  ],
                );
              },
            );
          },
          child: const Text(
            "LogOut",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      )),
      appBar: AppBar(
        title: const Text("SpIZy..!"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/hoooi.jpg"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: const [
          Container_Widget(
              textt: "Spicy Tandoori Burger ",
              color: Colors.black87,
              imageSrc: "assets/images/WEEK4.2.jpg"),
          SizedBox(
            height: 30,
          ),
          Container_Widget(
              textt: ("Beef Hatkora"),
              color: Colors.black87,
              imageSrc: "assets/images/wee4.6.jpg"),
          SizedBox(
            height: 30,
          ),
          Container_Widget(
              textt: "Barberton chicken",
              color: Colors.black87,
              imageSrc: "assets/images/WEEK4.1.jpg"),
          SizedBox(
            height: 30,
          ),
          Container_Widget(
              textt: "Barbecue",
              color: Colors.black87,
              imageSrc: "assets/images/WEEK4.3.jpg"),
          SizedBox(
            height: 30,
          ),
          Container_Widget(
              textt: "White Chicken Chili.",
              color: Colors.black87,
              imageSrc: "assets/images/WEEK4.4.jpg"),
        ]),
      ),
    ));
  }
}

class Container_Widget extends StatelessWidget {
  const Container_Widget({
    super.key,
    required this.color,
    required this.imageSrc,
    required this.textt,
  });
  final Color color;
  final String imageSrc;
  final String textt;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(5, 8), blurRadius: 20)
        ],
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      padding: const EdgeInsets.all(10),
      height: 250,
      width: 250,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        CircleAvatar(
          radius: 70,
          backgroundImage: AssetImage(imageSrc),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          textt,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ]),
    );
  }
}
