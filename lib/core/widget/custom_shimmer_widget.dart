import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget {
  static Widget buildShimmerWidget(
      {double width = 100,
      double height = 100,
      double radius = 0,
      Color? baseColor,
      Color? highlightColor}) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey[300]!,
      highlightColor: highlightColor ?? Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  Widget list({required int length}) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildShimmerWidget(
                width: 80,
                height: 80,
                radius: 16,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildShimmerWidget(
                      width: double.infinity,
                      height: 16,
                      radius: 8,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    buildShimmerWidget(
                      width: double.infinity,
                      height: 16,
                      radius: 8,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    buildShimmerWidget(
                      width: 100,
                      height: 16,
                      radius: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: length,
    );
  }
}
