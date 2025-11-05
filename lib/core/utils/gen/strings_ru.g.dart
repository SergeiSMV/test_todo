///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsRu = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsBottomNavBarRu bottom_nav_bar = TranslationsBottomNavBarRu._(_root);
	late final TranslationsDefaultStatesRu default_states = TranslationsDefaultStatesRu._(_root);
	late final TranslationsScreenTitlesRu screen_titles = TranslationsScreenTitlesRu._(_root);
	late final TranslationsTaskDateRu task_date = TranslationsTaskDateRu._(_root);
	late final TranslationsTaskPriorityRu task_priority = TranslationsTaskPriorityRu._(_root);
	late final TranslationsAddResponsibleRu add_responsible = TranslationsAddResponsibleRu._(_root);
	late final TranslationsTaskFormRu task_form = TranslationsTaskFormRu._(_root);
	late final TranslationsValidationErrorsRu validation_errors = TranslationsValidationErrorsRu._(_root);
	late final TranslationsTaskFilterRu task_filter = TranslationsTaskFilterRu._(_root);
}

// Path: bottom_nav_bar
class TranslationsBottomNavBarRu {
	TranslationsBottomNavBarRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'мои задачи'
	String get my_tasks => 'мои задачи';

	/// ru: 'задачи от меня'
	String get assigned_tasks => 'задачи от меня';
}

// Path: default_states
class TranslationsDefaultStatesRu {
	TranslationsDefaultStatesRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'список пуст'
	String get empty_list => 'список пуст';

	/// ru: 'ошибка при загрузке'
	String get error => 'ошибка при загрузке';

	/// ru: 'загрузка'
	String get loading => 'загрузка';
}

// Path: screen_titles
class TranslationsScreenTitlesRu {
	TranslationsScreenTitlesRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsScreenTitlesMyTasksRu my_tasks = TranslationsScreenTitlesMyTasksRu._(_root);
	late final TranslationsScreenTitlesAssignedTasksRu assigned_tasks = TranslationsScreenTitlesAssignedTasksRu._(_root);
	late final TranslationsScreenTitlesResponsibleRu responsible = TranslationsScreenTitlesResponsibleRu._(_root);
	late final TranslationsScreenTitlesResponsibleItemRu responsible_item = TranslationsScreenTitlesResponsibleItemRu._(_root);
}

// Path: task_date
class TranslationsTaskDateRu {
	TranslationsTaskDateRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'бессрочно'
	String get indefinitely_date => 'бессрочно';
}

// Path: task_priority
class TranslationsTaskPriorityRu {
	TranslationsTaskPriorityRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'приоритеты задач'
	String get title => 'приоритеты задач';

	/// ru: 'выбирите приоритет для новой задачи'
	String get description => 'выбирите приоритет для новой задачи';

	/// ru: 'низкий'
	String get low => 'низкий';

	/// ru: 'средний'
	String get medium => 'средний';

	/// ru: 'высокий'
	String get high => 'высокий';
}

// Path: add_responsible
class TranslationsAddResponsibleRu {
	TranslationsAddResponsibleRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'добавить ответственного'
	String get title => 'добавить ответственного';

	/// ru: 'добавьте нового ответственного для ваших задач'
	String get description => 'добавьте нового ответственного для ваших задач';

	/// ru: 'укажите имя'
	String get name_title => 'укажите имя';

	/// ru: 'имя ответственного'
	String get name_hint => 'имя ответственного';

	/// ru: 'укажите телефон в формате +7XXXXXXXXXX'
	String get phone_title => 'укажите телефон в формате +7XXXXXXXXXX';

	/// ru: 'телефон ответственного'
	String get phone_hint => 'телефон ответственного';

	/// ru: 'добавить'
	String get save => 'добавить';
}

// Path: task_form
class TranslationsTaskFormRu {
	TranslationsTaskFormRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsTaskFormAppBarRu app_bar = TranslationsTaskFormAppBarRu._(_root);
	late final TranslationsTaskFormTaskTitleRu task_title = TranslationsTaskFormTaskTitleRu._(_root);
	late final TranslationsTaskFormTaskDescriptionRu task_description = TranslationsTaskFormTaskDescriptionRu._(_root);
	late final TranslationsTaskFormResponsibleRu responsible = TranslationsTaskFormResponsibleRu._(_root);
	late final TranslationsTaskFormPriorityRu priority = TranslationsTaskFormPriorityRu._(_root);
	late final TranslationsTaskFormDueDateRu due_date = TranslationsTaskFormDueDateRu._(_root);
	late final TranslationsTaskFormCalendarRu calendar = TranslationsTaskFormCalendarRu._(_root);
	late final TranslationsTaskFormAddTaskRu add_task = TranslationsTaskFormAddTaskRu._(_root);
}

