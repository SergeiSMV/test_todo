## Команды для работы с проектом
1) Получение pub&pods
- `sh gen_pub.sh`

2) Запуск build runner
- `sh gen_run.sh`

3) Генерация assets
- впервые: 
    - `brew install FlutterGen/tap/fluttergen` (works with macOS and Linux)
    - `dart pub global activate flutter_gen` (works with macOS, Linux and Windows)
- впоследствии: 
    - `sh gen_assets.sh`

3) Генерация локализации
- `sh run_slang.sh`
