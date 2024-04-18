
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



--
-- База данных: `notebook`
--

-- --------------------------------------------------------

--
-- Структура таблицы `notebooks`
--

CREATE TABLE `notebooks` (
  `id` int NOT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `notebook_name` varchar(100) DEFAULT NULL,
  `page_count` int DEFAULT NULL,
  `cover_type` enum('Тверда','М''яка') DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `page_layout` enum('Клітинка','Лінійка','Порожньо') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `notebook_name` varchar(255) NOT NULL,
  `number_of_pages` int NOT NULL,
  `cover_type` int NOT NULL,
  `manufacturer_country` varchar(255) NOT NULL,
  `page_layout` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Блокноти`
--

CREATE TABLE `Блокноти` (
  `ID` int NOT NULL,
  `Назва_фірми_виробника` varchar(100) DEFAULT NULL,
  `Назва_блокнота` varchar(100) DEFAULT NULL,
  `Кількість_сторінок` int DEFAULT NULL,
  `Тип_обкладинки` varchar(50) DEFAULT NULL,
  `Країна_виробник` varchar(50) DEFAULT NULL,
  `Зовнішній_вигляд_сторінки` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `notebooks`
--
ALTER TABLE `notebooks`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Блокноти`
--
ALTER TABLE `Блокноти`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `notebooks`
--
ALTER TABLE `notebooks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

