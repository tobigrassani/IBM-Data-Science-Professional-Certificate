-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql:3306
-- Tiempo de generación: 30-06-2023 a las 23:53:34
-- Versión del servidor: 8.0.22
-- Versión de PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `HR`
--
CREATE DATABASE IF NOT EXISTS `HR` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `HR`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DEPARTMENTS`
--

CREATE TABLE `DEPARTMENTS` (
  `DEPT_ID_DEP` char(9) NOT NULL,
  `DEP_NAME` varchar(15) DEFAULT NULL,
  `MANAGER_ID` char(9) DEFAULT NULL,
  `LOC_ID` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `DEPARTMENTS`
--

INSERT INTO `DEPARTMENTS` (`DEPT_ID_DEP`, `DEP_NAME`, `MANAGER_ID`, `LOC_ID`) VALUES
('2', 'Architect Group', '30001', 'L0001'),
('5', 'Software Group', '30002', 'L0002'),
('7', 'Design Team', '30003', 'L0003');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EMPLOYEES`
--

CREATE TABLE `EMPLOYEES` (
  `EMP_ID` char(9) NOT NULL,
  `F_NAME` varchar(15) NOT NULL,
  `L_NAME` varchar(15) NOT NULL,
  `SSN` char(9) DEFAULT NULL,
  `B_DATE` date DEFAULT NULL,
  `SEX` char(1) DEFAULT NULL,
  `ADDRESS` varchar(30) DEFAULT NULL,
  `JOB_ID` char(9) DEFAULT NULL,
  `SALARY` decimal(10,2) DEFAULT NULL,
  `MANAGER_ID` char(9) DEFAULT NULL,
  `DEP_ID` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `EMPLOYEES`
--

INSERT INTO `EMPLOYEES` (`EMP_ID`, `F_NAME`, `L_NAME`, `SSN`, `B_DATE`, `SEX`, `ADDRESS`, `JOB_ID`, `SALARY`, `MANAGER_ID`, `DEP_ID`) VALUES
('E1001', 'John', 'Thomas', '123456', '1976-09-01', 'M', '5631 Rice, OakPark,IL', '100', '100000.00', '30001', '2'),
('E1002', 'Alice', 'James', '123457', '1972-07-31', 'F', '980 Berry ln, Elgin,IL', '200', '80000.00', '30002', '5'),
('E1003', 'Steve', 'Wells', '123458', '1980-10-08', 'M', '291 Springs, Gary,IL', '300', '50000.00', '30002', '5'),
('E1004', 'Santosh', 'Kumar', '123459', '1985-07-20', 'M', '511 Aurora Av, Aurora,IL', '400', '60000.00', '30004', '5'),
('E1005', 'Ahmed', 'Hussain', '123410', '1981-04-01', 'M', '216 Oak Tree, Geneva,IL', '500', '70000.00', '30001', '2'),
('E1006', 'Nancy', 'Allen', '123411', '1978-06-02', 'F', '111 Green Pl, Elgin,IL', '600', '90000.00', '30001', '2'),
('E1007', 'Mary', 'Thomas', '123412', '1975-05-05', 'F', '100 Rose Pl, Gary,IL', '650', '65000.00', '30003', '7'),
('E1008', 'Bharath', 'Gupta', '123413', '1985-06-05', 'M', '145 Berry Ln, Naperville,IL', '660', '65000.00', '30003', '7'),
('E1009', 'Andrea', 'Jones', '123414', '1990-09-07', 'F', '120 Fall Creek, Gary,IL', '234', '70000.00', '30003', '7'),
('E1010', 'Ann', 'Jacob', '123415', '1982-03-30', 'F', '111 Britany Springs,Elgin,IL', '220', '70000.00', '30004', '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `JOBS`
--

CREATE TABLE `JOBS` (
  `JOB_IDENT` char(9) NOT NULL,
  `JOB_TITLE` varchar(30) DEFAULT NULL,
  `MIN_SALARY` decimal(10,2) DEFAULT NULL,
  `MAX_SALARY` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `JOBS`
--

INSERT INTO `JOBS` (`JOB_IDENT`, `JOB_TITLE`, `MIN_SALARY`, `MAX_SALARY`) VALUES
('100', 'Sr. Architect', '60000.00', '100000.00'),
('200', 'Sr.Software Developer', '60000.00', '80000.00'),
('220', 'Sr. Designer', '70000.00', '90000.00'),
('234', 'Sr. Designer', '70000.00', '90000.00'),
('300', 'Jr.Software Developer', '40000.00', '60000.00'),
('400', 'Jr.Software Developer', '40000.00', '60000.00'),
('500', 'Jr. Architect', '50000.00', '70000.00'),
('600', 'Lead Architect', '70000.00', '100000.00'),
('650', 'Jr. Designer', '60000.00', '70000.00'),
('660', 'Jr. Designer', '60000.00', '70000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `JOB_HISTORY`
--

CREATE TABLE `JOB_HISTORY` (
  `EMPL_ID` char(9) NOT NULL,
  `START_DATE` date DEFAULT NULL,
  `JOBS_ID` char(9) NOT NULL,
  `DEPT_ID` char(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `JOB_HISTORY`
--

INSERT INTO `JOB_HISTORY` (`EMPL_ID`, `START_DATE`, `JOBS_ID`, `DEPT_ID`) VALUES
('E1001', '2000-01-08', '100', '2'),
('E1002', '2001-01-08', '200', '5'),
('E1003', '2001-08-16', '300', '5'),
('E1004', '2001-08-16', '400', '5'),
('E1005', '2000-05-30', '500', '2'),
('E1006', '2001-08-16', '600', '2'),
('E1007', '2002-05-30', '650', '7'),
('E1008', '2010-06-05', '660', '7'),
('E1009', '2016-08-16', '234', '7'),
('E1010', '2016-08-16', '220', '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LOCATIONS`
--

CREATE TABLE `LOCATIONS` (
  `LOCT_ID` char(9) NOT NULL,
  `DEP_ID_LOC` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `LOCATIONS`
--

INSERT INTO `LOCATIONS` (`LOCT_ID`, `DEP_ID_LOC`) VALUES
('L0001', '2'),
('L0002', '5'),
('L0003', '7');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `DEPARTMENTS`
--
ALTER TABLE `DEPARTMENTS`
  ADD PRIMARY KEY (`DEPT_ID_DEP`);

--
-- Indices de la tabla `EMPLOYEES`
--
ALTER TABLE `EMPLOYEES`
  ADD PRIMARY KEY (`EMP_ID`);

--
-- Indices de la tabla `JOBS`
--
ALTER TABLE `JOBS`
  ADD PRIMARY KEY (`JOB_IDENT`);

--
-- Indices de la tabla `JOB_HISTORY`
--
ALTER TABLE `JOB_HISTORY`
  ADD PRIMARY KEY (`EMPL_ID`,`JOBS_ID`);

--
-- Indices de la tabla `LOCATIONS`
--
ALTER TABLE `LOCATIONS`
  ADD PRIMARY KEY (`LOCT_ID`,`DEP_ID_LOC`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
