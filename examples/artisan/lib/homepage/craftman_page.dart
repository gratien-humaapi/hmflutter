import 'package:artisan/common/size_config.dart';
import 'package:artisan/core/useservice.dart';
import 'package:artisan/homepage/widgets/head_section.dart';
import 'package:artisan/homepage/widgets/projects.dart';
import 'package:artisan/homepage/widgets/statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hmreactive_widget/hmreactive_widget.dart';

import 'package:artisan/auth/store/user_store.dart';

class CraftmanPage extends HookWidget {
  const CraftmanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final ScrollController controller =
        InheritedDataProvider.of(context).scrollController;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: CustomScrollView(
          clipBehavior: Clip.antiAlias,
          controller: controller,
          slivers: const [
            CraftmanHeaderSection(),
            SliverToBoxAdapter(child: StatisticsContainer()),
            SliverToBoxAdapter(child: ProjectSession()),
          ],
        ),
      ),
    );
  }

  void go(BuildContext context) {}
}
