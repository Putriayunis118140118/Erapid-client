import 'package:erapid_new/constants.dart';
import 'package:erapid_new/services/MenuController.dart';
import 'package:erapid_new/responsive.dart';
import 'package:erapid_new/rute.dart';
import 'package:erapid_new/view/admin/v_beranda.dart';
import 'package:erapid_new/view/admin/v_pemesanan.dart';
import 'package:erapid_new/view/components/button_widget.dart';
import 'package:erapid_new/view/components/side_menu.dart';
import 'package:erapid_new/view/components/text_widget.dart';
import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:erapid_new/view_model/vm_beranda_admin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/src/provider.dart';
import 'package:stacked/stacked.dart';

class ViewDashboardPage extends StatelessWidget {
  const ViewDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BerandaAdminViewModel>.reactive(
      viewModelBuilder: () => BerandaAdminViewModel(),
      onModelReady: (model) => model.initBerandaAdmin(),
      builder: (context, model, child) => Scaffold(
        drawer: SideMenu(model: model),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SideMenu(model: model),
              ),
              Expanded(
                flex: 5,
                child: ViewBerandaAdminPage(model: model,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
