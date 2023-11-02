import 'package:flutter/material.dart';

//* For  app logic:
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//*For App theme
const String kFontFamily = "Tajawal";

//* Constants for Features, ex: Repository, etc...
//*Auth:
const String kUserData = "UserData";
//Validators:
const emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';

//* Constants for Core, ex: ApiService, etc...
const String kLocale = "locale";

//* Constants for External, ex: Dio, etc...

//*API Services:
const String kBaseUrl = "https://flutterapi.kortobaa.net";
