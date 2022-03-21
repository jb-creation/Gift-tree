import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pessa_flow/common/validator.dart';
import 'package:pessa_flow/generated/l10n.dart';
import 'package:pessa_flow/model/model.dart';
import 'package:pessa_flow/network/base_api_service.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/res/images.dart';
import 'package:pessa_flow/ui/main/main_view.dart';
import 'package:pessa_flow/utils/app_logger.dart';
import 'package:pessa_flow/utils/base_cubit.dart';
import 'package:pessa_flow/widgets/common_app_bar.dart';
import 'package:pessa_flow/widgets/widgets.dart';

part 'faqs_cubit.dart';

part 'faqs_state.dart';
part 'faqs_service.dart';

class FaqsView extends StatefulWidget {
  const FaqsView({Key? key}) : super(key: key);

  @override
  _FaqsViewState createState() => _FaqsViewState();
}

class _FaqsViewState extends State<FaqsView> {
  @override
  Widget build(BuildContext context) {
    var initialState = BlocProvider.of<FaqsCubit>(context).state;
    return Scaffold(
      appBar: CommonAppBarBlack(
        title: S.of(context).faqs,
        onBackTap: () => Navigator.of(context).pop(),
      ),
      body: BlocBuilder<FaqsCubit, FaqsState>(
        buildWhen: (previous, current) => previous.listFaqs != current.listFaqs,
        builder: (context, state) {
          return ListView.separated(
            itemCount: state.listFaqs.length,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            controller: ScrollController(),
            separatorBuilder: (context, index) => const Divider(
              indent: 16,
              endIndent: 16,
            ),
            itemBuilder: (context, index) => Column(children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                          alignment: AlignmentDirectional.centerStart,
                          child: CommonText.semiBold(
                            state.listFaqs[index].Question,
                            size: 16,
                            color: AppColor.primary,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
                          alignment: AlignmentDirectional.centerStart,
                          child: CommonText.medium(
                            state.listFaqs[index].Answer,
                            size: 14,
                            color: AppColor.primaryDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: SquareSvgImageFromAsset(
                      AppImage.arrowNext,
                      size: 20,
                    ),
                  ),

                ],
              ),
              const SizeBoxH(16),
            ]),

          );
        },
      ),
    );
  }
}
