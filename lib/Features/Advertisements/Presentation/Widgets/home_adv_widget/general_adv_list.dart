import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Bloc/general_adv/general_adv_cubit.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Widgets/general_adv_skelton.dart';
import 'package:ajyal/Features/Advertisements/Presentation/Widgets/home_adv_widget/adv_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralAdvList extends StatelessWidget {
  const GeneralAdvList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralAdvCubit, GeneralAdvState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "إعلانات عامة",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                state is GeneralAdvSuccess
                    ? ViewAllAdv(
                      router: AppRouter.allGeneralPage,
                      params: {
                        'resultsList': state.model.data,
                        'paginationModel': state.model,
                      },
                      viewText: "عرض الكل",
                    )
                    : SizedBox(),
              ],
            ),
            state is GeneralAdvSuccess
                ? SizedBox(
                  height: 145,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.model.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          elevation: 1,
                          color: AppColor.fillTextField,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            width: MediaQuery.of(context).size.width - 100,
                            child: Column(
                              //  leading: Image.asset(AppImages.adv),
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        state.model.data![index].title!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  state.model.data![index].body!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(height: 2),
                                ),
                                SizedBox(height: 3),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        formatTime(
                                          state.model.data![index].createdAt!,
                                        ),
                                        style: TextStyle(color: Colors.grey),
                                      ),

                                      Text(
                                        state
                                                    .model
                                                    .data![index]
                                                    .images!
                                                    .length ==
                                                1
                                            ? "  ${state.model.data![index].images!.length} صورة "
                                            : "  ${state.model.data![index].images!.length} صور ",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
                : GeneralAdvShimmer(),
          ],
        );
      },
    );
  }
}
