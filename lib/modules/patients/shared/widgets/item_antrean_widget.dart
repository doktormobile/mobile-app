import 'package:doctor_mobile/core/constants/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemAntreanWidget extends StatelessWidget {
  const ItemAntreanWidget({
    super.key,
    this.queueNumber,
    this.doctorName,
    this.qualification,
    this.activeReservationNumber,
    this.remainingQueue,
  });

  final int? queueNumber;
  final String? doctorName;
  final String? qualification;
  final int? activeReservationNumber;
  final int? remainingQueue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.8.sw,
      padding: EdgeInsets.all(16.w),
      decoration: ShapeDecoration(
        color: const Color(0xFFF6F6F6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60.w,
                height: 60.w,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorConst.primary900,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'No.\n${queueNumber ?? '-'}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'dr. ${doctorName ?? '-'}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      qualification ?? '-',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sedang dilayani',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      (activeReservationNumber ?? 0).toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sisa Antrian',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      (remainingQueue ?? 0).toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
