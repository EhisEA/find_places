import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:find_places/constants/places.dart';
import 'package:find_places/services/theme_service.dart';
import 'package:find_places/views/home_view.dart';
import 'package:find_places/views/result_view.dart';
import 'package:find_places/views/search_view.dart';
import 'package:provider/provider.dart';

class AltHomeView extends StatelessWidget {
  const AltHomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (_, model, __) {
        return GestureDetector(
          onLongPress: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeView()),
            );
          },
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: model.isDark? SystemUiOverlayStyle(
              // Use [dark] for white status bar and [light] for black status bar.
              statusBarBrightness: Brightness.dark,
            ):SystemUiOverlayStyle(
              // For iOS.
              // Use [dark] for white status bar and [light] for black status bar.
              statusBarBrightness: Brightness.light,
            ),
            child: Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  header(context, model),
                  Expanded(
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 4,
                      padding: EdgeInsets.all(10),
                      itemCount: PlacesData.length,
                      itemBuilder: (BuildContext context, int index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ResultView(
                                placeToFind: PlacesData[index]["name"],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          fit: StackFit.loose,
                          children: [
                            Image.asset(
                              PlacesData[index]["image"],
                              fit: BoxFit.cover,
                            ),
                            Positioned.fill(
                                child: Container(
                              color: Colors.black.withOpacity(0.5),
                            )),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "* " + PlacesData[index]["name"],
                                style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // =====================================================
  // ======================header section=================
  // =====================================================
  header(context, ThemeService model) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.only(left: 60, right: 10, top: 60),
          child: Text(
            "Find Any Place around you",
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchView(),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                size: 30,
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 0,
          child: LiteRollingSwitch(
            //initial value
            value: model.isDark,
            textOn: model.isDark ? 'Light' : 'Dark',
            textOff: model.isDark ? 'Light' : 'dark',
            colorOn: model.isDark ? Colors.grey[500] : Colors.grey[900],
            colorOff: model.isDark ? Colors.grey[500] : Colors.grey[900],
            animationDuration: Duration(milliseconds: 10),
            iconOn:
                model.isDark ? Icons.brightness_3 : CupertinoIcons.brightness,

            iconOff:
                model.isDark ? Icons.brightness_3 : CupertinoIcons.brightness,
            textSize: 16.0,
            onTap: model.toggleTheme,
            onChanged: (v) {},
          ),
        ),
      ],
    );
  }
}
