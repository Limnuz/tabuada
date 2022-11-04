import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelUpWidget extends StatefulWidget {
  const LevelUpWidget({Key? key}) : super(key: key);

  @override
  _LevelUpWidgetState createState() => _LevelUpWidgetState();
}

class _LevelUpWidgetState extends State<LevelUpWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            'wdan0hy1' /* Level Up */,
          ),
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Mogra',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.trending_up,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 200,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                  child: SelectionArea(
                      child: Text(
                    FFLocalizations.of(context).getText(
                      'ip2q2klr' /* Parabéns, você subiu de Nível */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Mogra',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 35,
                        ),
                  )),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('home');
                  },
                  text: FFLocalizations.of(context).getText(
                    'tpo6arud' /* Ótimo! */,
                  ),
                  options: FFButtonOptions(
                    width: 300,
                    height: 60,
                    color: FlutterFlowTheme.of(context).alternate,
                    textStyle: FlutterFlowTheme.of(context).title1,
                    elevation: 8,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
