import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:find_places/constants/places.dart';
import 'package:find_places/clippers.dart';
import 'package:find_places/services/theme_service.dart';
import 'package:find_places/views/alt_home_view.dart';
import 'package:find_places/views/search_view.dart';
import 'package:find_places/widgets/place_widget.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (_, model, __) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: model.isDark
              ? SystemUiOverlayStyle(
                  // Use [dark] for white status bar and [light] for black status bar.
                  statusBarBrightness: Brightness.dark,
                )
              : SystemUiOverlayStyle(
                  // For iOS.
                  // Use [dark] for white status bar and [light] for black status bar.
                  statusBarBrightness: Brightness.light,
                ),
          child: GestureDetector(
            onLongPress: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => AltHomeView()),
              );
            },
            child: Scaffold(
              body: Column(
                children: [
                  SizedBox(height: 20),
                  // =====================================================
                  // ======================header section=================
                  // =====================================================
                  header(context,model),
                  // =====================================================
                  // ======================Places section=================
                  // =====================================================
                  Expanded(child: SingleChildScrollView(child: places())),
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
  header(context,model) {
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
            //initial value value: model.isDark,
            textOn: model.isDark ? 'Light' : 'Dark',
            textOff: model.isDark ? 'Light' : 'dark',
            colorOn: model.isDark ? Colors.grey[500] : Colors.grey[900],
            colorOff: model.isDark ? Colors.grey[500] : Colors.grey[900],
            animationDuration: Duration(milliseconds: 10),
            iconOn:
                model.isDark ? CupertinoIcons.brightness : Icons.brightness_3,

            iconOff:
                model.isDark ? CupertinoIcons.brightness : Icons.brightness_3,
            textSize: 16.0,
            onTap: model.toggleTheme,
            onChanged: (v) {},
          ),
        ),
      ],
    );
  }

  // =====================================================
  // ======================Places section=================
  // =====================================================
  places() {
    int contentCount = 0;
    return Container(
      height: (PlacesData.length * 262.9),
      child: Stack(
        children: PlacesData.map<Widget>(
          (place) {
            double contentSpace = (255.0 * contentCount);
            contentCount++;
            CustomClipper clipper;
            if (place["name"] == PlacesData.last["name"]) {
              clipper = BottomClipper();
            } else {
              clipper = Clipper();
            }
            return PlaceWidget(
              space: contentSpace,
              image: place["image"],
              place: place["name"],
              clipper: clipper,
            );
          },
        ).toList(),
      ),
    );
  }
}
