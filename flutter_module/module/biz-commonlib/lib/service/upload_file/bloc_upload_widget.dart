import 'package:common_lib/index.dart';
import 'package:common_lib/service/upload_file/upload_file_bloc.dart';
import 'package:flutter/material.dart';

typedef BlocUploadBuild = Widget Function(UploadFileState state);

class BlocUploadWidget extends StatelessWidget {
  final BlocUploadBuild uploadBuild;
  final UploadFileBloc uploadFileBloc;

  const BlocUploadWidget({
    required this.uploadBuild,
    required this.uploadFileBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadFileBloc, UploadFileState>(
      builder: (_, state) {
        return uploadBuild(state);
      },
      bloc: uploadFileBloc,
    );
  }
}
