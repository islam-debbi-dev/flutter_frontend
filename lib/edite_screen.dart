import 'package:flutter/material.dart';
import 'package:frontend/models/person_model.dart';
import 'package:frontend/services/api.dart';

class EditeScreen extends StatefulWidget {
  const EditeScreen({super.key, required this.data});

  final PersonModel data;
  @override
  State<EditeScreen> createState() => _EditeScreenPageState();
}

class _EditeScreenPageState extends State<EditeScreen> {
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.data.name.toString();
    ageController.text = widget.data.age.toString();
    emailController.text = widget.data.email.toString();
    passwordController.text = widget.data.password.toString();
  }

  Future<void> _showConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Update'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to update this user?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Update'),
              onPressed: () async {
                if (widget.data.id != null) {
                  await Api.updatePerson(widget.data.id!, {
                    'pname': nameController.text,
                    'page': ageController.text,
                    'pemail': emailController.text,
                    'ppassword': passwordController.text,
                  });
                  Navigator.pushNamed(context, '/');
                } else {
                  // Handle the case where id is null
                  print('Error: User ID is null');
                }
              },
            ),
          ],
        );
      },
    );
  }

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
                  Container(
                    margin: EdgeInsets.only(left: 70, right: 70),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter your name',
                        hintStyle: TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.only(left: 70, right: 70),
                    child: TextField(
                      controller: ageController,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        hintText: 'Enter your age',
                        hintStyle: TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.only(left: 70, right: 70),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.only(left: 70, right: 70),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 34, 45, 55)),
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: Colors.blue),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                  ElevatedButton.icon(
                      onPressed: _showConfirmationDialog,
                      icon: Icon(Icons.create, color: Colors.blue),
                      label: Text(
                        'Update',
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40, left: 75),
              child: Text(
                'Update Users',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_outlined,
                    color: Colors.white),
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
