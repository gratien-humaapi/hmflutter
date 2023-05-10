// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'login_page.dart';
// import 'register_page.dart';

// class RouterService {
//   static final router = GoRouter(
//     routes: [
//       GoRoute(
//         path: '/',
//         pageBuilder: (context, state) => LoginPage(),
//       ),
//       GoRoute(
//         path: '/register',
//         pageBuilder: (context, state) => RegisterPage(),
//       ),
//     ],
//   );
// }


// //
// import 'package:flutter/material.dart';
// import 'router_service.dart';

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Page de connexion')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Bienvenue sur la page de connexion !'),
//             ElevatedButton(
//               child: Text('Inscription'),
//               onPressed: () => RouterService.router.push(context, '/register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RegisterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Page d\'inscription')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Bienvenue sur la page d\'inscription !'),
//             ElevatedButton(
//               child: Text('Connexion'),
//               onPressed: () => RouterService.router.pop(context),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// //
// import 'package:flutter/material.dart';
// import 'router_service.dart';
// import 'login_page.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Mon application',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       navigatorKey: RouterService.router.navigatorKey,
//       onGenerateRoute: RouterService.router.generator,
//       home: LoginPage(),
//     );
//   }
// }
