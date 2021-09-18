import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ingat_tugas/app/modules/home/views/home_view.dart';
import 'package:ingat_tugas/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.red[900],
            ),
            SizedBox.expand(
              child: DraggableScrollableSheet(
                initialChildSize: 0.68,
                builder: (context, snapshot) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: ListView(
                      children: [
                        Text(
                          'Login Cuy',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          autocorrect: false,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(15.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(15.0)),
                              hintText: 'Email',
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 14.0, color: Colors.grey),
                              filled: true,
                              fillColor: Colors.grey[200]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          obscureText: true,
                          autocorrect: false,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(15.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(15.0)),
                              hintText: 'Password',
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 14.0, color: Colors.grey),
                              filled: true,
                              fillColor: Colors.grey[200]),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                          onPressed: () => Get.offAll(HomeView(),
                              transition: Transition.fadeIn),
                          child: Center(
                            child: Text(
                              'Gass!',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red[500],
                            padding: EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Belum punya akun?',
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Register',
                                style: GoogleFonts.poppins(
                                  color: Colors.red[500],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}