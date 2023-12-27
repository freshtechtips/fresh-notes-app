import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_base_package/fresh_base_package.dart';
import 'package:lottie/lottie.dart';

import '../../../gen/assets.gen.dart';
import '../../../logic/note_folder/cubit/note_folder_cubit.dart';

class NoteFoldersContent extends StatefulWidget {
  const NoteFoldersContent({super.key});

  @override
  State<NoteFoldersContent> createState() => _NoteFoldersContentState();
}

class _NoteFoldersContentState extends State<NoteFoldersContent> {
  @override
  Widget build(BuildContext context) {
    if (kReleaseMode) {
      return Center(
        child: Lottie.asset(
          Assets.lottie.onboarding.underDevelopment.path,
        ),
      );
    }
    return BlocBuilder<NoteFolderCubit, NoteFolderState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent:
                PlatformChecker.defaultLogic().isMobile() ? 200 : 400,
          ),
          itemCount: state.noteFolders.length,
          itemBuilder: (context, index) {
            final item = state.noteFolders[index];
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.folder,
                    size: 50,
                  ),
                  const SizedBox(height: 20),
                  Text(item.folderName),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
