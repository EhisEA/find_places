import 'package:flutter/material.dart';

class SearchViewHeader extends StatelessWidget {
  const SearchViewHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height / 2 / 2,
                color: Colors.red,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/bank.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            image: DecorationImage(
                                image: AssetImage("assets/images/hospital.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            image: DecorationImage(
                                image: AssetImage("assets/images/hotel.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            image: DecorationImage(
                                image: AssetImage("assets/images/gym.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2 / 2,
                color: Colors.red,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            image: DecorationImage(
                                image: AssetImage("assets/images/boutique.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            image: DecorationImage(
                                image: AssetImage("assets/images/cinema.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            image: DecorationImage(
                                image: AssetImage("assets/images/library.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            image: DecorationImage(
                                image: AssetImage("assets/images/park.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.black54,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Search for any place around you",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                    size: 50,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
