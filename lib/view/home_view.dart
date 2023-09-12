import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:webmob_technologies/models/user_db_model.dart';
import 'package:webmob_technologies/utils/app_variable.dart';
import 'package:webmob_technologies/view_model/api_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put(ApiController());
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      AppVariable.page++;
      controller.getApiData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "User List",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Obx(
            () {
              return Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: controller.userModel!.results.length + 1,
                  itemBuilder: (context, index) {
                    controller.insertData(UserDbModel(
                        name: controller.userModel!.results[index].name
                            .toString(),
                        email: controller.userModel!.results[index].email
                            .toString(),
                        dob:
                        controller.userModel!.results[index].dob.toString(),
                        username: controller
                            .userModel!.results[index].login.username
                            .toString()));
                    if (index < controller.userModel!.results.length) {
                      return controller.isCheck.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: height * 0.25,
                                width: width * 0.90,
                                decoration: BoxDecoration(border: Border.all()),
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          height: height * 0.20,
                                          width: width * 0.40,
                                          child: const Icon(
                                            Icons.person,
                                            size: 70,
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            controller
                                                .userModel!.results[index].name
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(controller
                                              .userModel!.results[index].email
                                              .toString()),
                                          Text(controller
                                              .userModel!.results[index].dob
                                              .toString()),
                                          Text(controller.userModel!
                                              .results[index].login.username
                                              .toString()),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
