import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/hotel_model.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Exclusive Hotels',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: () => print('See All'),
                child: Text('See all',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,

                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 300.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (context, index){
                Hotel hotel = hotels[index];
                return Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 240.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[

                      Positioned(
                        bottom: 10.0,
                        child: Container(
                          height: 120.0,
                          width: 240.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  hotel.name,
                                  style: const TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 2.0),
                                Text(
                                  hotel.address,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(height: 2.0,),
                                Text(
                                  '\$${hotel.price} / night',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [BoxShadow(
                              color: Theme.of(context).shadowColor,
                              offset: const Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                            ]
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            height: 180.0,
                            width: 220.0,
                            image: AssetImage(hotel.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
