import 'package:f22_task/app/helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  const CustomErrorWidget({Key? key, required this.errorDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'OOPS!',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
            hSpace(12.0),
            Text(
              'Something went wrong',
              style: GoogleFonts.poppins(
                  fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
          ],
        )),
      ),
    );
  }
}
