import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/activity_model.dart';
import 'package:travel_app/models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({super.key, required this.destination});

  final Destination destination;
  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {

  Row _builderRatingStars(int rating){
    var stars = <Widget>[];
    for(int i = 0; i < rating; i++){
      stars.add(const Icon(FontAwesomeIcons.solidStar, size: 12.0, color: Colors.yellow,
          shadows: [BoxShadow(color: Colors.black54, offset: Offset(0.0, 0.0), blurRadius: 2.0,
              spreadRadius: 1.0)],
        )
      );
      stars.add(const SizedBox(width: 5.0));
    }
    return Row(children: stars,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).focusColor,
      body: Column(children: <Widget>[

        Stack(children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [BoxShadow(color: Colors.black38, offset: Offset(0.0, 2.0), blurRadius: 6.0)],
              ),
              child: Hero(
                tag: widget.destination.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(
                    image: AssetImage(widget.destination.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Theme.of(context).shadowColor,
                  ),
                  Row(children: <Widget>[
                      IconButton(
                        onPressed: () => print("Search"),
                        icon: const Icon(FontAwesomeIcons.magnifyingGlass),
                        iconSize: 30.0,
                        color: Theme.of(context).shadowColor,
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(FontAwesomeIcons.arrowDownWideShort),
                        iconSize: 25.0,
                        color: Theme.of(context).shadowColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20.0,
              bottom: 20.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.destination.city,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20.0,
                        color: Colors.white, letterSpacing: 1.2),
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(FontAwesomeIcons.locationArrow, size: 15.0, color: Colors.white,),
                      const SizedBox(width: 5.0,),
                      Text(
                        widget.destination.country,
                        style: const TextStyle(
                            fontSize: 16.0, color: Colors.white70,
                            fontWeight: FontWeight.w400, letterSpacing: 1.0
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(Icons.location_on, color: Colors.white70, size: 25.0,)),
          ],
        ),


        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 12.0, bottom: 15.0),
            itemCount: widget.destination.activities.length,
            itemBuilder: (context, index) {
                Activity activity = widget.destination.activities[index];
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor, borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(100.0, 20, 20, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 120.0,
                                  child: Text(activity.name, style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text('\$${activity.price}', style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Text('per pax', style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                            Text(activity.type, style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              ),
                            ),
                            _builderRatingStars(activity.rating),
                            const SizedBox(height: 10.0,),
                            Row(children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(3.0),
                                width: 70.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: Alignment.center,
                                child:Text(activity.startTimes[0]),
                              ),
                              Container(
                                padding: const EdgeInsets.all(3.0),
                                width: 70.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: Alignment.center,
                                child:Text(activity.startTimes[1]),
                              ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          width: 110.0,
                          image: AssetImage(activity.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              },
          ),
        ),

        ],
      ),
    );
  }
}
