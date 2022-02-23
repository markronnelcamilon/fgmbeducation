import '../achievement_upload_image/achievement_upload_image_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../vision_board/vision_board_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AchivementBoardWidget extends StatefulWidget {
  const AchivementBoardWidget({Key key}) : super(key: key);

  @override
  _AchivementBoardWidgetState createState() => _AchivementBoardWidgetState();
}

class _AchivementBoardWidgetState extends State<AchivementBoardWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VisionBoardWidget(),
              ),
            );
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
        title: Text(
          'Achievement Board',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Lexend Deca',
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AchievementUploadImageWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        label: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.file_upload,
              color: FlutterFlowTheme.of(context).tertiaryColor,
              size: 24,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
              child: Text(
                'Upload',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).tertiaryColor,
                    ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                'assets/images/fgmblogo.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: StreamBuilder<List<VisionBoardAchievementRecord>>(
                  stream: queryVisionBoardAchievementRecord(
                    queryBuilder: (visionBoardAchievementRecord) =>
                        visionBoardAchievementRecord
                            .where('uid', isEqualTo: currentUserUid)
                            .orderBy('date'),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: SpinKitDoubleBounce(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 50,
                          ),
                        ),
                      );
                    }
                    List<VisionBoardAchievementRecord>
                        gridViewVisionBoardAchievementRecordList =
                        snapshot.data;
                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount:
                          gridViewVisionBoardAchievementRecordList.length,
                      itemBuilder: (context, gridViewIndex) {
                        final gridViewVisionBoardAchievementRecord =
                            gridViewVisionBoardAchievementRecordList[
                                gridViewIndex];
                        return Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFF5F5F5),
                          child: Image.network(
                            gridViewVisionBoardAchievementRecord.image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
