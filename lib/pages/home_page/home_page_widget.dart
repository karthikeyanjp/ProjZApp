import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_smartcar_auth/flutter_smartcar_auth.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    Smartcar.onSmartcarResponse.listen((event) {
      debugPrint("smartcarevent: " + event.code!);
      // setState(() {
      //   FFAppState().authcode = event.code!;
      // });
      FFAppState().update(() {
        FFAppState().authcode = event.code!;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Text(
            'CarzConnect',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: FFButtonWidget(
                    onPressed: () async {
                      // await launchURL(
                      //     'https://connect.smartcar.com/oauth/authorize?response_type=code&client_id=db43eacf-4a95-44fc-a955-87c6e45afd8e&scope=read_vin%20read_vehicle_info%20read_location%20read_engine_oil%20read_battery%20read_charge%20read_fuel%20control_security%20read_odometer%20read_tires%20read_charge&redirect_uri=scdb43eacf-4a95-44fc-a955-87c6e45afd8e://exchange&state=12345&mode=live');

                      await Smartcar.setup(
                        configuration: const SmartcarConfig(
                          clientId: "db43eacf-4a95-44fc-a955-87c6e45afd8e",
                          redirectUri:
                              "scdb43eacf-4a95-44fc-a955-87c6e45afd8e://exchange",
                          scopes: [
                            SmartcarPermission.readOdometer,
                            SmartcarPermission.readBattery,
                            SmartcarPermission.readCharge,
                            SmartcarPermission.readClimate,
                            SmartcarPermission.readClimate,
                            SmartcarPermission.readEngineOil,
                            SmartcarPermission.readExtendedVehicleInfo,
                            SmartcarPermission.readFuel,
                            SmartcarPermission.readLocation,
                            SmartcarPermission.readSpeedometer,
                            SmartcarPermission.readThermometer,
                            SmartcarPermission.readTires,
                          ],
                          testMode: false,
                        ),
                      );
                      await Smartcar.launchAuthFlow();
                      context.goNamed('vehicles');
                    },
                    text: 'Connect',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Colors.black,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
