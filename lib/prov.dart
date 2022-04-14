import 'package:erapid_new/services/MenuController.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider> multiProvider = [
  ChangeNotifierProvider<MenuController>(
    create: (context) => MenuController(),
  ),
];