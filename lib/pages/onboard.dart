import '../utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingPage extends StatefulWidget {
  OnBoardingPage({Key key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator(){
    List<Widget> list = [];
    for(int i = 0; i < _numPages; i++){
      list.add( i == _currentPage ? _indicator(true) : _indicator(false) );
    }

    return list;
  }

  Widget _indicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7B51D3),
        borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF3594DD),
                  Color(0xFF4563DB),
                  Color(0xFF5036D5),
                  Color(0xFF5B16D0),
                ]),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => print('Skip'),
                    child: Text(
                      'Pular',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  height: 550.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage('src/assets/onboarding0.png'),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              'Conecte pessoas ao redor do mundo',
                              style: kTitleStyle,
                            ),
                            SizedBox(),
                            Text(
                              'Lorem Ipsum é simplesmente uma simulação\n de texto da indústria tipográfica e de impressos.',
                              style: kSubtitleStyle,
                            ),
                            
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage('src/assets/onboarding1.png'),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              'Tenha uma vida mais produtiva com a gente',
                              style: kTitleStyle,
                            ),
                            SizedBox(),
                            Text(
                              'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos.',
                              style: kSubtitleStyle,
                            ),
                            
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage('src/assets/onboarding2.png'),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'Viva novas experiências',
                              style: kTitleStyle,
                            ),
                            SizedBox(),
                            Text(
                              'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos.',
                              style: kSubtitleStyle,
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1 ? 
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Próximo',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                            ),
                            SizedBox(height: 10.0,),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 30.0,
                            )
                        ],
                      ),
                    ),
                  ),
                )
                :
                Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
      ? Container(
        height: 60.0,
        width: double.infinity,
        color: Colors.white,
        child: GestureDetector(
            onTap: () => print('Vamos Começar'),
            child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Vamos Começar',
                style: TextStyle(
                  color: Color(0xFF5B16D0),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),
          ),
        ),
      )
      : Text(''),
    );
  }
}
