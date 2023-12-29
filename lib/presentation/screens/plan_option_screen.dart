import 'package:first_app/models/card_content.dart';
import 'package:first_app/presentation/size_config/size_config.dart';
import 'package:first_app/presentation/widgets/exercis_of_option_bodypart_card.dart';
import 'package:flutter/material.dart';
import 'package:gradient_icon/gradient_icon.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CardContent card = const CardContent(
        name: "name of exercis", imgPath: "assets/images/exercises/dummy.jpeg");
    SizeConfig.init(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar.large(
            backgroundColor: const Color(0xFFBED8ED),
            leading: const BackButton(
              color: Color(0xFF455766),
            ),
            // centerTitle: true,
            title: const Text(
              "Daily Exercises",
              style: TextStyle(
                color: Color(0xFF455766),
              ),
            ),
            expandedHeight: SizeConfig.screenHeight * 0.35,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(card.imgPath),
                  fit: BoxFit.fill,
                )),
                child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF4d4d4d).withOpacity(0.1),
                          const Color(0xFF333333).withOpacity(0.4),
                          const Color(0xFF1a1a1a).withOpacity(0.5),
                          const Color(0xFF000000).withOpacity(0.5),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: SizeConfig.screenHeight * 0.05),
                          child: Text(
                            "Daily Exercises",
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontFamily: "CaesarDressing",
                              fontSize:
                                  SizeConfig.getProportionateScreenWidth(32),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        _Details(),
                      ],
                    )),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ExercisOfOptionBodyPartCard(card: card);
              },
              childCount: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _Details() {
    return Container(
      margin: const EdgeInsets.all(7.0),
      height: SizeConfig.screenHeight * 0.10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const GradientIcon(
                icon: Icons.timer_rounded,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFf91d15),
                    Color(0xFFf5bd2c),
                    Color(0xFFffffff),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                size: 40,
              ),
              Text(
                "48 min",
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: SizeConfig.getProportionateScreenWidth(15),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Duration",
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: SizeConfig.getProportionateScreenWidth(12),
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const GradientIcon(
                icon: Icons.local_fire_department,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFf91d15),
                    Color(0xFFf5bd2c),
                    Color(0xFFffffff),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                size: 40,
              ),
              Text(
                "203",
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: SizeConfig.getProportionateScreenWidth(15),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Calories",
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: SizeConfig.getProportionateScreenWidth(12),
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const GradientIcon(
                icon: Icons.numbers_rounded,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFf91d15),
                    Color(0xFFf5bd2c),
                    Color(0xFFffffff),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                size: 40,
              ),
              Text(
                "22",
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: SizeConfig.getProportionateScreenWidth(15),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Exercises",
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: SizeConfig.getProportionateScreenWidth(12),
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
