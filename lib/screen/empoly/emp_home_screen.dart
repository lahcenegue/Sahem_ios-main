import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sahem/bloc/app_cubit.dart';
import 'package:sahem/bloc/app_state.dart';
import 'package:sahem/screen/empoly/work_screen.dart';
import 'package:sahem/screen/empoly/report/draftReports.dart';
import 'package:sahem/shared/compont.dart';

class EmployeeHome extends StatefulWidget {
  const EmployeeHome({super.key});

  @override
  State<EmployeeHome> createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
        builder: (context, state){
          var cubit=AppCubit.get(context);
        return SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              key: _key,
              drawer: Drawer(
                width: size.width * 0.7,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(15),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){
                              _key.currentState!.closeDrawer();
                            },
                            child: const Icon(Icons.menu,color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "????????????",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onTap: () {
                        navigatorTo(context: context,widget:const WorkScreen(isNavBar: false,) );
                      },
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: const Text(
                        "?????????? ????????????",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onTap: () {
                        navigatorTo(context: context,widget:const ReportsDrafts() );
                      },
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: const Text(
                        "?????????????????? ?? ??????????????",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: "Will be linked once published on stores!");
                      },
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          _key.currentState!.openDrawer();
                        },
                        child: Container(
                          height: 230,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 17,
                              ),
                              Image.asset('assets/images/home.jpeg',),
                              const Text(
                                '   ???????????? ??????????????  ',
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),

                    ]),
              ),
            ),
          ),
        );
    }, listener: (context, state){});
  }
}
