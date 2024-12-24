import 'package:flutter/material.dart';
import 'package:frontend/models/person_model.dart';

import 'services/api.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({super.key});

  @override
  State<UpdateData> createState() => _UpdateDataPageState();
}

class _UpdateDataPageState extends State<UpdateData> {
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
            Center(
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: Container(
                  margin: EdgeInsets.only(
                    top: 60,
                    left: 20,
                    right: 20,
                  ),
                  child: FutureBuilder(
                    future: Api.getPerson(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List<PersonModel> person = snapshot.data;
                        return ListView.builder(
                          itemCount: person.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Material(
                                elevation: 10,
                                borderRadius: BorderRadius.circular(25),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white54,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: ListTile(
                                      leading: Icon(Icons.person),
                                      title: Text(
                                          '${index + 1} Name : ${person[index].name}Age : ${person[index].age.toString()}'),
                                      subtitle: Text(
                                          'Email : ${person[index].email}'),
                                      trailing: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.edit_sharp))),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: Text(
                            'No data found',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 45, 54, 59),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, left: 150),
              child: Text(
                ' Users ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
