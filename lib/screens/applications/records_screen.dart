// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:time_guard/screens/base_screen.dart';
import 'package:time_guard/screens/dialog/record_data_dialog.dart';
import 'package:time_guard/services/isar.dart';
import 'package:time_guard/services/provider/record_provider.dart';
import 'package:time_guard/models/records_model.dart';
import 'package:time_guard/shared/constants.dart';
import 'package:time_guard/shared/utils/animations.dart';
import 'package:time_guard/shared/utils/logger.dart';
// import 'package:time_guard/shared/utils/logger.dart';
import 'package:time_guard/shared/widgets/custom_appbar.dart';
import 'package:time_guard/shared/widgets/dialog.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({super.key});

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  final isarDb = IsarDB();

  List allRecords = [];
  List sevenDayRecord =[];
  int totalTime = 0;
  double averageTime = 0.0;
  String averageTimeRefined = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      allRecords = await isarDb.getRecords(context);
      sevenDayRecord = allRecords.length < 7 ? allRecords : allRecords.sublist(0, 7);

      // Seven day record
      for (Record record in sevenDayRecord) {
        setState(() {
          totalTime += record.overallScreenTime;
        });
      }

      setState(() {
        try {
          averageTime = totalTime /sevenDayRecord.length;
          int averageHours = (averageTime.round() / 60) ~/ 60;
          int averageMins = ((averageTime.round() / 60) % 60).round();

          averageTimeRefined = '${averageHours}h ${averageMins}m';
        } catch (e) {
          logger(e);
          averageTime = totalTime /sevenDayRecord.length;
          int averageHours = 0;
          int averageMins = 0;

          averageTimeRefined = 'No data available';
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final records = context.read<RecordProvider>().records;
    final chartRecords = records.length < 7 ? records : records.sublist(0, 7);

    return BaseScreen(
      screen: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbar(
            title: 'Records',
            backgroundColor: Colors.transparent,
            titleColor: kTextColor(context).withOpacity(0.5),
            elevation: 0.0,
          ),

          records.isEmpty ? Center(
            child: Text(
              'No records available',
              style: kSecondaryNormalTextStyle(context),
              textAlign: TextAlign.center,
            ),
          ) : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                child: Text(
                  'App usage data for the last 7 days',
                  style: kSecondaryNormalTextStyle(context),
                  textAlign: TextAlign.left,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: 10.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Average Time: ', style: kNormalTextStyle(context),),
                    Text(averageTimeRefined, style: kSecondaryNormalTextStyle(context),)
                  ],
                ),
              ),

              SizedBox(height: 10.h),

              SizedBox(
                height: 250.h,
                child: ListView.builder(
                  itemCount: chartRecords.length,
                  itemBuilder: (context, index) {
                    final reversedIndex = chartRecords.length -1 -index;
                    final record = chartRecords[reversedIndex];
                    final percentValue = (record.overallScreenTime / totalTime) * 100;

                    // logger('Total time: $totalTime');
                    // logger('Average time: $averageTime');
                    // logger(percentValue/100);

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 2.r),
                      child: Row(
                        children: [
                          Expanded(
                            child: LinearPercentIndicator(
                              backgroundColor: Colors.transparent,
                              lineHeight: 10.h,
                              animation: true,
                              percent: percentValue.isFinite ? percentValue / 100 : 1,
                              linearGradient: LinearGradient(
                                colors: [kFourthColor, kPrimaryColor],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter
                              ),
                              barRadius: Radius.circular(10.r),
                              trailing: Padding(
                                padding: EdgeInsets.only(left: 10.sp),
                                child: Column(
                                children: [
                                  Text(
                                    record.date, 
                                    style: kNormalTextStyle(context).copyWith(fontSize: 13.sp),
                                  ),
                          
                                  Text(
                                    record.overallScreenTimeRefined, 
                                    style: kSecondaryNormalTextStyle(context).copyWith(fontSize: 13.sp),
                                  ),
                                ],
                              )
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              CustomAppbar(
                title: 'Daily Records',
                backgroundColor: Colors.transparent,
                titleColor: kTextColor(context).withOpacity(0.5),
                elevation: 0.0,
              ),

              SizedBox(
                height: 250.h,
                child: RefreshIndicator.adaptive(
                  onRefresh: () async {
                    await isarDb.getRecords(context);
                    setState(() {});
                  },
                  color: kPrimaryColor,
                  backgroundColor: kFourthColor,
                  triggerMode: RefreshIndicatorTriggerMode.anywhere,
                  child: ListView.builder(
                    itemCount: records.length,
                    itemBuilder: (context, index) {
                      final reversedIndex = records.length -1 - index;
                      final record = records[reversedIndex];
                            
                      return InkWell(
                        onTap: () {
                          showDialogBox(context: context, screen: RecordDataDialog(record: record));
                        },
                        // child: Dismissible(
                        //   key: Key(record.id.toString()),
                        //   onDismissed: (direction) async{
                        //     await isarDb.deleteRecord(context, record.id);
                        //     showSnackbar(context, 'Record deleted');
                        //     setState(() {});
                        //   },
                        //   background: Container(
                        //     color: kRedColor,
                        //     width: double.infinity,
                        //     height: 100.h,
                        //     child: Padding(
                        //       padding: EdgeInsets.only(right: 10.r, top: 20.r),
                        //       child: Text(
                        //         'Swipe to delete',
                        //         style: kNormalTextStyle(context).copyWith(
                        //           color: kFourthColor,
                        //         ),
                        //         textAlign: TextAlign.right,
                        //       ),
                        //     ),
                        //   ),
                        child: ListTile(
                          leading: Text(
                            record.date,
                            style: kSecondaryNormalTextStyle(context).copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Most used app: ',
                                style: kNormalTextStyle(context).copyWith(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                                      
                              Text(
                                record.mostUsedApp.length > 7 ? '${record.mostUsedApp.substring(0, 7)}...' : record.mostUsedApp,
                                style: kSecondaryNormalTextStyle(context).copyWith(
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Most time on app: ',
                                    style: kNormalTextStyle(context).copyWith(
                                      fontSize: 12.sp
                                    ),
                                  ),
                              
                                  Text(
                                    record.timeForMostUsedApp,
                                    style: kSecondaryNormalTextStyle(context).copyWith(
                                      fontSize: 12.sp
                                    ),
                                  ),
                                ],
                              ),
                                      
                              Row(
                                children: [
                                  Text(
                                    'Total apps used: ',
                                    style: kNormalTextStyle(context).copyWith(
                                      fontSize: 12.sp
                                    ),
                                  ),
                              
                                  Text(
                                    record.noOfAppsUsed.toString(),
                                    style: kSecondaryNormalTextStyle(context).copyWith(
                                      fontSize: 12.sp
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                record.overallScreenTimeRefined,
                                style: kSecondaryNormalTextStyle(context).copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ).animate(
                            effects: MyEffects.fadeSlide()
                        ),
                        
                      );
                    },
                  ),
                ),
              ),
            ],
          )
       ],
      ),
    );
  }
}