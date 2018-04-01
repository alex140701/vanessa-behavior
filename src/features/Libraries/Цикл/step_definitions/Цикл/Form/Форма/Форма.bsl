﻿
///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ПокаВыражениеВстроенногоЯзыкаИстинноТогда(Парам01)","ПокаВыражениеВстроенногоЯзыкаИстинноТогда","И Пока выражение встроенного языка ""Контекст.СлужебнаяПеременная < 2"" истинно тогда","Цикл. Выполняет шаги пока истинно условие","Встроенный язык","Цикл");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДляКаждойСтрокиТаблицыЯВыполняю(Парам01)","ДляКаждойСтрокиТаблицыЯВыполняю","И для каждой строки таблицы ""ИмяТаблицы"" я выполняю","Цикл. Выполняет шаги для каждой строки таблицы","UI.Таблицы.Перебор строк","Цикл");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ПокаВТаблицеКоличествоСтрокТогда(Парам01,Парам02,Парам03)","ПокаВТаблицеКоличествоСтрокТогда","И Пока в таблице ""ИмяТаблицы"" количество строк "">"" 0 Тогда","Цикл. Выполняет шаги до тех пор, пока в таблице есть строки","UI.Таблицы.Перебор строк","Цикл");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"СлужебноеУсловиеВКоторомМеняетсяСлужебнаяПеременнаяИстинноТогда()","СлужебноеУсловиеВКоторомМеняетсяСлужебнаяПеременнаяИстинноТогда","Если служебное условие, в котором меняется служебная переменная истинно тогда","","","Условие");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВТечениеСекундЯВыполняю(Парам01)","ВТечениеСекундЯВыполняю","И в течение 100 секунд я выполняю","Цикл. Выполняет действия в цикле в течение заданного числа секунд. По истечении времени вызывает исключение.","Прочее.Циклы","Цикл");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПрерываюЦикл()","ЯПрерываюЦикл","Тогда я прерываю цикл","Устанавливает признак, что надо завершить выполнение цикла","Прочее.Циклы");

	
	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//И Пока выражение встроенного "Контекст.СлужебнаяПеременная < 2" языка истинно тогда
//@ПокаВыражениеВстроенногоЯзыкаИстинноТогда(Парам01)
Процедура ПокаВыражениеВстроенногоЯзыкаИстинноТогда(Выражение) Экспорт
	Результат = Вычислить(Выражение);
	Если Результат Тогда
		Ванесса.УстановитьРезультатУсловия(Истина);
	Иначе	
		Ванесса.УстановитьРезультатУсловия(Ложь);
	КонецЕсли;	 
КонецПроцедуры

&НаКлиенте
//И для каждой строки таблицы "ТабличнаяЧасть1" я выполняю
//@ДляКаждойСтрокиТаблицыЯВыполняю(Парам01)
Процедура ДляКаждойСтрокиТаблицыЯВыполняю(ИмяТЧ) Экспорт
	
	ТЧ = Ванесса.НайтиТЧПоИмени(ИмяТЧ);
	
	ИдШага = "ИдШага" + XMLСтрока(Ванесса.ПолучитьСостояниеVanessaBehavior().ТекущийШаг.ИдСтроки);
	Если НЕ Контекст.Свойство(ИдШага) Тогда
		//значит это блок инициализации
		Контекст.Вставить(ИдШага,Истина);
		
		ТЧ.ПерейтиКПервойСтроке();
		Ванесса.УстановитьРезультатУсловия(Истина);
		
		Возврат;
	КонецЕсли;	 
	
	
	Попытка
		ТЧ.ПерейтиКСледующейСтроке();
		Ванесса.УстановитьРезультатУсловия(Истина);
	Исключение
		Ванесса.УстановитьРезультатУсловия(Ложь);
		Контекст.Удалить(ИдШага);
	КонецПопытки;
	
	
КонецПроцедуры

