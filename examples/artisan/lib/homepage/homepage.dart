import 'package:artisan/common/size_config.dart';
import 'package:artisan/core/enums/user_type.dart';
import 'package:artisan/core/useservice.dart';
import 'package:artisan/homepage/widgets/head_section.dart';
import 'package:artisan/homepage/widgets/projects.dart';
import 'package:artisan/homepage/widgets/statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import 'package:artisan/auth/store/user_store.dart';

import 'craftman_page.dart';
import 'customer_page.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserStore userStore = useService<UserStore>();
    return SafeArea(
      child:
          // userStore.user.userType == UserTypeEnum.contractor.value
          //     ? const CraftmanPage()
          //     :
          const CustomerPage(),
    );
  }
}
