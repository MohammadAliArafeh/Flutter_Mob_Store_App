import 'package:mob_store_app/modules/login/login_screen.dart';
import 'package:mob_store_app/shared/components/components.dart';
import 'package:mob_store_app/shared/network/local/cache_helper.dart';

String token = '';

void signOut(context)
{
  CacheHelper.removeData(
    key: 'token',
  ).then((value)
  {
    if (value)
    {
      pushAndFinish(
        context,
        LoginScreen(),
      );
    }
  });
}

