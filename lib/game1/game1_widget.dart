import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Game1Widget extends StatefulWidget {
  const Game1Widget({Key? key}) : super(key: key);

  @override
  _Game1WidgetState createState() => _Game1WidgetState();
}

class _Game1WidgetState extends State<Game1Widget> {
  StopWatchTimer? timerController;
  String? timerValue;
  int? timerMilliseconds;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().pontosPartida = 0);
      setState(() => FFAppState().certo = 0);
      setState(() => FFAppState().num1 = random_data.randomInteger(0, 9));
      setState(() => FFAppState().num2 = random_data.randomInteger(2, 9));
      setState(() => FFAppState().result =
          functions.multiplicar(FFAppState().num1, FFAppState().num2));
      timerController?.onExecute.add(
        StopWatchExecute.start,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    timerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 0,
          borderWidth: 0,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'zblp1fzo' /* Tabuada Game */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 75,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 6),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Text(
                              'Pontos = ${FFAppState().pontosPartida.toString()}',
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Mogra',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                            ),
                          ),
                          Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FlutterFlowTimer(
                                      timerValue: timerValue ??=
                                          StopWatchTimer.getDisplayTime(
                                        timerMilliseconds ??= 30000,
                                        hours: false,
                                        minute: false,
                                        second: true,
                                        milliSecond: false,
                                      ),
                                      timer: timerController ??= StopWatchTimer(
                                        mode: StopWatchMode.countDown,
                                        presetMillisecond: timerMilliseconds ??=
                                            30000,
                                        onChange: (value) {
                                          setState(() {
                                            timerMilliseconds = value;
                                            timerValue =
                                                StopWatchTimer.getDisplayTime(
                                              value,
                                              hours: false,
                                              minute: false,
                                              second: true,
                                              milliSecond: false,
                                            );
                                          });
                                        },
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Mogra',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                      onEnded: () async {
                                        if (FFAppState().pontosPartida < 0) {
                                          setState(() =>
                                              FFAppState().pontosPartida = 0);
                                        } else {
                                          setState(() => FFAppState()
                                                  .pontosTotais =
                                              FFAppState().pontosTotais +
                                                  FFAppState().pontosPartida);
                                        }

                                        setState(() =>
                                            FFAppState().pontosLevel =
                                                FFAppState().pontosLevel +
                                                    FFAppState().pontosPartida);
                                        if (FFAppState().pontosPartida >
                                            FFAppState().record1) {
                                          setState(() => FFAppState().record1 =
                                              FFAppState().pontosPartida);
                                        }
                                        setState(() => FFAppState().record1 =
                                            FFAppState().record1 +
                                                FFAppState().pontosPartida);
                                        if (functions.updateLevel(
                                            FFAppState().level,
                                            FFAppState().pontosLevel)!) {
                                          setState(() => FFAppState().level =
                                              FFAppState().level + 1);
                                          setState(() =>
                                              FFAppState().pontosLevel = 0);

                                          context.pushNamed('levelUp');
                                        } else {
                                          context.pop();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.1, 0.1),
                      child: Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SelectionArea(
                                    child: Text(
                                  FFAppState().num1.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Mogra',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 35,
                                        fontWeight: FontWeight.normal,
                                      ),
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SelectionArea(
                            child: Text(
                          FFLocalizations.of(context).getText(
                            '1c5pe36o' /* x */,
                          ),
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Mogra',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        )),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.1, 0.1),
                      child: Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SelectionArea(
                                    child: Text(
                                  FFAppState().num2.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Mogra',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 35,
                                      ),
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SelectionArea(
                            child: Text(
                          FFLocalizations.of(context).getText(
                            '607y0cgr' /* = */,
                          ),
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Mogra',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        )),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.1, 0.1),
                      child: Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: () {
                            if (FFAppState().certo == 0) {
                              return FlutterFlowTheme.of(context)
                                  .secondaryBackground;
                            } else if (FFAppState().certo == 1) {
                              return Color(0xFF00FF00);
                            } else {
                              return Color(0xFFFF0000);
                            }
                          }(),
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (FFAppState().certo == 0)
                                  SelectionArea(
                                      child: Text(
                                    FFAppState().resultadoDigitado,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Mogra',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 35,
                                        ),
                                  )),
                                if (FFAppState().certo == 1)
                                  FaIcon(
                                    FontAwesomeIcons.solidThumbsUp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 35,
                                  ),
                                if (FFAppState().certo == 2)
                                  FaIcon(
                                    FontAwesomeIcons.solidThumbsDown,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 35,
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().resultadoDigitado =
                                    '${FFAppState().resultadoDigitado}1');
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'e741aig9' /* 1 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Mogra',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 40,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().resultadoDigitado =
                                    '${FFAppState().resultadoDigitado}2');
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'kzqumhv7' /* 2 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Mogra',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 40,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().resultadoDigitado =
                                    '${FFAppState().resultadoDigitado}3');
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'rs1rlqqb' /* 3 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Mogra',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 40,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().resultadoDigitado =
                                    '${FFAppState().resultadoDigitado}4');
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '7de8x4aw' /* 4 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Mogra',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 40,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().resultadoDigitado =
                                    '${FFAppState().resultadoDigitado}5');
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'jm4ne9h3' /* 5 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Mogra',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 40,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().resultadoDigitado =
                                    '${FFAppState().resultadoDigitado}6');
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'w8oq1o5g' /* 6 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Mogra',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 40,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().resultadoDigitado =
                                    '${FFAppState().resultadoDigitado}7');
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'qr9v4byq' /* 7 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Mogra',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 40,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().resultadoDigitado =
                                    '${FFAppState().resultadoDigitado}8');
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'vdjp7mhd' /* 8 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Mogra',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 40,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().resultadoDigitado =
                                    '${FFAppState().resultadoDigitado}9');
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ojv7hy8u' /* 9 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Mogra',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 40,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().resultadoDigitado =
                                    functions
                                        .del(FFAppState().resultadoDigitado));
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'h4nttudl' /* < */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Mogra',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 40,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().resultadoDigitado =
                                    '${FFAppState().resultadoDigitado}0');
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'rreyojos' /* 0 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Mogra',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 40,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                if (FFAppState().result ==
                                    functions.toInteger(
                                        FFAppState().resultadoDigitado)) {
                                  setState(() => FFAppState().pontosPartida =
                                      FFAppState().pontosPartida + 1);
                                  setState(() => FFAppState().certo = 1);
                                } else {
                                  setState(() => FFAppState().pontosPartida =
                                      FFAppState().pontosPartida + -1);
                                  setState(() => FFAppState().certo = 2);
                                }

                                setState(() => FFAppState().num1 =
                                    random_data.randomInteger(0, 9));
                                setState(() => FFAppState().num2 =
                                    random_data.randomInteger(2, 9));
                                setState(() => FFAppState().result =
                                    functions.multiplicar(
                                        FFAppState().num1, FFAppState().num2));
                                setState(
                                    () => FFAppState().resultadoDigitado = '');
                                await Future.delayed(
                                    const Duration(milliseconds: 500));
                                setState(() => FFAppState().certo = 0);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ggqs0mk0' /* = */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Mogra',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 40,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
