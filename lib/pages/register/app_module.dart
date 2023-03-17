import 'package:flutter_modular/flutter_modular.dart';
import 'package:rest_api_adix_leilao/pages/details/view/vid_page.dart';
import 'package:rest_api_adix_leilao/pages/home/views/home_page.dart';
import 'package:rest_api_adix_leilao/pages/register/splash_page.dart';
import 'package:rest_api_adix_leilao/pages/register/view/register_page.dart';


import '../auth/views/auth_page.dart';
import '../details/view/details_page.dart';


class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ChildRoute('/home', child: (context, args) => const HomePage()),
        ChildRoute('/auth', child: (context, args) => const AuthPage()),
        ChildRoute('/register', child: (context, args) => const RegisterPage()),
        ChildRoute('/details', child: (context, args) => const Details_Page()),
        ChildRoute('/vid', child: (context, args) => const VidPage()),

      ];
}
