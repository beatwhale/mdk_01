-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Дек 16 2022 г., 14:16
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
-- База данных: `sto`
--

-- --------------------------------------------------------

--
-- Структура таблицы `car`
--

CREATE TABLE `car` (
  `gos_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `car_brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `car_year` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `car_client_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `car_client_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `car`
--

INSERT INTO `car` (`gos_number`, `car_brand`, `car_year`, `car_client_name`, `car_client_phone`) VALUES
('850 МСТ 65', 'Honda CR-V', '2007', 'Туров Алексей Александрович', '7(924)123-34-50'),
('608 АЕО 31', 'Toyota Corolla', '2004', 'Алексеев Гавриил Всеволодович', '7(914)564-66-27'),
('456 АНА 63', 'Mitsubishi ASX', '2017', 'Соколов Игорь Лукьевич', '7(914)513-16-24'),
('148 АЕА 75', 'Subaru Forester', '2019', 'Зимин Эльдар Парфеньевич', '7(924)192-08-94'),
('619 РТВ 23', 'Mazda 2', '2002', 'Тетерина Луиза Матвеевна', '7(914)747-18-39');

-- --------------------------------------------------------

--
-- Структура таблицы `mechanic`
--

CREATE TABLE `mechanic` (
  `tabel_number` varchar(10) NOT NULL,
  `mechanic_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mechanic_lvl` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `mechanic`
--

INSERT INTO `mechanic` (`tabel_number`, `mechanic_name`, `mechanic_lvl`) VALUES
('1000', 'Чесноков Тимофей Иванович', 11),
('1001', 'Толкачев Максим Мирославович', 13),
('1002', 'Лебедев Артур Ильич', 15);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `date_priemki` date NOT NULL,
  `tabel_number` varchar(10) NOT NULL,
  `gos_number` varchar(15) NOT NULL,
  `date_get` date NOT NULL,
  `car_trouble` text NOT NULL,
  `job_description` text NOT NULL,
  `work_time` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `date_priemki`, `tabel_number`, `gos_number`, `date_get`, `car_trouble`, `job_description`, `work_time`) VALUES
(1, '2022-12-01', '1000', '148 АЕА 75', '2022-12-02', 'Оторвался шланг бензонасоса, требуется замена. Также, клиент проверить переднее-левое колесо. По словам, оно вибрирует на высоких скоростях.', 'Трубка бензонасоса была заменена, на переднем левом колесе заменена шаровая направляющая.', 3.3),
(2, '2022-12-03', '1001', '456 АНА 63', '2022-12-07', 'Клиент приобрел контрактный двигатель с Владивостока, требуется установка.', 'Двигатель установлен, машина полностью проверена и обкатана.', 12),
(3, '2022-12-03', '1000', '608 АЕО 31', '2022-12-04', 'По словам клиента, машина перестала нормально тормозить.', 'Заменены тормозные колодки на ходовых колёсах.', 2.5),
(4, '2022-12-10', '1002', '619 РТВ 23', '2022-12-24', 'Машина после аварии. Требуется замена левого крыла, правка лонжерона, установка нового радиатора, установка новой фары.', 'Левое крыло установлено, лонжерон выправлен, новый радиатор установлен, новая фара установлена. Машина полностью на ходу.', 35),
(5, '2022-12-10', '1001', '850 МСТ 65', '2022-12-10', 'Машина практически не заводится.', 'Заменены 4 свечи зажигания.', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `car`
--
ALTER TABLE `car`
  ADD KEY `gos_number` (`gos_number`);

--
-- Индексы таблицы `mechanic`
--
ALTER TABLE `mechanic`
  ADD KEY `tabel_number` (`tabel_number`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gos_number` (`gos_number`),
  ADD KEY `tabel_number` (`tabel_number`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`gos_number`) REFERENCES `car` (`gos_number`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`tabel_number`) REFERENCES `mechanic` (`tabel_number`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