// Path: validation_errors
class TranslationsValidationErrorsRu {
	TranslationsValidationErrorsRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'минимум 2 символа'
	String get name_error => 'минимум 2 символа';

	/// ru: 'минимум 5 символов'
	String get title_error => 'минимум 5 символов';

	/// ru: 'минимум 10 символов'
	String get description_error => 'минимум 10 символов';

	/// ru: 'срок выполнения не может быть раньше текущей даты'
	String get due_date_error => 'срок выполнения не может быть раньше текущей даты';

	/// ru: 'некорректный формат телефона'
	String get phone_error => 'некорректный формат телефона';
}

// Path: task_filter
class TranslationsTaskFilterRu {
	TranslationsTaskFilterRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'фильтр задач'
	String get title => 'фильтр задач';

	/// ru: 'выберите фильтры для отображения задач'
	String get description => 'выберите фильтры для отображения задач';

	/// ru: 'приоритет'
	String get priority => 'приоритет';

	/// ru: 'статус'
	String get status => 'статус';

	/// ru: 'все приоритеты'
	String get all_priorities => 'все приоритеты';

	/// ru: 'все статусы'
	String get all_statuses => 'все статусы';

	/// ru: 'активные'
	String get active => 'активные';

	/// ru: 'неактивные'
	String get inactive => 'неактивные';

	/// ru: 'сбросить'
	String get clear => 'сбросить';

	/// ru: 'применить'
	String get apply => 'применить';
}

// Path: screen_titles.my_tasks
class TranslationsScreenTitlesMyTasksRu {
	TranslationsScreenTitlesMyTasksRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'мои задачи'
	String get title => 'мои задачи';

	/// ru: 'здесь вы можете управлять своими задачами'
	String get description => 'здесь вы можете управлять своими задачами';
}

// Path: screen_titles.assigned_tasks
class TranslationsScreenTitlesAssignedTasksRu {
	TranslationsScreenTitlesAssignedTasksRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'задачи от меня'
	String get title => 'задачи от меня';

	/// ru: 'здесь вы можете управлять задачами, которые вы назначили'
	String get description => 'здесь вы можете управлять задачами, которые вы назначили';
}

// Path: screen_titles.responsible
class TranslationsScreenTitlesResponsibleRu {
	TranslationsScreenTitlesResponsibleRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'выбор ответственного'
	String get title => 'выбор ответственного';

	/// ru: 'здесь вы можете выбрать или создать ответственного для новой задачи'
	String get description => 'здесь вы можете выбрать или создать ответственного для новой задачи';
}

// Path: screen_titles.responsible_item
class TranslationsScreenTitlesResponsibleItemRu {
	TranslationsScreenTitlesResponsibleItemRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'назначить ответственным себя'
	String get description => 'назначить ответственным себя';
}

// Path: task_form.app_bar
class TranslationsTaskFormAppBarRu {
	TranslationsTaskFormAppBarRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'новая задача'
	String get title => 'новая задача';

	/// ru: 'здесь вы можете создать новую задачу'
	String get description => 'здесь вы можете создать новую задачу';
}

// Path: task_form.task_title
class TranslationsTaskFormTaskTitleRu {
	TranslationsTaskFormTaskTitleRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'укажите название задачи'
	String get title => 'укажите название задачи';

	/// ru: 'название задачи'
	String get hint_title => 'название задачи';
}

// Path: task_form.task_description
class TranslationsTaskFormTaskDescriptionRu {
	TranslationsTaskFormTaskDescriptionRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'укажите описание задачи'
	String get title => 'укажите описание задачи';

	/// ru: 'описание задачи'
	String get hint_description => 'описание задачи';
}

// Path: task_form.responsible
class TranslationsTaskFormResponsibleRu {
	TranslationsTaskFormResponsibleRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'укажите ответственного'
	String get title => 'укажите ответственного';

	/// ru: 'выбрать ответственного'
	String get hint_responsible => 'выбрать ответственного';
}

// Path: task_form.priority
class TranslationsTaskFormPriorityRu {
	TranslationsTaskFormPriorityRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'укажите приоритет задачи'
	String get title => 'укажите приоритет задачи';

	/// ru: 'выбрать приоритет'
	String get hint_text => 'выбрать приоритет';
}

