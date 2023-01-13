import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map arg = {};

  @override
  Widget build(BuildContext context) {
    arg = ModalRoute.of(context)?.settings.arguments as Map;
    print(arg);

    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context,"/location");
                },
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                label: const Text("Edit Location"),
                icon: const Icon(Icons.edit_location),

              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(arg['location'],
                  style: const TextStyle(
                    fontSize: 28,
                    letterSpacing: 2,
                  ),),
                ],
              ),
              const SizedBox(height: 20,),
              Text(
                arg['time'],
                style: const TextStyle(
                  fontSize: 65,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
