import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              // Removed color property to avoid conflict with decoration
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.greenAccent]),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/create');
                      },
                      icon: Icon(Icons.create),
                      label: Text('Create')),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/update');
                      },
                      icon: Icon(Icons.update),
                      label: Text('Update')),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                      label: Text('Delete')),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/display');
                      },
                      icon: Icon(Icons.read_more),
                      label: Text('Read')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
