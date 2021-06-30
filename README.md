# firebase_chat_app


This Android app was developed using VSCode on Flutter version 2.2.2 using Dart 2.13.3
The app supports chatting between two users.

Chats between another user can be seen by pressing the blue 'message' button found next to their username. 


Since we are using google_sign_in legacy library: 

    import 'package:google_sign_in/google_sign_in.dart';

If a null safety error is thrown when debugging, run app with the command: 
    
    flutter run --no-sound-null-safety

If the above command does not work, go to extension settings -> Workspace -> Dark & Flutter.
Look for Dart: Flutter Run Additional Args and click Add Item to insert "--no-sound-null-safety". Do the same for Dart: Vm Additional Args. 

If it still does not work, go to 'settings.json' file and add the following configuration:

    "dart.flutterRunAdditionalArgs": [
        "--no-sound-null-safety"
    ],
    "dart.vmAdditionalArgs": [
        "--no-sound-null-safety"
    ]




FOR TESTING FUNCTIONALITY:
-------------------------------------------------------------------------------------------------------------------

For username 'semkeem'
    email: bleh@gmail.com
    password: 123456

For username 'troyboi'
    email: troyboi@gmail.com
    password: 123456



DEPENDENCIES & PLUG-INS:
-------------------------------------------------------------------------------------------------------------------
In case the dependencies and plug ins do not carry over to github:

Inside pubspec.yaml:

    # flutter sdk version 
    sdk: ">=2.12.0 <3.0.0"
    # These are the versions used for firebase and google_sign_in
    firebase_core: ^1.3.0
    firebase_auth: ^1.4.1
    cloud_firestore: ^2.2.2
    google_sign_in: "^4.5.1"
    bubble: ^1.2.1
    # the flutter_sign_in_button is used for the google log in button 
    # the bubble plug in was used to create the chat bubbles

# For Google and Firebase:
Inside 'build.gradle' file under the 'android/app' folder, add these implementations in the 'dependencies {}' section:

    implementation platform('com.google.firebase:firebase-bom:28.1.0')
    implementation 'com.google.firebase:firebase-analytics-ktx'
    implementation 'com.android.support:multidex:1.0.3'
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"

    // Declare the dependency for the Firebase Authentication library
    // When using the BoM, you don't specify versions in Firebase library dependencies
    implementation 'com.google.firebase:firebase-auth'

    // Also declare the dependency for the Google Play services library and specify its version
    implementation 'com.google.android.gms:play-services-auth:19.0.0'

Do the same for the other 'build.gradle' file that is inside the 'android' folder, add these implementations in the 'dependencies {}' section:

    classpath 'com.android.tools.build:gradle:4.1.0'
    classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    classpath 'com.google.gms:google-services:4.3.8'


