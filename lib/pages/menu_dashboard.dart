import '../models/transaction.dart';
import 'package:flutter/material.dart';

final Color backgroundColor = Color(0xFF5a457d);

class MenuDashboardPage extends StatefulWidget {
  MenuDashboardPage({Key key}) : super(key: key);

  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  bool isColapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _animationController;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: duration);
    _scaleAnimation =
        Tween<double>(begin: 1, end: 0.6).animate(_animationController);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_animationController);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_animationController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius: BorderRadius.circular(75),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'src/assets/profile.jpeg')))),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isColapsed)
                                  _animationController.forward();
                                else
                                  _animationController.reverse();

                                isColapsed = !isColapsed;
                              });
                            },
                            child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Tony Amaral',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'São Paulo, Brasil',
                      style: TextStyle(color: Colors.white54, fontSize: 20.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.dashboard,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'Dashboard',
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.message,
                      color: Colors.white38,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'Mensagens',
                      style: TextStyle(color: Colors.white38, fontSize: 22.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.apps,
                      color: Colors.white38,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'Utilidades',
                      style: TextStyle(color: Colors.white38, fontSize: 22.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.attach_money,
                      color: Colors.white38,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'Tranferencias',
                      style: TextStyle(color: Colors.white38, fontSize: 22.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.supervised_user_circle,
                      color: Colors.white38,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'Perfil',
                      style: TextStyle(color: Colors.white38, fontSize: 22.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.white38,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'Sair',
                      style: TextStyle(color: Colors.white38, fontSize: 22.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isColapsed ? 0 : 0.6 * screenWidth,
      right: isColapsed ? 0 : -0.4 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          borderRadius: isColapsed ? null : BorderRadius.circular(40.0),
          elevation: 8,
          color: backgroundColor,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      InkWell(
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 35,
                        ),
                        onTap: () {
                          setState(() {
                            if (isColapsed)
                              _animationController.forward();
                            else
                              _animationController.reverse();

                            isColapsed = !isColapsed;
                          });
                        },
                      ),
                      Text(
                        'Meus Cartões',
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Ultimas Transações',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 300,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: transactions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    transactions[index].icon,
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        transactions[index].title,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        transactions[index].subtitle,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white60,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '${transactions[index].price} R\$',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          height: 16,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
