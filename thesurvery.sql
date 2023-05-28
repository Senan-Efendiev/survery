-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 28 2023 г., 19:35
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `thesurvery`
--

-- --------------------------------------------------------

--
-- Структура таблицы `answers`
--

CREATE TABLE `answers` (
  `ID_answers` int NOT NULL COMMENT 'Номер ответа',
  `ID_questions` int NOT NULL COMMENT 'Номер вопроса',
  `response_text` varchar(100) NOT NULL COMMENT 'Текст ответа'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `answers`
--

INSERT INTO `answers` (`ID_answers`, `ID_questions`, `response_text`) VALUES
(1, 1, 'Да'),
(2, 2, 'Нет'),
(3, 3, 'Не знаю'),
(4, 4, 'Скорее - да'),
(5, 5, 'Скорее - нет'),
(6, 4, 'Могли бы и лучше'),
(7, 3, 'Не устраивает вовсе'),
(8, 5, 'Полностью устраивает'),
(9, 1, 'Всем доволен(а)'),
(10, 2, 'Нужно бы что-то поменять'),
(11, 3, 'Мне все нравится'),
(12, 1, 'Я вообще не знаю'),
(13, 4, 'Остается ожидать лучшего'),
(14, 3, 'Без комментариев'),
(15, 1, 'Нет желания отвечать');

-- --------------------------------------------------------

--
-- Структура таблицы `question`
--

CREATE TABLE `question` (
  `ID_questions` int NOT NULL COMMENT 'Номер вопроса',
  `ID_survery` int NOT NULL COMMENT 'Номер опроса',
  `question_text` varchar(100) NOT NULL COMMENT 'Текст вопроса',
  `questions_type` varchar(100) NOT NULL COMMENT 'Тип вопроса (открытый, закрытый)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `question`
--

INSERT INTO `question` (`ID_questions`, `ID_survery`, `question_text`, `questions_type`) VALUES
(1, 1, 'Устраивает ли вас политическая обстановка в городе?', 'Закрытый'),
(2, 2, 'Хорошо ли убираются у вас во дворе коммунальщики?', 'Открытый'),
(3, 3, 'Хватает ли вам пенсионных накоплений', 'Открытый'),
(4, 4, 'Хороший ли уровень инфраструктуры в вашем городе', 'Открытый'),
(5, 5, 'В целом нормальное настроение жильцов в вашем городе?', 'Закрытый');

-- --------------------------------------------------------

--
-- Структура таблицы `respondents`
--

CREATE TABLE `respondents` (
  `ID_respondents` int NOT NULL COMMENT 'Респондент',
  `name` varchar(100) NOT NULL COMMENT 'Имя',
  `last_name` varchar(100) NOT NULL COMMENT 'Фамилия',
  `age` varchar(100) NOT NULL COMMENT 'Возраст',
  `gender` varchar(100) NOT NULL COMMENT 'Пол',
  `contact_information` varchar(100) NOT NULL COMMENT 'Контактная информация',
  `city` varchar(100) NOT NULL COMMENT 'Город опросника'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `respondents`
--

INSERT INTO `respondents` (`ID_respondents`, `name`, `last_name`, `age`, `gender`, `contact_information`, `city`) VALUES
(1, 'Сергей', 'Хмуров', '65', 'Мужской', '89224133411', 'Сургут'),
(2, 'Тимофей', 'Грустный', '28', 'Мужской', '89224133132', 'Тюмень'),
(3, 'Галина', 'Чудная', '46', 'Женский', '89224131231', 'Москва');

-- --------------------------------------------------------

--
-- Структура таблицы `respondentsresponses`
--

CREATE TABLE `respondentsresponses` (
  `ID` int NOT NULL,
  `ID_answers` int NOT NULL COMMENT 'Ответ респондента',
  `ID_respondent` int NOT NULL COMMENT 'Респондент'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `respondentsresponses`
--

INSERT INTO `respondentsresponses` (`ID`, `ID_answers`, `ID_respondent`) VALUES
(1, 6, 2),
(2, 2, 3),
(3, 3, 3),
(4, 4, 1),
(5, 5, 2),
(6, 6, 3),
(7, 7, 1),
(8, 8, 2),
(9, 9, 1),
(10, 10, 2),
(11, 11, 3),
(12, 12, 3),
(13, 13, 3),
(14, 14, 2),
(15, 15, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `survery`
--

CREATE TABLE `survery` (
  `ID_survery` int NOT NULL COMMENT 'Номер опроса',
  `name_survery` varchar(100) NOT NULL COMMENT 'Название опроса',
  `start_date` date DEFAULT NULL COMMENT 'Дата начала',
  `end_date` date DEFAULT NULL COMMENT 'Дата окончания',
  `survey_description` varchar(100) NOT NULL COMMENT 'Описание опроса'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `survery`
--

INSERT INTO `survery` (`ID_survery`, `name_survery`, `start_date`, `end_date`, `survey_description`) VALUES
(1, 'Пенсионные накопления', '2022-11-09', '2022-11-16', 'Довольны ли пенсионеры своими накоплениями'),
(2, 'Коммунальные услуги', '2023-03-08', '2023-03-15', 'Изучить вопрос коммунальных услуг в домах'),
(3, 'Городская инфраструктура', '2023-04-10', '2023-04-27', 'Нравится ли людям инфраструктура города'),
(4, 'Обстановка в городе', '2023-05-08', '2023-05-30', 'Узнать мнение людей про настроение в городе'),
(5, 'Политическая удовлетворенность ', '2023-05-01', '2023-05-02', 'Изучить уровень удовлетворенности людей политикой ');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`ID_answers`),
  ADD KEY `ID_questions` (`ID_questions`);

--
-- Индексы таблицы `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`ID_questions`),
  ADD KEY `ID_survery` (`ID_survery`);

--
-- Индексы таблицы `respondents`
--
ALTER TABLE `respondents`
  ADD PRIMARY KEY (`ID_respondents`);

--
-- Индексы таблицы `respondentsresponses`
--
ALTER TABLE `respondentsresponses`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_respondent` (`ID_respondent`),
  ADD KEY `ID_answers` (`ID_answers`);

--
-- Индексы таблицы `survery`
--
ALTER TABLE `survery`
  ADD PRIMARY KEY (`ID_survery`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answers`
--
ALTER TABLE `answers`
  MODIFY `ID_answers` int NOT NULL AUTO_INCREMENT COMMENT 'Номер ответа', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `respondents`
--
ALTER TABLE `respondents`
  MODIFY `ID_respondents` int NOT NULL AUTO_INCREMENT COMMENT 'Респондент', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `respondentsresponses`
--
ALTER TABLE `respondentsresponses`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `survery`
--
ALTER TABLE `survery`
  MODIFY `ID_survery` int NOT NULL AUTO_INCREMENT COMMENT 'Номер опроса', AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`ID_questions`) REFERENCES `question` (`ID_questions`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`ID_survery`) REFERENCES `survery` (`ID_survery`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `respondentsresponses`
--
ALTER TABLE `respondentsresponses`
  ADD CONSTRAINT `respondentsresponses_ibfk_2` FOREIGN KEY (`ID_respondent`) REFERENCES `respondents` (`ID_respondents`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `respondentsresponses_ibfk_3` FOREIGN KEY (`ID_answers`) REFERENCES `answers` (`ID_answers`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
