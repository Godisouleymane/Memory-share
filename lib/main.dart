import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memory_share/firebase_options.dart';
import 'package:memory_share/model/picModel.dart';
import 'package:memory_share/services/authentification.dart';
import 'package:memory_share/services/dbService.dart';
import 'package:memory_share/views/detail/pictureDetail.dart';
import 'package:memory_share/login/login.dart';
import 'package:memory_share/views/profile/profile.dart';
import 'package:memory_share/wrapper.dart';
import 'package:provider/provider.dart';
 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(
    MultiProvider(providers: [
      StreamProvider.value(value: AuthService().user, initialData: null),
      StreamProvider<List<Picture>>.value(value: DataBaseService().pics, initialData: [])
    ],
    child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mem-share',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        useMaterial3: false,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        appBarTheme: AppBarTheme(color: Colors.white)
      ),
    initialRoute: '/',
    routes: {
      '/':(context) => Wrapper(),
      '/profile':(context) => Profile(),
      '/detail':(context) => PictureDetail(),
    },
    );
  }
}
