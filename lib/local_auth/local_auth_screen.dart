import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthScreen extends StatefulWidget {
  const LocalAuthScreen({super.key});

  @override
  State<LocalAuthScreen> createState() => _LocalAuthScreenState();
}

class _LocalAuthScreenState extends State<LocalAuthScreen> {
  bool didAuthenticate = false;

  checkDeviceCapabilities() async {
    final LocalAuthentication auth = LocalAuthentication();

    final bool canAuthWithBiometrics = await auth.canCheckBiometrics;
    print(canAuthWithBiometrics);

    final bool canAuthenticate =
        canAuthWithBiometrics || await auth.isDeviceSupported();
    print(canAuthenticate);

    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    print(availableBiometrics.isEmpty);
    print(availableBiometrics);

    try {
      didAuthenticate = await auth.authenticate(
          localizedReason: 'Please authenticate to show account balance');
      print('did user auth $didAuthenticate');
      // ···
    } on PlatformException {
      // ...
      print('platform exception');
    }
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Authenticated: $didAuthenticate',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black)),
            SizedBox(height: 50,),
            CupertinoButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    width: 80,
                    height: 80,
                    'https://img.freepik.com/premium-vector/face-id-icon-black-color_573652-2024.jpg?w=360',
                  ),
                  Text('Face ID',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black),)
                ],
              ),
              onPressed: checkDeviceCapabilities,
            )
          ],
        ),
      ),
    );
  }
}
