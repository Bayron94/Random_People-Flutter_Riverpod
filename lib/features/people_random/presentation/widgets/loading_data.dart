import 'package:flutter/material.dart';
import 'package:random_people_2024/core/theme/theme.dart';
import 'package:random_people_2024/features/people_random/presentation/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class LoadingData extends StatelessWidget {
  final int length;
  const LoadingData({super.key, this.length = 10});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Column(
            children: List.generate(
              length,
              (index) => Padding(
                padding: const EdgeInsets.only(
                  left: 60,
                  bottom: 10,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: customHintColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(1, 3),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const SizedBox(
                    height: 90,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: theme.primaryColor,
            highlightColor: Colors.white,
            child: Column(
              children: List.generate(
                length,
                (index) => const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      ShimmerContainer(width: 50, height: 50),
                      SizedBox(width: 15),
                      Expanded(
                        child: SizedBox(
                          height: 90,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ShimmerContainer(width: 200, height: 15),
                              SizedBox(height: 5),
                              ShimmerContainer(width: 150, height: 15),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  ShimmerContainer(width: 20, height: 15),
                                  Spacer(),
                                  ShimmerContainer(width: 20, height: 15),
                                  SizedBox(width: 40),
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
