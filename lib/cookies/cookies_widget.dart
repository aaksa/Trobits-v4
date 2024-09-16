import '/components/footer/footer_widget.dart';
import '/components/mobile/app_bar_mobile_back/app_bar_mobile_back_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'cookies_model.dart';
export 'cookies_model.dart';

class CookiesWidget extends StatefulWidget {
  const CookiesWidget({super.key});

  @override
  State<CookiesWidget> createState() => _CookiesWidgetState();
}

class _CookiesWidgetState extends State<CookiesWidget> {
  late CookiesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CookiesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'cookies'});
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
        body: SafeArea(
          top: true,
          child: Stack(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.navBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: const NavBarWidget(),
                      ),
                      Container(
                        width: 800.0,
                        constraints: const BoxConstraints(
                          maxHeight: 1500.0,
                        ),
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              100.0, 24.0, 100.0, 24.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      'Cookies',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                                custom_widgets.HtmlText(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  htmlText:
                                      '<h1>Cookies Policy</h1>\n<p>Last updated: August 25, 2024</p>\n<p>This Cookies Policy explains what Cookies are and how We use them. You should read this policy so You can understand what type of cookies We use, or the information We collect using Cookies and how that information is used. This Cookies Policy has been created with the help of the <a href=\"https://www.termsfeed.com/cookies-policy-generator/\" target=\"_blank\">Cookies Policy Generator</a>.</p>\n<p>Cookies do not typically contain any information that personally identifies a user, but personal information that we store about You may be linked to the information stored in and obtained from Cookies. For further information on how We use, store and keep your personal data secure, see our Privacy Policy.</p>\n<p>We do not store sensitive personal information, such as mailing addresses, account passwords, etc. in the Cookies We use.</p>\n<h2>Interpretation and Definitions</h2>\n<h3>Interpretation</h3>\n<p>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p>\n<h3>Definitions</h3>\n<p>For the purposes of this Cookies Policy:</p>\n<ul>\n<li><strong>Company</strong> (referred to as either &quot;the Company&quot;, &quot;We&quot;, &quot;Us&quot; or &quot;Our&quot; in this Cookies Policy) refers to Trobits, 5825 Larch Lane, Douglasville.</li>\n<li><strong>Cookies</strong> means small files that are placed on Your computer, mobile device or any other device by a website, containing details of your browsing history on that website among its many uses.</li>\n<li><strong>Website</strong> refers to Trobits, accessible from <a href=\"https://www.trobits.com\" rel=\"external nofollow noopener\" target=\"_blank\">https://www.trobits.com</a></li>\n<li><strong>You</strong> means the individual accessing or using the Website, or a company, or any legal entity on behalf of which such individual is accessing or using the Website, as applicable.</li>\n</ul>\n<h2>The use of the Cookies</h2>\n<h3>Type of Cookies We Use</h3>\n<p>Cookies can be &quot;Persistent&quot; or &quot;Session&quot; Cookies. Persistent Cookies remain on your personal computer or mobile device when You go offline, while Session Cookies are deleted as soon as You close your web browser.</p>\n<p>We use both session and persistent Cookies for the purposes set out below:</p>\n<ul>\n<li>\n<p><strong>Necessary / Essential Cookies</strong></p>\n<p>Type: Session Cookies</p>\n<p>Administered by: Us</p>\n<p>Purpose: These Cookies are essential to provide You with services available through the Website and to enable You to use some of its features. They help to authenticate users and prevent fraudulent use of user accounts. Without these Cookies, the services that You have asked for cannot be provided, and We only use these Cookies to provide You with those services.</p>\n</li>\n<li>\n<p><strong>Functionality Cookies</strong></p>\n<p>Type: Persistent Cookies</p>\n<p>Administered by: Us</p>\n<p>Purpose: These Cookies allow us to remember choices You make when You use the Website, such as remembering your login details or language preference. The purpose of these Cookies is to provide You with a more personal experience and to avoid You having to re-enter your preferences every time You use the Website.</p>\n</li>\n</ul>\n<h3>Your Choices Regarding Cookies</h3>\n<p>If You prefer to avoid the use of Cookies on the Website, first You must disable the use of Cookies in your browser and then delete the Cookies saved in your browser associated with this website. You may use this option for preventing the use of Cookies at any time.</p>\n<p>If You do not accept Our Cookies, You may experience some inconvenience in your use of the Website and some features may not function properly.</p>\n<p>If You\'d like to delete Cookies or instruct your web browser to delete or refuse Cookies, please visit the help pages of your web browser.</p>\n<ul>\n<li>\n<p>For the Chrome web browser, please visit this page from Google: <a href=\"https://support.google.com/accounts/answer/32050\" rel=\"external nofollow noopener\" target=\"_blank\">https://support.google.com/accounts/answer/32050</a></p>\n</li>\n<li>\n<p>For the Internet Explorer web browser, please visit this page from Microsoft: <a href=\"http://support.microsoft.com/kb/278835\" rel=\"external nofollow noopener\" target=\"_blank\">http://support.microsoft.com/kb/278835</a></p>\n</li>\n<li>\n<p>For the Firefox web browser, please visit this page from Mozilla: <a href=\"https://support.mozilla.org/en-US/kb/delete-cookies-remove-info-websites-stored\" rel=\"external nofollow noopener\" target=\"_blank\">https://support.mozilla.org/en-US/kb/delete-cookies-remove-info-websites-stored</a></p>\n</li>\n<li>\n<p>For the Safari web browser, please visit this page from Apple: <a href=\"https://support.apple.com/guide/safari/manage-cookies-and-website-data-sfri11471/mac\" rel=\"external nofollow noopener\" target=\"_blank\">https://support.apple.com/guide/safari/manage-cookies-and-website-data-sfri11471/mac</a></p>\n</li>\n</ul>\n<p>For any other web browser, please visit your web browser\'s official web pages.</p>\n<h3>More Information about Cookies</h3>\n<p>You can learn more about cookies here: <a href=\"https://www.termsfeed.com/blog/cookies/\" target=\"_blank\">All About Cookies by TermsFeed</a>.</p>\n<h3>Contact Us</h3>\n<p>If you have any questions about this Cookies Policy, You can contact us:</p>\n<ul>\n<li>By email: trobitscommunity@gmail.com</li>\n</ul>',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.footerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: const FooterWidget(),
                      ),
                    ].divide(const SizedBox(height: 5.0)),
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
                            20.0, 24.0, 20.0, 24.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Privacy Statement',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Text(
                                    'Introduction',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  'We at Trobits (\"Trobits,\" \"we,\" \"us,\" or \"our\") are dedicated to safeguarding user privacy. This privacy\nstatement describes the methods by which we gather, use, and share data from and about visitors to\nour website, trobits.com (\"Website\").',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Information We Collect',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Text(
                                    'We may collect the following information from users:\n\nNon-Personally Identifiable Information (NPII): This includes information that does not identify a specific\nindividual, such as:\n• Browser type\n• Operating system\n• Anonymized IP address (to understand general location data)\n• Referring / exit pages\n• Date/time stamps\n• Clickstream data (pages visited, links clicked, etc.)\n• Device information (screen resolution, operating system version, etc.)\n• Optional Information: You may choose to provide additional information, such as:\n• Usernames for our social section\n• Email address (should you wish to give or get in touch with us)\n• Information included in user-generated content (posts, comments, etc.)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Use of Information',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Text(
                                    'We use the information we collect for the following purposes:\n\n• To operate and improve the Website: We use NPII to understand how users navigate our\nWebsite, improve its performance and user experience, and personalize ad\n• To personalize your experience: We may use NPII to personalize your experience on the\nWebsite, such as remembering your preferences for themes or content categories.\n• To contact you: We may use your contact information to respond to your inquiries, provide\ninformation about Trobits, or send occasional newsletters (with an unsubscribe option).\n• To facilitate social features: We may use your username and any information you choose to\nshare publicly in our social section to enable user interaction.\n\n• To support donations: If you choose to donate, we will use your email address to send you a\nconfirmation receipt.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Disclosure of Information',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  'Except for the following specific situations, we will never disclose your personal information to outside\nparties without your permission:\n• Service Providers: Your information could be disclosed to outside service providers who assist us\nin running the website, such as those who offer payment processing, analytics, or content\ndelivery services. These service providers have a legal duty to protect and maintain the\nconfidentiality of your information.\n• Legal Requirements: We may disclose your information if required by law or to comply with a\nlegal process, such as a court order or subpoena.\n• Aggregated Data: For marketing or research reasons, we could provide third parties access to\naggregated and anonymized data. Nothing in this data will allow someone to directly identify\nyou.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Your Choices',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  'You have the option to restrict the data you provide to us by:\n• Not providing any optional information\n• Managing your browser settings to refuse cookies or clear them from your browser after visiting\nthe Website\n• Contacting us to request deletion of your account information (note that some information may\nneed to be retained for legal or security purposes)',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Security',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  'We take appropriate precautions to safeguard the data we get from users. Access restrictions,\nencryption, and the use of secure servers are all part of this. But no website can be guaranteed to be\n100% safe. You should take precautions to safeguard your data, such as updating your software and\nusing a secure password.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Children\'s Privacy',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  'Children under the age of 13 are not intended to use our website. We do not intentionally gather\npersonal data from minors younger than 13. Please get in touch with us if you are a parent or guardian\nand you think your kid may have given us sensitive information.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Changes to this Privacy Statement',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  'We may change our Privacy Statement from time to time. We will post any updates to this page and\ninvite you to check it regularly.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Contact Us',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 35.0),
                                child: Text(
                                  'If you have any questions about this Privacy Statement, please contact',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
