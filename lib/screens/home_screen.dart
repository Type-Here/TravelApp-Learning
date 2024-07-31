import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/destination_carousel.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking
  ];

  Widget _buildIcon(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex = index;
        });
      },
      child:  Container(
          height: 60.0,
          width: 60.0,
          decoration:  BoxDecoration(
            color: _selectedIndex == index ? Theme.of(context).highlightColor : Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30.0)
          ),
          child: Icon(
            _icons[index],
            size: 25.0,
            color: Theme.of(context).primaryColor
          ),
        ),
    );
  }



  @override
  Widget build(BuildContext context) {

    var firstRowIcons = <Widget>[];
    for(int i = 0; i < _icons.length; i++){
      firstRowIcons.add(_buildIcon(i));
    }

    return Scaffold(
      body: SafeArea(child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[

            const Padding(
              padding: EdgeInsets.only(left:20.0, right: 120.0),
              child: Text('What would you like to Find?',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),

            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: firstRowIcons,
            ),

            const SizedBox(height: 20.0,),
            const DestinationCarousel(),

          ],
        )
      ),
    );
  }
}