&НаКлиенте
//Пока в таблице "ТабличнаяЧасть1" количество строк ">" 0 Тогда
//@ПокаВТаблицеКоличествоСтрокТогда(Парам01,Парам02,Парам03)
Процедура ПокаВТаблицеКоличествоСтрокТогда(ИмяТаблицы,Знач Сравнение,КоличествоСтрок) Экспорт
	ТЧ      = Ванесса.НайтиТЧПоИмени(ИмяТаблицы);
	Таблица = Ванесса.ПолучитьЗначениеТестируемаяТаблицаФормы(ТЧ);
	Если Таблица = Неопределено Тогда
		ВызватьИсключение "Не смог получить строки ТЧ <" + ИмяТаблицы + ">";
	КонецЕсли;	 
	
	
	Сравнение = Ванесса.ПолучитьОператорПоТексту(Сравнение);
	Выражение = "Таблица.Количество() " + Сравнение +  " " + XMLСтрока(КоличествоСтрок);
	Результат = Вычислить(Выражение);
	Если Результат Тогда
		Ванесса.УстановитьРезультатУсловия(Истина);
	Иначе	
		Ванесса.УстановитьРезультатУсловия(Ложь);
	КонецЕсли;	 
КонецПроцедуры

&НаКлиенте
//Если служебное условие, в котором меняется служебная переменная истинно тогда
//@СлужебноеУсловиеВКоторомМеняетсяСлужебнаяПеременнаяИстинноТогда()
Процедура СлужебноеУсловиеВКоторомМеняетсяСлужебнаяПеременнаяИстинноТогда() Экспорт
	Контекст.СлужебнаяПеременная1 = Контекст.СлужебнаяПеременная1 + 1;
	Если Контекст.СлужебнаяПеременная1 < 4 Тогда
		Ванесса.УстановитьРезультатУсловия(Истина);
		Возврат;
	КонецЕсли;	 
	
	Ванесса.УстановитьРезультатУсловия(Ложь);
КонецПроцедуры


&НаКлиенте
Процедура ОбработчикОжиданияВТечениеСекундЯВыполняю()
	ИмяОбработчика = "ОбработчикОжиданияВТечениеСекундЯВыполняю";
	
	Если ТекущаяДата() >= ДатаОкончанияОбработкиОжидания Тогда
		ОтключитьОбработчикОжидания(ИмяОбработчика);
		Ванесса.УстановитьРезультатУсловия(Ложь);
		Ванесса.ПродолжитьВыполнениеШагов(Истина,"Не удалось дождаться события завершения цикла в течение <" + КоличествоСекундОбработкаОжидания + "> секунд.");
		Возврат;
	КонецЕсли;	
	
	Ванесса.УстановитьРезультатУсловия(Истина);
	Ванесса.ПродолжитьВыполнениеШагов();
КонецПроцедуры

&НаКлиенте
//И в течение 10 секунд я выполняю
//@ВТечениеСекундЯВыполняю(Парам01)
Процедура ВТечениеСекундЯВыполняю(КоличествоСекунд) Экспорт
	Если Контекст.Свойство("ЗавершитьВыполнениеЦикла") Тогда
		Если Контекст.ЗавершитьВыполнениеЦикла = Истина Тогда
			Контекст.ЗавершитьВыполнениеЦикла = Ложь;
			Ванесса.УстановитьРезультатУсловия(Ложь);
			Возврат;
		КонецЕсли;	 
	КонецЕсли;	 
	
	Ванесса.ЗапретитьВыполнениеШагов();
	
	ДатаНачалаОбработкиОжидания       = ТекущаяДата();
	КоличествоСекундОбработкаОжидания = Ванесса.ЗначениеТаймаутаДляАсинхронногоШага(КоличествоСекунд);
	ДатаОкончанияОбработкиОжидания    = ДатаНачалаОбработкиОжидания + КоличествоСекундОбработкаОжидания;
	
	ПодключитьОбработчикОжидания("ОбработчикОжиданияВТечениеСекундЯВыполняю",1,Истина);
КонецПроцедуры


&НаКлиенте
//Тогда я прерываю цикл
//@ЯПрерываюЦикл()
Процедура ЯПрерываюЦикл() Экспорт
	Контекст.Вставить("ЗавершитьВыполнениеЦикла",Истина);
КонецПроцедуры
