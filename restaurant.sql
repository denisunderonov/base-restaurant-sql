-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 16 2023 г., 23:14
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `restaurant`
--

-- --------------------------------------------------------

--
-- Структура таблицы `gostevoy_schet`
--

CREATE TABLE `gostevoy_schet` (
  `id_gostevoy_schet` int NOT NULL,
  `open_date` datetime(6) NOT NULL,
  `close_date` datetime(6) NOT NULL,
  `summa_scheta` int NOT NULL,
  `id_stolik` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `gostevoy_schet`
--

INSERT INTO `gostevoy_schet` (`id_gostevoy_schet`, `open_date`, `close_date`, `summa_scheta`, `id_stolik`) VALUES
(6, '2023-12-01 07:34:45.000000', '2023-12-01 08:34:45.000000', 5000, 5),
(7, '2023-12-02 09:36:20.000000', '2023-12-02 11:36:20.000000', 6500, 5),
(8, '2023-12-03 13:39:36.000000', '2023-12-03 14:39:36.000000', 2000, 5),
(9, '2023-12-04 15:44:59.000000', '2023-12-04 18:44:59.000000', 8000, 6),
(10, '2023-12-03 18:45:21.000000', '2023-12-03 20:45:21.000000', 5000, 6),
(11, '2023-12-05 16:45:42.000000', '2023-12-15 19:45:42.000000', 9000, 7),
(12, '2023-12-06 18:46:10.000000', '2023-12-15 19:46:10.000000', 3500, 8),
(13, '2023-12-07 18:46:32.000000', '2023-12-07 23:46:32.000000', 15000, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `id_menu` int NOT NULL,
  `blydo_name` varchar(100) NOT NULL,
  `blydo_price` int NOT NULL,
  `blydo_description` varchar(100) NOT NULL,
  `id_restaurant` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='id_restaurant';

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id_menu`, `blydo_name`, `blydo_price`, `blydo_description`, `id_restaurant`) VALUES
(7, 'Улитки по-бургундски', 500, 'Аппетитные Улитки по-бургундски', 1),
(8, 'Утиные ножки «Конфи»', 450, 'Аппетитные Утиные ножки «Конфи»', 1),
(9, 'Тигровые креветки, жаренные в томатном соусе', 650, 'Аппетитные Тигровые креветки, жаренные в томатном соусе', 1),
(10, 'Утопенцы по-чешски', 350, 'Аппетитные Утопенцы по-чешски', 1),
(11, 'Банановые панкейки', 400, 'Аппетитные Банановые панкейки', 1),
(12, 'Хачапури по-аджарски', 600, 'Аппетитные Хачапури по-аджарски', 1),
(13, 'Куба либре', 800, 'Коктель Куба либре', 1),
(14, 'Лонг-айленд', 750, 'Коктель Лонг-айленд', 1),
(15, 'Мохито', 500, 'Коктель Мохито', 1),
(16, 'Пина колада', 650, 'Коктель Пина колада', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oplata`
--

CREATE TABLE `oplata` (
  `id_oplata` int NOT NULL,
  `id_gostevoy_schet` int NOT NULL,
  `sposob_oplaty` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `oplata`
--

INSERT INTO `oplata` (`id_oplata`, `id_gostevoy_schet`, `sposob_oplaty`) VALUES
(1, 6, 'Карта'),
(2, 7, 'Наличные '),
(3, 8, 'Карта'),
(4, 9, 'Карта'),
(11, 10, 'Наличные'),
(12, 11, 'Карта'),
(14, 12, 'Карта'),
(15, 13, 'Карта');

-- --------------------------------------------------------

--
-- Структура таблицы `postoyaniy_klient`
--

CREATE TABLE `postoyaniy_klient` (
  `id_postoyaniy_klient` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `privilegii` varchar(100) NOT NULL,
  `id_restaurant` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `postoyaniy_klient`
--

INSERT INTO `postoyaniy_klient` (`id_postoyaniy_klient`, `name`, `surname`, `privilegii`, `id_restaurant`) VALUES
(1, 'Денис', 'Андронов', 'Скидка - 50% на все', 1),
(2, 'Никита', 'Волков', 'Скидка 30 % на все', 1),
(5, 'Сергей', 'Богушев', 'Скидка 50% на весь бар ', 1),
(6, 'Евгений', 'Подолякин', 'Скидка 15 % на всё ', 1),
(7, 'Айша', 'Абдрашитова', 'Скидка 5% на всё меню ', 1),
(8, 'Татьяна', 'Иванова', 'Скидка 1% на всё', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `restaurant`
--

CREATE TABLE `restaurant` (
  `id_restaurant` int NOT NULL,
  `restaurant_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `restaurant`
--

INSERT INTO `restaurant` (`id_restaurant`, `restaurant_name`) VALUES
(1, 'Кишлак');

-- --------------------------------------------------------

--
-- Структура таблицы `stolik`
--

CREATE TABLE `stolik` (
  `id_stolik` int NOT NULL,
  `stolik_number` int NOT NULL,
  `vmestimost_stolika` int NOT NULL,
  `id_restaurant` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `stolik`
--

INSERT INTO `stolik` (`id_stolik`, `stolik_number`, `vmestimost_stolika`, `id_restaurant`) VALUES
(5, 1, 2, 1),
(6, 2, 4, 1),
(7, 3, 6, 1),
(8, 4, 2, 1),
(9, 5, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Zakaz_spisok`
--

CREATE TABLE `Zakaz_spisok` (
  `id_zakaz` int NOT NULL,
  `id_gostevoy_schet` int NOT NULL,
  `id_menu` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `Zakaz_spisok`
--

INSERT INTO `Zakaz_spisok` (`id_zakaz`, `id_gostevoy_schet`, `id_menu`) VALUES
(1, 6, 13),
(2, 6, 15),
(3, 6, 8),
(4, 7, 16),
(5, 7, 12),
(6, 7, 10),
(7, 8, 13),
(8, 8, 14),
(9, 8, 9),
(10, 8, 7),
(11, 9, 15),
(12, 9, 14),
(13, 9, 10),
(14, 9, 9),
(15, 9, 11),
(16, 10, 9),
(17, 10, 13),
(18, 11, 9),
(19, 12, 12),
(20, 11, 8),
(21, 11, 12),
(22, 13, 14),
(23, 13, 14),
(24, 13, 8),
(25, 13, 8);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `gostevoy_schet`
--
ALTER TABLE `gostevoy_schet`
  ADD KEY `id_gostevoy_schet` (`id_gostevoy_schet`) USING BTREE,
  ADD KEY `id_stolik` (`id_stolik`);

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `id_restaurant` (`id_restaurant`);

--
-- Индексы таблицы `oplata`
--
ALTER TABLE `oplata`
  ADD PRIMARY KEY (`id_oplata`),
  ADD UNIQUE KEY `id_gostevoy_schet` (`id_gostevoy_schet`),
  ADD UNIQUE KEY `id_gostevoy_schet_2` (`id_gostevoy_schet`);

--
-- Индексы таблицы `postoyaniy_klient`
--
ALTER TABLE `postoyaniy_klient`
  ADD PRIMARY KEY (`id_postoyaniy_klient`),
  ADD KEY `id_restaurant` (`id_restaurant`);

--
-- Индексы таблицы `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id_restaurant`);

--
-- Индексы таблицы `stolik`
--
ALTER TABLE `stolik`
  ADD PRIMARY KEY (`id_stolik`),
  ADD KEY `id_restaurant` (`id_restaurant`);

--
-- Индексы таблицы `Zakaz_spisok`
--
ALTER TABLE `Zakaz_spisok`
  ADD PRIMARY KEY (`id_zakaz`),
  ADD KEY `id_gostevoy_schet` (`id_gostevoy_schet`),
  ADD KEY `id_menu` (`id_menu`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `gostevoy_schet`
--
ALTER TABLE `gostevoy_schet`
  MODIFY `id_gostevoy_schet` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `oplata`
--
ALTER TABLE `oplata`
  MODIFY `id_oplata` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `postoyaniy_klient`
--
ALTER TABLE `postoyaniy_klient`
  MODIFY `id_postoyaniy_klient` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id_restaurant` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `stolik`
--
ALTER TABLE `stolik`
  MODIFY `id_stolik` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `Zakaz_spisok`
--
ALTER TABLE `Zakaz_spisok`
  MODIFY `id_zakaz` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `gostevoy_schet`
--
ALTER TABLE `gostevoy_schet`
  ADD CONSTRAINT `gostevoy_schet_ibfk_1` FOREIGN KEY (`id_stolik`) REFERENCES `stolik` (`id_stolik`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `gostevoy_schet_ibfk_2` FOREIGN KEY (`id_gostevoy_schet`) REFERENCES `Zakaz_spisok` (`id_gostevoy_schet`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurant` (`id_restaurant`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `oplata`
--
ALTER TABLE `oplata`
  ADD CONSTRAINT `oplata_ibfk_1` FOREIGN KEY (`id_gostevoy_schet`) REFERENCES `gostevoy_schet` (`id_gostevoy_schet`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `postoyaniy_klient`
--
ALTER TABLE `postoyaniy_klient`
  ADD CONSTRAINT `postoyaniy_klient_ibfk_1` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurant` (`id_restaurant`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `stolik`
--
ALTER TABLE `stolik`
  ADD CONSTRAINT `stolik_ibfk_1` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurant` (`id_restaurant`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Zakaz_spisok`
--
ALTER TABLE `Zakaz_spisok`
  ADD CONSTRAINT `zakaz_spisok_ibfk_1` FOREIGN KEY (`id_gostevoy_schet`) REFERENCES `gostevoy_schet` (`id_gostevoy_schet`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `zakaz_spisok_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
