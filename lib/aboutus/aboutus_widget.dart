import '/components/footer/footer_widget.dart';
import '/components/mobile/app_bar_mobile_back/app_bar_mobile_back_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'aboutus_model.dart';
export 'aboutus_model.dart';

class AboutusWidget extends StatefulWidget {
  const AboutusWidget({super.key});

  @override
  State<AboutusWidget> createState() => _AboutusWidgetState();
}

class _AboutusWidgetState extends State<AboutusWidget> {
  late AboutusModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutusModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Aboutus'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/Frame_656_(1).jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
            ))
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const NavBarWidget(),
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 2.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 1.0),
                            child: Text(
                              'About US',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 30.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'Trobits: Your Fun Zone for Crypto News and Community',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Text(
                              'Welcome to Trobits! We\'re a passionate group dedicated to making the exciting world of cryptocurrency\nand blockchain technology accessible and engaging for everyone. Whether you\'re a seasoned crypto\nenthusiast or just starting your journey, Trobits is your one-stop shop for news, information, and fun.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Text(
                              'What We Offer:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Text(
                              'Up-to-date Crypto News: Keep up with the most recent happenings in the cryptocurrency world, from\nbreaking news to detailed analyses of currencies, projects, and trends.\n\nEngaging Articles: We provide a variety of articles on various crypto topics, written in a clear and easy-\nto-understand manner.\n\nPlayful Games: Take a break from the market and test your crypto knowledge with our interactive\ngames. It\'s a fun way to learn and stay sharp.\n\nVibrant Social Community: Join our thriving social section and connect with other crypto enthusiasts.\nShare ideas, discuss the latest news, or simply have fun chatting.\n\nMaking a Difference: We believe in the potential of crypto and blockchain. That\'s why we use ad\nrevenue to burn LUNC and SHIB tokens, contributing to a more sustainable crypto ecosystem. You can\nsee the impact on our homepage – live visitor counter, ad revenue generated, and the amount of LUNC\nand SHIB burned!\n\nDonations Welcome: While there\'s no need to purchase anything, we appreciate any contributions you\nmight like to make to support our burning efforts. There\'s a convenient DONATE button on the\nhomepage for this purpose.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Text(
                              'Why Choose Trobits?',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Text(
                              '• We make crypto fun and approachable.\n• We provide a safe and welcoming space for crypto enthusiasts of all levels.\n• We\'re committed to transparency and showing the impact of our burning efforts.\n• We\'re constantly innovating and adding new features to keep things exciting.\n\nJoin the Trobits community today and experience the world of crypto in a whole new way!\n\n',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Text(
                            'Meet the Team',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 25.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                300.0, 0.0, 300.0, 0.0),
                            child: Text(
                              'Tabi \n\nTabi was a crypto skeptic who became a believer in 2021. He ventured into the crypto world through bot trading. He began to read avidly on block chain technology and cryptocurrencies. Unfortunately, in November 2021, Bitcoin hit the All-Time-High and the crypto winter began. He bought the “dip” expecting a quick turnaround. This didn’t come. His positions were in the “Red”. He invested even more, into many cryptocurrencies especially LUNA and SHIB. He invested heavily in the Anchor Protocol. Then came the famous crash of May 2021 and his fortunes were wiped. However, like all the Lunatics out there, he believes in the revival of the now LUNA Classic (LUNC). Together with his friends, they have been exploring creative ways to aid that revival process and get LUNC back to its glory days. \n\n \n\nRolin \n\nRolin is a crypto enthusiast. He believes the industry has the potential to change the financial landscape of the world. He started investing in crypto in 2021 and holds significant positions in both LUNC and SHIB. Unfortunately we all experienced significant loss during the crypto winter. Instead of waiting on the sideline and hope for price to rebound he decided to be a part of the solution. We have created Trobits which is a platform where the Lunatics and the Shiba army can interact for a common goal to take our beloved tokens to the moon. \n\n\n\nCalvin \n\nCalvin is currently the secretary of the Trobits and has been involved in cryptocurrencies for several years, mostly holding assets in Shiba Inu and Cardano.  He has been working in the Information Technology field for over 20 years in various roles for Fortune 500 companies.  He holds a degree as Information Security Specialist and various IT certifications.  \nCalvin enjoys spending time with his family and friends, an avid fisherman and loves to travel. \n\n\n\nBernard\n\nWith the relentless growth and acceptance of cryptocurrency, Bernard believes there is a need for crypto social communities. He is passionate about bridging technology and social connectivity, contributing to the development of an inclusive space where technology and community intersect. Bernard aims to harness the transformative power of crypto to build resilient, forward-thinking communities and foster a more connected, equitable digital future.\n\n\nArrey\n\nThe growth of cryptocurrency market is evident. It is never too late to take action. Arrey believes in the  use of digital media to change the narrative around cryptocurrency and power the value of coins that have stood the test of time. Arrey is strongly behind building strong online communities of crypto enthusiates who will work together to archive a common goal.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.footerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: const FooterWidget(),
                      ),
                    ),
                  ],
                ),
              ),
            if (responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            ))
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.appBarMobileBackModel,
                        updateCallback: () => safeSetState(() {}),
                        child: const AppBarMobileBackWidget(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 12.0, 20.0, 50.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'Trobits: Your Fun Zone for Crypto News and Community',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Text(
                            'Welcome to Trobits! We\'re a passionate group dedicated to making the exciting world of cryptocurrency\nand blockchain technology accessible and engaging for everyone. Whether you\'re a seasoned crypto\nenthusiast or just starting your journey, Trobits is your one-stop shop for news, information, and fun.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            'What We Offer:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            'Up-to-date Crypto News: Keep up with the most recent happenings in the cryptocurrency world, from\nbreaking news to detailed analyses of currencies, projects, and trends.\n\nEngaging Articles: We provide a variety of articles on various crypto topics, written in a clear and easy-\nto-understand manner.\n\nPlayful Games: Take a break from the market and test your crypto knowledge with our interactive\ngames. It\'s a fun way to learn and stay sharp.\n\nVibrant Social Community: Join our thriving social section and connect with other crypto enthusiasts.\nShare ideas, discuss the latest news, or simply have fun chatting.\n\nMaking a Difference: We believe in the potential of crypto and blockchain. That\'s why we use ad\nrevenue to burn LUNC and SHIB tokens, contributing to a more sustainable crypto ecosystem. You can\nsee the impact on our homepage – live visitor counter, ad revenue generated, and the amount of LUNC\nand SHIB burned!\n\nDonations Welcome: While there\'s no need to purchase anything, we appreciate any contributions you\nmight like to make to support our burning efforts. There\'s a convenient DONATE button on the\nhomepage for this purpose.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            'Why Choose Trobits?',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            '• We make crypto fun and approachable.\n• We provide a safe and welcoming space for crypto enthusiasts of all levels.\n• We\'re committed to transparency and showing the impact of our burning efforts.\n• We\'re constantly innovating and adding new features to keep things exciting.\n\nJoin the Trobits community today and experience the world of crypto in a whole new way!',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(const SizedBox(height: 20.0)),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
