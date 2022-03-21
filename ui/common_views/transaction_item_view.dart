import 'package:intl/intl.dart';
import 'package:pessa_flow/extensions/extension.dart';
import 'package:pessa_flow/generated/l10n.dart';
import 'package:pessa_flow/model/model.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/res/images.dart';
import 'package:pessa_flow/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TransactionItemView extends StatelessWidget {
  final Transaction_ _transaction;

  final NumberFormat format = NumberFormat("###,###,###.##");

  TransactionItemView(this._transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Builder(
            builder: (context) {
              return const Icon(
                Icons.account_circle_outlined,
                color: AppColor.primary,
                size: 48,
              );
            },
          ),
          const SizeBoxV(12),
          Expanded(
            child: Builder(
              builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: CommonText.semiBold(
                          "To " +
                              _transaction.FirstName +
                              " " +
                              _transaction.LastName,
                          size: 16,
                          color: AppColor.primary,
                        )),
                        CommonText.bold(
                            "\$" +
                                format.format(double.parse(
                                    (_transaction.Amount.toString()))),
                            size: 16,
                            color: AppColor.primary),
                      ],
                    ),
                    const SizeBoxH(),
                    Row(
                      children: [
                        Expanded(
                          child: CommonText.regular(
                            "Transfer on " +
                                DateTime.parse(
                                        _transaction.DateEntered.replaceAll(
                                                " AM", "")
                                            .replaceAll(" PM", ""))
                                    .toLocalString("dd MMM y, HH:mm a"),
                            size: 11,
                            color: AppColor.textPrimaryLight,
                          ),
                        ),
                        CommonText.regular(
                            format.format(double.parse(
                                    (_transaction.Received ?? "0")
                                        .toString())) +
                                " " +
                                _transaction.Currency,
                            size: 14,
                            color: AppColor.primary),
                      ],
                    ),
                    const SizeBoxH(),
                    Row(
                      children: [
                        const CommonText.regular(
                          "Status: ",
                          size: 11,
                          color: AppColor.textPrimaryLight,
                        ),
                        CommonText.semiBold(getStatusText(_transaction.Status),
                            size: 14,
                            color: getStatusColor(_transaction.Status)),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  getStatusColor(String status) {
    switch (status) {
      case "1":
        return AppColor.primary;
      case "2":
        return const Color(0xFFFF8008);
      case "3":
        return AppColor.green;
      case "4":
        return AppColor.red;
      default:
        return AppColor.primary;
    }
  }

  getStatusText(String status) {
    switch (status) {
      case "1":
        return "Initial";
      case "2":
        return "Processing";
      case "3":
        return "Completed";
      case "4":
        return "Failed";
      default:
        return "Initial";
    }
  }
}
