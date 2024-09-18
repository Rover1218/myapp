import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import for custom fonts

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        primaryColor: Colors.blueAccent,
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> with TickerProviderStateMixin {
  late final AnimationController _backgroundController;
  late final AnimationController _shadowController;
  late final AnimationController _iconRotationController;

  @override
  void initState() {
    super.initState();

    // Background gradient animation
    _backgroundController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    // Card shadow pulsating animation
    _shadowController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // Icon rotation animation
    _iconRotationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    _shadowController.dispose();
    _iconRotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _backgroundController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.lerp(Colors.blueAccent, Colors.teal, _backgroundController.value)!,
                  Color.lerp(Colors.teal, Colors.blueAccent, _backgroundController.value)!
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMV4Tl-Aaafrmi-L8EPzD1244MK43q9suRxQ&s'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "Anindya Kanti Das",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Student",
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  buildCard(
                    title: "About Me",
                    content: const Text(
                      "Lazy Coder who loves to learn new things. Basic knowledge of Flutter and made some projects with HTML, CSS, Express.js, etc.",
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 20),
                  buildCard(
                    title: "Skills",
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        ListTile(
                          leading: Icon(Icons.android, color: Color.fromARGB(255, 0, 255, 247)),
                          title: Text("Flutter Development", style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.cloud, color: Color.fromARGB(255, 0, 255, 242)),
                          title: Text("Firebase Integration, SQL, MongoDB", style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.api, color: Color.fromARGB(255, 0, 242, 255)),
                          title: Text("Node.js Backend", style: TextStyle(color: Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(Icons.code, color: Color.fromARGB(255, 0, 234, 255)),
                          title: Text("HTML, CSS, Express, C, Python", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    icon: Icons.lightbulb,
                  ),
                  const SizedBox(height: 20),
                  buildCard(
                    title: "Contact",
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.email, color: Color.fromARGB(255, 0, 234, 255)),
                            SizedBox(width: 10),
                            Text("anindyakanti2020@gmail.com", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: const [
                            Icon(Icons.phone, color: Color.fromARGB(255, 0, 234, 255)),
                            SizedBox(width: 10),
                            Text("xxx-xxx-xxx-x", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                    icon: Icons.contact_mail,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Card buildCard(
      {required String title,
      required Widget content,
      required IconData icon}) {
    return AnimatedBuilder(
      animation: _shadowController,
      builder: (context, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.only(bottom: 16.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, _shadowController.value * 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RotationTransition(
                    turns: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                      parent: _iconRotationController,
                      curve: Curves.linear,
                    )),
                    child: Icon(icon, color: Color.fromARGB(255, 0, 255, 251), size: 28),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              content,
            ],
          ),
        );
      },
    );
  }
}