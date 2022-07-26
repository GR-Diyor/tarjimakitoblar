import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

Widget Main_loading(){
  return  SafeArea(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Padding(
                    padding:
                    const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: const [
                        CardLoading(
                          height: 20,
                          borderRadius: 15,
                          width: 100,
                          margin: EdgeInsets.only(bottom: 14),
                        ),
                        CardLoading(
                          height: 60,
                          borderRadius: 15,
                          margin: EdgeInsets.only(bottom: 14),
                        ),
                        CardLoading(
                          height: 20,
                          width: 200,
                          borderRadius: 15,
                          margin: EdgeInsets.only(bottom: 14),
                        ),
                      ],
                    ),
                  );
                },
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}