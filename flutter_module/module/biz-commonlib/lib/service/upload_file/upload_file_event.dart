part of 'upload_file_bloc.dart';

@immutable
abstract class UploadFileEvent
    extends BizBaseEvent<UploadFileBloc, UploadFileState> {
  UploadFileEvent();

  BaseRequest<OssConfigEntity> getProvider(
    UploadFileBloc bloc,
    String fileName,
  ) {
    return GetUploadPolicyProvider(fileName: fileName);
  }
}

class ConfirmUploadFileEvent extends UploadFileEvent {
  final File file;
  final OssConfigEntity? mOssConfigEntity;

  ConfirmUploadFileEvent(this.file, {this.mOssConfigEntity});

  @override
  Stream<UploadFileState> applyAsync(
      UploadFileBloc bloc, UploadFileState currentState) async* {
    bloc.view?.showLoadingDialog();
    final String fileName = MediaUtil.fileName(file.path);
    OssConfigEntity? uploadPolicyEntity;
    if (mOssConfigEntity != null) {
      uploadPolicyEntity = mOssConfigEntity;
    } else {
      final baseNetEntity =
          await getProvider(bloc, fileName).load().catchError((error) {
        Log.e('$error');
      });
      if (baseNetEntity == null) {
        bloc.add(
            ChangeUploadFileStateEvent(UploadingErrorState('上传失败', file.path)));
        throw PersistenceException('获取oss信息失败');
      }
      uploadPolicyEntity = baseNetEntity.data;
      if (isEmpty(uploadPolicyEntity)) {
        bloc.add(
            ChangeUploadFileStateEvent(UploadingErrorState('上传失败', file.path)));
        throw PersistenceException('获取oss信息失败');
      }
    }
    bloc.add(ChangeUploadFileStateEvent(UploadingState(0, file.path)));
    await Dio().post(uploadPolicyEntity!.cdnHost.toString(),
        data: FormData.fromMap({
          'key': uploadPolicyEntity.fileName ??
              '${uploadPolicyEntity.dir}$fileName',
          'policy': uploadPolicyEntity.policy,
          'OSSAccessKeyId': uploadPolicyEntity.accessId,
          'success_action_status': '200',
          'signature': uploadPolicyEntity.signature,
          'file': await MultipartFile.fromFile(file.path),
        }), onSendProgress: (int count, int total) {
      Log.i('onSendProgress:$count---$total--${(count / total) * 100}');
      if (bloc._isNeedProgress) {
        bloc.add(
          ChangeUploadFileStateEvent(
            UploadingState((count / total) * 100, file.path),
          ),
        );
      }
    }).then((response) {
      if (response.statusCode == 200) {
        String url;
        if (!isEmptyString(uploadPolicyEntity?.fileName)) {
          url = '${uploadPolicyEntity?.cdnHost}/${uploadPolicyEntity?.fileName}';
        } else {
          url =
              '${uploadPolicyEntity?.cdnHost}/${uploadPolicyEntity?.dir}$fileName';
        }
        Log.i('上传成功:$url');
        bloc.view?.dismissDialog();
        bloc.add(
            ChangeUploadFileStateEvent(UploadingSuccessState(url, file.path)));
      } else {
        bloc.add(
            ChangeUploadFileStateEvent(UploadingErrorState('上传失败', file.path)));
        throw PersistenceException('上传失败：${response.statusMessage}');
      }
    }, onError: (error) {
      bloc.view?.dismissDialog();
      bloc.add(
          ChangeUploadFileStateEvent(UploadingErrorState('上传失败', file.path)));
    });

    yield currentState;
  }
}

class ChangeUploadFileStateEvent extends UploadFileEvent {
  final UploadFileState uploadFileState;

  ChangeUploadFileStateEvent(this.uploadFileState);

  @override
  Stream<UploadFileState> applyAsync(
      UploadFileBloc bloc, UploadFileState currentState) async* {
    yield uploadFileState;
  }
}

class TestConfirmUploadFileEvent extends UploadFileEvent {
  final File file;

  TestConfirmUploadFileEvent(this.file);

  @override
  Stream<UploadFileState> applyAsync(
      UploadFileBloc bloc, UploadFileState currentState) async* {
    final String fileName = MediaUtil.fileName(file.path);
    final baseNetEntity =
        await GetUploadPolicyProvider(fileName: fileName).load();
    Log.i('$baseNetEntity');
    final response = await Dio().post(baseNetEntity.data!.cdnHost.toString(),
        data: FormData.fromMap({
          'key': '${baseNetEntity.data!.dir}$fileName',
          'policy': baseNetEntity.data!.policy,
          'OSSAccessKeyId': baseNetEntity.data!.accessId,
          'success_action_status': '200',
          'signature': baseNetEntity.data!.signature,
          'file': await MultipartFile.fromFile(file.path),
        }), onSendProgress: (int count, int total) {
      bloc.add(ChangeUploadFileStateEvent(
          UploadingState((count / total) * 100, file.path)));
    });
    if (response.statusCode == 200) {
      final String url =
          '${baseNetEntity.data!.cdnHost}/${baseNetEntity.data!.dir}$fileName';
      if (bloc._isNeedProgress) {
        bloc.add(
            ChangeUploadFileStateEvent(UploadingSuccessState(url, file.path)));
      }
    } else {
      bloc.add(
          ChangeUploadFileStateEvent(UploadingErrorState('上传失败', file.path)));
      throw DomainException('上传失败：${response.statusMessage}');
    }
    yield currentState;
  }
}
