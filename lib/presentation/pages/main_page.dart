import 'package:flutter/material.dart';
import 'package:weather_app/app/config/common/constant_value.dart';
import 'package:weather_app/app/config/common/date_formatter.dart';
import 'package:weather_app/app/styles/color_pallete.dart';
import 'package:weather_app/app/styles/text_style_custom.dart';
import 'package:weather_app/data/datasource/weather_datasource.dart';
import 'package:weather_app/data/models/current_weather_response.dart';
import 'package:weather_app/data/models/forecast_weather_response.dart';

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
          FutureBuilder<ForecastWeatherResponse>(
            future: WeatherDatasource().fetchForecastWeather({
              'lat': -6.321186427134191,
              'lon': 106.64302853378655,
              'appid': apiKey
            }),
            builder: (context, snapshot) {
             if (snapshot.connectionState == ConnectionState.done) {
               if (snapshot.hasData) {
                  return Container(
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
                        itemCount: snapshot.data!.list!.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var item = snapshot.data!.list![index];
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                Text(
                                  dayFormatDate(item.dtTxt!),
                                  style: styleTextNormal(
                                    fontColor: colorWhite,
                                    isBold: true,
                                  ),
                                ),
              
                                Icon(Icons.bolt, color: colorAccent),
                                Text(
                                  timeFormatTime(item.dtTxt!),
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
              );
               } else {
                 return SizedBox();
               }
             } else {
               return SizedBox();
             }
            }
          ),
          FutureBuilder<CurrentWeatherResponse>(
            future: WeatherDatasource().fetchCurrentWeather({
              'lat': -6.321186427134191,
              'lon': 106.64302853378655,
              'units': 'metric',
              'appid': apiKey
            }),
            builder: (context, snapshot) {
             if (snapshot.connectionState == ConnectionState.done) {
               if (snapshot.hasData) {
                  return Container(
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
                            snapshot.data!.name!,
                            style: styleTextMedium(fontColor: colorWhite),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Image.network(
                          'https://openweathermap.org/img/wn/${snapshot.data!.weather!.first.icon}@2x.png',
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          "${snapshot.data!.main!.temp} C",
                          style: styleTextXtraLarge(
                            fontColor: colorWhite,
                            isBold: true,
                          ),
                        ),
                        Text(
                          snapshot.data!.weather!.first.main!,
                          style: styleTextLarge(
                            fontColor: colorWhite,
                            isBold: true,
                          ),
                        ),
                        Text(
                          fullFormatDate(DateTime.now()),
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
                              "${snapshot.data!.wind!.speed} km/h",
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
                              "${snapshot.data!.main!.humidity} %",
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
                              "${snapshot.data!.main!.tempMin} C",
                              style: styleTextNormal(
                                fontColor: colorWhite,
                                isBold: true,
                              ),
                            ),
                            Text(
                              "Min Temp",
                              style: styleTextNormal(fontColor: colorWhite),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "${snapshot.data!.main!.tempMax} C",
                              style: styleTextNormal(
                                fontColor: colorWhite,
                                isBold: true,
                              ),
                            ),
                            Text(
                              "Max Temp",
                              style: styleTextNormal(fontColor: colorWhite),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
               } else {
                 return SizedBox();
               }
             } else {
               return SizedBox();
             }
            }
          ),
        ],
      ),
    );
  }
}
