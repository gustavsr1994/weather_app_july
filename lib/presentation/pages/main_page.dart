import 'package:flutter/material.dart';
import 'package:weather_app/app/styles/color_pallete.dart';
import 'package:weather_app/app/styles/text_style_custom.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: colorBlack,
            height: MediaQuery.sizeOf(context).height,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today",
                      style: styleTextMedium(
                        fontColor: colorWhite,
                        isBold: true,
                      ),
                    ),
                    Text(
                      "See All",
                      style: styleTextNormal(fontColor: colorWhite),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 6,
                  child: ListView.builder(
                    itemCount: 15,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Text(
                              "23",
                              style: styleTextNormal(
                                fontColor: colorWhite,
                                isBold: true,
                              ),
                            ),

                            Icon(Icons.bolt, color: colorAccent),
                            Text(
                              "10:00",
                              style: styleTextSmall(
                                fontColor: colorWhite,
                                isBold: true,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  colorSecondary,
                  colorAccent,
                  colorPrimary,
                  colorSecondary,
                  colorPrimary,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            height: MediaQuery.sizeOf(context).height * (3 / 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.pin_drop, color: colorWhite),
                      Text(
                        "Location",
                        style: styleTextMedium(fontColor: colorWhite),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Image.network(
                      'https://openweathermap.org/img/wn/10d@2x.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "21",
                      style: styleTextXtraLarge(
                        fontColor: colorWhite,
                        isBold: true,
                      ),
                    ),
                    Text(
                      "Cloud",
                      style: styleTextLarge(
                        fontColor: colorWhite,
                        isBold: true,
                      ),
                    ),
                    Text(
                      "Monday, 15 Agustus 2025",
                      style: styleTextSmall(
                        fontColor: colorWhite,
                        isBold: true,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Divider(color: colorWhite, thickness: .5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "xx km/h",
                          style: styleTextNormal(
                            fontColor: colorWhite,
                            isBold: true,
                          ),
                        ),
                        Text(
                          "Wind",
                          style: styleTextNormal(fontColor: colorWhite),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "xx %",
                          style: styleTextNormal(
                            fontColor: colorWhite,
                            isBold: true,
                          ),
                        ),
                        Text(
                          "Humidity",
                          style: styleTextNormal(fontColor: colorWhite),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "xx %",
                          style: styleTextNormal(
                            fontColor: colorWhite,
                            isBold: true,
                          ),
                        ),
                        Text(
                          "Chance of rain",
                          style: styleTextNormal(fontColor: colorWhite),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