// Path: task_form.due_date
class TranslationsTaskFormDueDateRu {
	TranslationsTaskFormDueDateRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'срок выполнения'
	String get title => 'срок выполнения';

	/// ru: 'выбрать срок выполнения'
	String get hint_text => 'выбрать срок выполнения';
}

// Path: task_form.calendar
class TranslationsTaskFormCalendarRu {
	TranslationsTaskFormCalendarRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'отмена'
	String get cancel => 'отмена';

	/// ru: 'ок'
	String get confirm => 'ок';
}

// Path: task_form.add_task
class TranslationsTaskFormAddTaskRu {
	TranslationsTaskFormAddTaskRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'добавить задачу'
	String get title => 'добавить задачу';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return _flatMapFunction$0(path);
	}

	dynamic _flatMapFunction$0(String path) {
		switch (path) {
			case 'bottom_nav_bar.my_tasks': return 'мои задачи';
			case 'bottom_nav_bar.assigned_tasks': return 'задачи от меня';
			case 'default_states.empty_list': return 'список пуст';
			case 'default_states.error': return 'ошибка при загрузке';
			case 'default_states.loading': return 'загрузка';
			case 'screen_titles.my_tasks.title': return 'мои задачи';
			case 'screen_titles.my_tasks.description': return 'здесь вы можете управлять своими задачами';
			case 'screen_titles.assigned_tasks.title': return 'задачи от меня';
			case 'screen_titles.assigned_tasks.description': return 'здесь вы можете управлять задачами, которые вы назначили';
			case 'screen_titles.responsible.title': return 'выбор ответственного';
			case 'screen_titles.responsible.description': return 'здесь вы можете выбрать или создать ответственного для новой задачи';
			case 'screen_titles.responsible_item.description': return 'назначить ответственным себя';
			case 'task_date.indefinitely_date': return 'бессрочно';
			case 'task_priority.title': return 'приоритеты задач';
			case 'task_priority.description': return 'выбирите приоритет для новой задачи';
			case 'task_priority.low': return 'низкий';
			case 'task_priority.medium': return 'средний';
			case 'task_priority.high': return 'высокий';
			case 'add_responsible.title': return 'добавить ответственного';
			case 'add_responsible.description': return 'добавьте нового ответственного для ваших задач';
			case 'add_responsible.name_title': return 'укажите имя';
			case 'add_responsible.name_hint': return 'имя ответственного';
			case 'add_responsible.phone_title': return 'укажите телефон в формате +7XXXXXXXXXX';
			case 'add_responsible.phone_hint': return 'телефон ответственного';
			case 'add_responsible.save': return 'добавить';
			case 'task_form.app_bar.title': return 'новая задача';
			case 'task_form.app_bar.description': return 'здесь вы можете создать новую задачу';
			case 'task_form.task_title.title': return 'укажите название задачи';
			case 'task_form.task_title.hint_title': return 'название задачи';
			case 'task_form.task_description.title': return 'укажите описание задачи';
			case 'task_form.task_description.hint_description': return 'описание задачи';
			case 'task_form.responsible.title': return 'укажите ответственного';
			case 'task_form.responsible.hint_responsible': return 'выбрать ответственного';
			case 'task_form.priority.title': return 'укажите приоритет задачи';
			case 'task_form.priority.hint_text': return 'выбрать приоритет';
			case 'task_form.due_date.title': return 'срок выполнения';
			case 'task_form.due_date.hint_text': return 'выбрать срок выполнения';
			case 'task_form.calendar.cancel': return 'отмена';
			case 'task_form.calendar.confirm': return 'ок';
			case 'task_form.add_task.title': return 'добавить задачу';
			case 'validation_errors.name_error': return 'минимум 2 символа';
			case 'validation_errors.title_error': return 'минимум 5 символов';
			case 'validation_errors.description_error': return 'минимум 10 символов';
			case 'validation_errors.due_date_error': return 'срок выполнения не может быть раньше текущей даты';
			case 'validation_errors.phone_error': return 'некорректный формат телефона';
			case 'task_filter.title': return 'фильтр задач';
			case 'task_filter.description': return 'выберите фильтры для отображения задач';
			case 'task_filter.priority': return 'приоритет';
			case 'task_filter.status': return 'статус';
			case 'task_filter.all_priorities': return 'все приоритеты';
			case 'task_filter.all_statuses': return 'все статусы';
			case 'task_filter.active': return 'активные';
			case 'task_filter.inactive': return 'неактивные';
			case 'task_filter.clear': return 'сбросить';
			case 'task_filter.apply': return 'применить';
			default: return null;
		}
	}
}

