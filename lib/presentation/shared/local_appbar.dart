import 'package:flutter/material.dart';

AppBar defaultAppBar({
  required bool hasBackButton,
  required BuildContext context,
}) =>
    AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.repeated,
            colors: [
              Colors.black,
              Colors.black.withOpacity(0.0),
            ],
          ),
        ),
      ),
    );

PreferredSize appBarWithTwoPaginationProgress({
  required BuildContext context,
  required Widget twoPaginationProgress,
}) =>
    PreferredSize(
      preferredSize: const Size(double.maxFinite, 80),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
            child: Container(
              color: Colors.black,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                constraints: const BoxConstraints.expand(height: 80),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.black.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  )
                ],
              ),
              twoPaginationProgress,
            ],
          ),
        ],
      ),
    );
