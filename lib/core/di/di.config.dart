// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:talker_flutter/talker_flutter.dart' as _i207;
import 'package:todo_list/core/di/modules.dart' as _i607;
import 'package:todo_list/core/logger/talker_logger.dart' as _i795;
import 'package:todo_list/core/navigation/app_router.dart' as _i386;
import 'package:todo_list/core/theme/app_colors.dart' as _i228;
import 'package:todo_list/core/theme/app_text_styles.dart' as _i783;
import 'package:todo_list/data/local/data_sources/responsible_lds.dart' as _i31;
import 'package:todo_list/data/local/data_sources/task_lds.dart' as _i1008;
import 'package:todo_list/data/local/database.dart' as _i655;
import 'package:todo_list/data/repositories/responsible_repository.dart'
    as _i329;
import 'package:todo_list/data/repositories/tasks_repository.dart' as _i817;
import 'package:todo_list/domain/repositories/i_responsible_repository.dart'
    as _i749;
import 'package:todo_list/domain/repositories/i_tasks_repository.dart' as _i339;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.singleton<_i207.Talker>(() => registerModule.talker);
    gh.singleton<_i386.AppRouter>(() => _i386.AppRouter());
    gh.singleton<_i228.AppColors>(() => const _i228.AppColors());
    gh.singleton<_i783.AppTextStyles>(() => const _i783.AppTextStyles());
    gh.lazySingleton<_i655.AppDatabase>(() => registerModule.database);
    gh.lazySingleton<_i795.IAppLogger>(
      () => _i795.AppLogger(talker: gh<_i207.Talker>()),
    );
    gh.lazySingleton<_i31.IResponsibleLds>(
      () =>
          _i31.ResponsibleLds(gh<_i655.AppDatabase>(), gh<_i795.IAppLogger>()),
    );
    gh.lazySingleton<_i1008.ITaskLds>(
      () => _i1008.TaskLds(gh<_i655.AppDatabase>(), gh<_i795.IAppLogger>()),
    );
    gh.lazySingleton<_i339.ITasksRepository>(
      () =>
          _i817.TasksRepository(gh<_i795.IAppLogger>(), gh<_i1008.ITaskLds>()),
    );
    gh.lazySingleton<_i749.IResponsibleRepository>(
      () => _i329.ResponsibleRepository(
        gh<_i795.IAppLogger>(),
        gh<_i31.IResponsibleLds>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i607.RegisterModule {}
