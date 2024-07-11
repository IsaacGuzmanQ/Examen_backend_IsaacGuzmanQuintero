
--
-- Base de datos: `laravel`
--

create database laravel;
use laravel;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('aZAju1OyFlaDzcy45lYmA7WvI6inAd99Sg1qqS9o', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWpsUm5uamtQZVBZektVckg0R0hmZFF4YkdscjZuMWRLU080R3VWMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9Vc3VhcmlvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1720595409);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
  
  
  
CREATE TABLE usuarios (
  ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Name text not null,
  Email VARCHAR(255) not null,
  Password text not null
);

CREATE TABLE informacion_usuario(
  IDInformacion INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  Direccion text,
  Telefono VARCHAR(20),
  FechaNacimiento date not null,
  Fk_Usuario int,
  FOREIGN KEY (Fk_Usuario) REFERENCES usuarios(ID)
);

INSERT into Usuarios (name, email, password) VALUES 
('JUAN LUIS AVILA OLIVARES','javila@correo.com','$2a$04$Hm9JZWBpzCKd8HZM5SS9deU.ajx.kugfd/cCZu.254tR9XlVflowi'),
('LUIS MANUEL MOHAMED FERREIRO','lmohamed@correo.com','$2a$04$y4m698VCSmKHxIpCPujnvuJuZzpqBC71v/GNjykJ8XS2tT8qYPTb2'),
('ANTONIO MANUEL CABELLO SOLA','acabello@correo.com','$2a$04$x6k73hY1uV9BJ3mAZM2u2eAm2DPLLlAt2cr2yMuZ2wajoCGHOFHX.'),
('JESSICA VELEZ ALVAREZ','jvelez@correo.com','$2a$04$ta5Zc38i4Z5N7O1wyCW1LerpPtIKToERyI7Lzf3qf5ecSN0ALB7T2'),
('NADIA MARTI BARRIOS','nmarti@correo.com','$2a$04$bkmyORx.ZQA6vBYHtnG/F.x.Ce6RVqKMJ8SA3yikcAYfq9gd5J8l6'),
('ANA MARIA IGLESIAS MILLAN','aiglesias@correo.com','$2a$04$sbRyaIwECYGewwQvHYlyfOoCTyCIKltF9g9Quv04ZcVffz6qRXnBS'),
('DAMIAN MORAN OLIVA','dmoran@correo.com','$2a$04$d1/Wj4MDzsIJpDQyocAaBOczOClN0P5DSJugHD6aCS2jg12C2t9S.'),
('JUAN ANTONIO HUERTA SALAZAR','jhuerta@correo.com','$2a$04$Z8ejB7ZSvrFLlJ9OB.EPtOyCjmPi3fn5WVSd7HV0Xddy7eVkwaRcS'),
('AHMED ESCRIBANO RUANO','aescribano@correo.com','$2a$04$mWP5b8epj5yDw0HW.GzmMeE9y8ocA4DlzazTVcWPEK/b7TzPKK4iW'),
('PIEDAD REYES SOLIS','preyes@correo.com','$2a$04$Qa9nB5kr1z3buh4TpkrX6.0bWooTeoJ6RSvoMaALv.ETinkryPg/a'),
('VALERIA ESTEVE MATEO','vesteve@correo.com','$2a$04$87nyc0RuHBUt3.eSLE7QL.WdjAphxH4A0kOqBtQ5AULh4wJkMWRIS'),
('NEUS MATEOS ROBLES','nmateos@correo.com','$2a$04$VWIqRCYNmFJ.KKY7.PoDb.88kSF2c033MbadVaWIAspzgXtRSkGfq'),
('JULIAN BLAZQUEZ MENA','jblazquez@correo.com','$2a$04$TD4j6JqeMjsodhy5sne1BOxSXH6SQ8W24ctJ0BdTOcmpZYErJ1uDK'),
('MARIA MONTSERRAT VERGARA SANZ','mvergara@correo.com','$2a$04$KBFimhkdfQKFzaY/bXgr9O9RJ2a16A8BIzWWpe1QFivt5M4QgrmPe'),
('MARIA PENA ALCARAZ','mpena@correo.com','$2a$04$WADBsEIaQZs4V88X7oNbvuytYlt3wXKmnBD2ZT3iWaa24KyQUGWS6'),
('IZAN SOTO MARTIN','isoto@correo.com','$2a$04$.HVDY9e/07tD05dmi8Wv0.US/b5QfDnDEA6MTKv2SRnSDhxe88ffK'),
('CARLOS ALBERTO GRAU CATALAN','cgrau@correo.com','$2a$04$lObklzXZZlK.P9TCBpl1UOK1t/LnueqaHnzcPWMooVVAUIW6MyRh2'),
('CELIA POZO HERAS','cpozo@correo.com','$2a$04$PxXA7kVKmdwMpR4StYyAeucIoSYbOGXA3pyvTeaQ638VxV1dyRMze'),
('JOAQUIN GRAU MOLINA','jgrau@correo.com','$2a$04$MMfOQokax9pI95Oikxtg6O.fesSzL0E1k/JLvSy518hwsuUGxWgfK'),
('FAUSTINO PARDO PARDO','fpardo@correo.com','$2a$04$1rFAKlA0JZpMZFOOKBxvGe9RmP12XkLJasjfAwsOuwe5Rjx4rmhvu'),
('MARIA JULIA PASTOR PORTILLO','mpastor@correo.com','$2a$04$Uen.KCfubsvMXUb76u/IbeO5e3Hl3lBYpvRwZMWEeCddgDhZvz/Py'),
('RAFAELA GRAU PASCUAL','rgrau@correo.com','$2a$04$d6MppERP0HTO64GzulfQcu48/QH/NqQULk3eIiq4Rm9ZMdx1Vw2Zy'),
('LYDIA MIGUEL OLIVER','lmiguel@correo.com','$2a$04$8IBZ8601JDCkwYGYv7mZPuDYDZIj0O4sE5J1VnO/wvlEuAxZciyP2'),
('ABRAHAM OLIVARES HEREDIA','aolivares@correo.com','$2a$04$BPneylBnfGzzSXTgjzjnoOMX0MniHRr2IuI/ZXJOSSAjGNmOwj7Yq'),
('INMACULADA DE LA CRUZ GIMENEZ','ide la cruz@correo.com','$2a$04$e9EeWVkhIAVNgMSb6dMel.n6s/2hTncodIiFWyqPRMbeySAF7D8.6'),
('GORKA CHACON SOLE','gchacon@correo.com','$2a$04$ZrF3Y.7aVdTGDW4gcmtMd.7DtIKC.nsvJkNWURr8g0HbWeF/8LRk6'),
('TOMASA FRANCO CONTRERAS','tfranco@correo.com','$2a$04$EmecbnNno.bW4BheVo.p3.i5QcwcBsUjkSO2hx4RM9dBnzPSrFA8.'),
('MARIA ROSARIO GALLEGO CRIADO','mgallego@correo.com','$2a$04$XoI6vz6SAJAIZ45.o2/VnOlVZyLfOeBir1dIeo/sLUx2hWzMkK0mu'),
('PEDRO LUIS OCAÃ‘A CABRERA','pocaã‘a@correo.com','$2a$04$.J2b9JjLB4WJdXieBxYZkuiLYh/vH9liJGTPqcYYVuA1RsSYzwffC'),
('JOSE MARIA BARREIRO OLIVA','jbarreiro@correo.com','$2a$04$hlJPINV8X.RYRDM/dC/Kvu48vtlnsPn9RlbP77ZBYwMPN.4vD7Dvi'),
('ELSA FERRER BERMUDEZ','eferrer@correo.com','$2a$04$5eBgtZ0vyCq3DI4rJolhJOdNT/GSQS9myu7rg./qojtIPrYKRljk2'),
('MARIA BELEN OCHOA FRAILE','mochoa@correo.com','$2a$04$98J9AIYUcDeSKisrwIKHF.gt/TViLhnY5YtbAgW6bP5e2RK1Ai8K2'),
('ABEL GONZALEZ CARDENAS','agonzalez@correo.com','$2a$04$h5AJcTn089mzrGuIJEVSJOsCOKXW9U6Jqsu8a2jxPp19MRUh0oWfC'),
('MARIA DOLORES MARTIN LLAMAS','mmartin@correo.com','$2a$04$Mp5Ww781yKNBr04UZHYDOe0gh1Q1PRAgTWRf/f/1pZYCbX6yFIbm2'),
('ALEX PASCUAL VILLALBA','apascual@correo.com','$2a$04$UN1DzK6no2VN3h953r1VSejF3CHSq5fvPNiA4noCEHi5fHizSuwZC'),
('FERMIN CASTELLANO RIVERA','fcastellano@correo.com','$2a$04$5W7wSOszx.WzvKWZexdhKuH1q/69BZiLGHJ.oT1RLT.Hp8qMvHDdq'),
('MANUEL ANTONIO GIL PINTO','mgil@correo.com','$2a$04$L7anlRl83QyyHzVRtr0iXeHTMO90l3vMtfaK8C5fjrK38Vwzt2B4a'),
('MIRIAN VAQUERO ESCOBAR','mvaquero@correo.com','$2a$04$mgXJVq9i3cYrGVRKrusmB.6TwPT6ckkWnxH.5DTmnrkJ0bnsmi8Du'),
('PERE PIÃ‘EIRO CASTELLANOS','ppiã‘eiro@correo.com','$2a$04$szs9z4TSinfZASU7TO9rCOaPSuG54y9BoulSsztMwA7qxLLJt2W8.'),
('CARLES ESTRADA WANG','cestrada@correo.com','$2a$04$L4uDS4tvBpqqAsn4dkXPnO3LILu1RjiYdzARt6ddjRv3EIAqmEna6'),
('ESTEBAN BARTOLOME CLEMENTE','ebartolome@correo.com','$2a$04$LhEg2yeYQFCZsUBvyujb8u4TmNhE9QedZbMnzilERmomTgOblHv.S'),
('GUADALUPE MONTOYA DEL RIO','gmontoya@correo.com','$2a$04$29a34THXkjdYUb00p5ens.AOoxG3WF/uKFphNOpudHBAZKB0VojTe'),
('JOSE MANUEL DEL VALLE CAMPOS','jdel valle@correo.com','$2a$04$r8aEcnu.Uj8nMIgutKfw9eG.mN7UwJrHiUi6TT02ui6JqS/Ok4peu'),
('JOSEFA SALGADO ANDREU','jsalgado@correo.com','$2a$04$LX70wnyyRg5OA/hl.mUc4uoe0sEUZza58A4YnNGF7Eo2.HSBi7Hvq'),
('JENNIFER FERRERO LORENZO','jferrero@correo.com','$2a$04$Uj3G9qA1zLBi.zft91RIfuJOyUj0hP1pFsDRXDWX1Rvqi85N3WTkG'),
('MARIA VICTORIA OLIVARES AYALA','molivares@correo.com','$2a$04$v1QMvqYwzXWM7boTo6OJh.LQzhjFQFyC28E/UmrsoDFuI3Iwg1OeS'),
('XAVIER GUERRA SANTAMARIA','xguerra@correo.com','$2a$04$3S4vhqGIOySpkmqWlJNAteR7nXmq7XtKQpct2ZqDgb3nMA.ilxE0e'),
('MARIA LOURDES GIMENEZ MEJIAS','mgimenez@correo.com','$2a$04$w4Ic3oAWoS9rYsrQT9R9QOwLG1FdjTtSJVozoWyJM2w6n5QhFLx8i'),
('ADELAIDA TIRADO PAZ','atirado@correo.com','$2a$04$mp6OrQFEcVnLGH61j6DfHer1uk0HP4y6iapqJOgb.5DGRfofj082S'),
('ESPERANZA ROBLES PALMA','erobles@correo.com','$2a$04$P2xhOfJVhXAvZB5ZvQJA0uuihKw65egQKap8CvC6tz9DisIGqGbLu'),
('EMILIANO ROJO SANTANA','erojo@correo.com','$2a$04$j/03fyH8vxCFLcmyP6s8c.haS4nvLA7bQlOKwBGii2B5sP5Hpfrvm'),
('VIOLETA DE MIGUEL ZAPATA','vde miguel@correo.com','$2a$04$XJ0dcsNXPeWWJMr2KMmtb.4DJV9qO.HnzJYLUD35434h6/eaMVBiy'),
('ANTONIO MANUEL MURILLO ARAUJO','amurillo@correo.com','$2a$04$/aAyuoWAN1cnd12dVETR3uNDqsOLEgWGhLzK4hmswQJwggQT6KEgK'),
('GERARD PORRAS SOLER','gporras@correo.com','$2a$04$yh2mzlWiklokvtmO4idZvuBqljgdJK2WzGlftMsT2uM.ZR8urbBm6'),
('JOSE FERNANDO BARRAGAN LOSADA','jbarragan@correo.com','$2a$04$KHxTySnHwe3RW18zwmUgRe9wwj8Rh6xs28StXryolvVpQ/z6m.rae'),
('ANNA VALERO SANTIAGO','avalero@correo.com','$2a$04$MH3D53nqWkpEnCrgYpyOhe1lncBEFCSgRFwF38qOkpQIS34mVcoDO'),
('VERONICA DEL POZO COSTA','vdel pozo@correo.com','$2a$04$WVw3SY2BCBfamiJxxYSx4ONDta9GQ1qxBe.niYjjp/rSngrJyiLcK'),
('CRISTINA DURAN SIERRA','cduran@correo.com','$2a$04$5mftCPcPlJ24Aoi7ed1pKOTbgNaBSsswa9mcSNqbAQhPcWSGyp6ze'),
('CANDELARIA REQUENA DE MIGUEL','crequena@correo.com','$2a$04$T93nN6U1xZXky3q7fgYqnOvWj5Di.UPq.8xiKKgh5Bq.8TeSp62na'),
('OSCAR MARTI MARTINEZ','omarti@correo.com','$2a$04$ZudJWqW/yRlAtTN5rIGOneu6K8qeH0zKqB0/SiXQNDPWcpVtGRxT2'),
('JAIRO GRAU VALENZUELA','jgrau@correo.com','$2a$04$yslDJ3y7x5POV/6wgX2hheBf6kTXb/K4B2vj8dq2dNZank/s1n9PW'),
('DESIREE MUÃ‘OZ PONCE','dmuã‘oz@correo.com','$2a$04$vYd/fFsu5ZukcqlgE1ILOOLWwvjfcMdVYCnRHk6GRWPGiIedCKyIK'),
('CRISTINA SOLANO SOLANO','csolano@correo.com','$2a$04$J3jrZprZu2y3BwIFctqTy.Hu1BNMtr2zJ6W/tvUdSAGWFJx84HnmO'),
('LOURDES CUESTA VELAZQUEZ','lcuesta@correo.com','$2a$04$5NdEvPOsiM12TuBUW4Gq2uAo.rT0Hf5Y4YJ/en6gR2S3.RmanblhW'),
('JOSEP MARIA DORADO MARQUEZ','jdorado@correo.com','$2a$04$JHW7ruWtyHotrZWrvkTvcO52rRYulcJNY5pL2ltz7/b701CvKegb2'),
('EUGENIA GUERRA SEGURA','eguerra@correo.com','$2a$04$h/Jpx4AZv2RuPIfqmRmMsOJl490SGsSquAaz5jcok409PtenCTYwu'),
('ANGELES SIMON DIEZ','asimon@correo.com','$2a$04$8RnIge3FW5RkIKl.BxHw0OSBfKISE/4P4n1s9DhBKxIhKTEVMhM0W'),
('JUDIT PINTO PELAEZ','jpinto@correo.com','$2a$04$ao9YZHSimoHoHdsgEt3lDe/CVjr574tnPJiMVdYeUPX/D08RgAtey'),
('TAMARA ROYO CAMACHO','troyo@correo.com','$2a$04$/7GVJXtdt.aW/MliS/TIPuNo6JQsYYS2YnTA17KQr98s4B6lbBUCm'),
('PASCUAL MORAN EXPOSITO','pmoran@correo.com','$2a$04$21SFSYYqiRh5YoSh4Uu0HOsejm0sn3h9sN1zPQj6RQi0wjzeLsG8K'),
('MIRIAM RIOS ROS','mrios@correo.com','$2a$04$rHhjiQ6shUnO04GJ/YZhT.CJnDB7ko2Pj.KkNaeYZhGEV/GaSU2AC'),
('ELIZABETH JORGE SINGH','ejorge@correo.com','$2a$04$7z1kpZFqjeuNh/zyIeN7W.Pa9k5ycHNqBEQlCi8lBgIwoo7e7HKUy'),
('ABRIL HURTADO ESTEVE','ahurtado@correo.com','$2a$04$17r1saBXaLLjhTML6m/yM.NssRCGMSbBJ7k.nv4I69zyxFNfD6Dv2'),
('SUSANA NARANJO VIDAL','snaranjo@correo.com','$2a$04$ePUe2UanWg.Jsu0XGX8QUOE59ipE29jQc3sm/MEnfiCGg7D5SAOn2'),
('ISABEL VERA ESPINOSA','ivera@correo.com','$2a$04$RRGyMOQOX4KzbK1NUvKGMuhltprW/Kfub5ZSxaZLHTlFUPuJGTADi'),
('LETICIA ARIZA MERINO','lariza@correo.com','$2a$04$39BNgmeh5WfRQGhoVqRmyuA9x.Idx6GwEByD5b.GRM3BJtgDQn8f2'),
('MARIA ELENA ESPINOSA OLIVARES','mespinosa@correo.com','$2a$04$kS1EXFozgNgcY/le167SDOimqD2jtxBhqV.TKSkLZeqJLRvFPqYqe'),
('ALEXANDRA CEREZO TORRES','acerezo@correo.com','$2a$04$lAiiMZ7I5zzTqGpZN9s1rureBf/HUKJnfBAGU08J//bNk5liehSYC'),
('SARA RIOS DE LA ROSA','srios@correo.com','$2a$04$QI8CoueSnGp1VLEF7htF.eK1x7lNDYbr5lJohcDsaWlAAJrTHVMx2'),
('MARIA ISABEL JURADO CRUZ','mjurado@correo.com','$2a$04$JyAFROpjKc.EpVKAGuSsuOdD8.dTWkqVjFKrTosVC4yBjAzJXSMCO'),
('AMAIA REBOLLO SANCHIS','arebollo@correo.com','$2a$04$AQw/dS1TJesxyJ94Yoi8re0NgDhX564oubCwMlP5nauJNdM0j8UAS'),
('OLIVIA MENDOZA SOSA','omendoza@correo.com','$2a$04$EHCz9omMnbyuD8W2MwKKZOVeaHWD3CelObc1UEGCm6nACJKhwLANi'),
('JOSE MIGUEL ESPEJO PLAZA','jespejo@correo.com','$2a$04$MFjpJaa9fyl8cSYwe1vTIOj8Gsczb4xU1fcqT02FAlPRBu.5sXOT2'),
('BRUNO MONTERO AVILA','bmontero@correo.com','$2a$04$hTR8f7VeVo87ih3jovzf4uG9q1ZSTtDBBT5VkDVcIrOLLNYpb2gjy'),
('VALERIA MONTOYA MARTIN','vmontoya@correo.com','$2a$04$yCIxl1gFozoR9dw2fx.nNuWg/.DMfLD15k9Hp8vsWvWZNq97TyeNi'),
('CRISTINA PUJOL MORAL','cpujol@correo.com','$2a$04$r4L3mtszETMbdAMOkGYNgeB/e/Jfmrr21rrk1vPguKOqVZ1iWY6bq'),
('ARANZAZU GUTIERREZ ORTIZ','agutierrez@correo.com','$2a$04$9UisIvC.p65a5Vso4Q1gAOGVdNHGQatgTfeJ2CILVRIYnHGFctMFS'),
('TANIA LLORENS MONTES','tllorens@correo.com','$2a$04$QqRvOi8oGauZF8b8lO40t.ZEYDa2zlkcsR62ont6CVOuk2LY3FqIG'),
('JUAN JOSE REYES AVILA','jreyes@correo.com','$2a$04$l2qG8.UTRGm3AXxDr2efiejxiSS3R4J4NIJVGK8vK1.qKQ.ygcxu2'),
('AMADOR RODRIGO AGUIRRE','arodrigo@correo.com','$2a$04$ICpub7QsBQvM1kSYvDCZl.Cpsi1fudUYuhrMKSbacdTL1cLqrpO5.'),
('JUAN PEDRO ROLDAN BARBERO','jroldan@correo.com','$2a$04$JzAHuNU8muD//dOVVyisNewNiPEydsr2c0rW/fLaZwIH8uUq.LQgO'),
('PILAR DE LA FUENTE CALVO','pde la fuente@correo.com','$2a$04$Ya1r86Buv0MocpiDq7zJiuBaFvyjsDekCbTVSZRuCT4VSruT45I7u'),
('PASCUAL SOLE VAZQUEZ','psole@correo.com','$2a$04$47ep9Zv.CZE.wgR6a7VCg.WqyFl3YlOEgs14q.3pVygBoYi9nBOju'),
('SARA JUAN PARRA','sjuan@correo.com','$2a$04$KM8XNYxmPjxYRLcG9GzDo.rlq9phbpU0MwBxpyaqWfri4EAGx.5vW'),
('ASCENSION SAINZ ALCAIDE','asainz@correo.com','$2a$04$OD8PgwV0I5qgzUzNgeYgjefFBSSUYmQAAgPmCmq3m82etMwJJ5.ra'),
('ALEXANDRA ROSALES LOSADA','arosales@correo.com','$2a$04$mHKURVgFGAzpCzpirRN6UuQ3UaBX3FI/eCwCX/m/pFgLH.P1qy.Ue'),
('LUIS ANTONIO JURADO ESTRADA','ljurado@correo.com','$2a$04$PPWhzTshcEgReC1gz5qnVeFBFeFoD2vbRxVHl9AiVTXbh9H4UW4NK'),
('RAUL ESTEVE LEON','resteve@correo.com','$2a$04$xtziTePhzHM/I6dNobWn1.xQnPlaKLQ.94LYdtgobOxcHwCu.oBTe'),
('ABRIL CACERES CARRASCO','acaceres@correo.com','$2a$04$cVvE8zt.0KmSpxPRebCAxOYbvg9nh61S7oJrQqhH90TCAqYWtS3Oy'),
('LUCIA CUEVAS SINGH','lcuevas@correo.com','$2a$04$xHqNVLh5MsKYjJ8BcMN18e4RBkbP0Kyy6gg5f6E.kN.GYrZ9W5PJ2')
; 

INSERT into informacion_usuario (Direccion, Telefono, FechaNacimiento, Fk_Usuario) values 
('Camí Mayor #59','7625176681','1984-08-03','1'),
('Kalea Horno #35','6962871101','1956-11-05','2'),
('Placeta Iglesia #55','6579513881','1950-09-03','3'),
('Rúa Nueva #46','6335767081','1991-08-20','4'),
('Polígono Iglesia #58','7273652481','1959-03-11','5'),
('Plaça Real #45','6589264891','1950-09-02','6'),
('Placeta Catalunya #63','6587411011','1960-09-13','7'),
('Estrada Pedralbes #47','6230076401','1984-04-01','8'),
('Parque Nueva #8','7162998251','1985-10-29','9'),
('Parque Madrid #61','6971187431','1981-05-18','10'),
('Estrada Madrid #80','6837371771','1983-02-20','11'),
('Barrio Madrid #53','6276412921','1986-08-18','12'),
('Paseo Catalunya #51','6293292161','1969-11-12','13'),
('Paseo Catalunya #73','6043613481','1964-10-24','14'),
('Travessera Iglesia #13','7699955481','1984-10-16','15'),
('Ronda Madrid #15','7728794761','1971-11-10','16'),
('Pasaje Catalunya #56','7574743581','1961-08-31','17'),
('Camino Pedralbes #90','6494368821','1985-06-01','18'),
('Via Iglesia #75','7651163371','1992-02-05','19'),
('Parque Nueva #67','6154063821','1974-04-31','20'),
('Campo Iglesia #85','6251935681','1992-04-19','21'),
('Passeig Iglesia #22','7630801241','1989-04-06','22'),
('Rambla Iglesia #13','6587208621','1984-10-23','23'),
('Poblado Mayor #38','7695865821','1994-02-24','24'),
('Rúa Real #53','6092214221','1986-11-21','25'),
('Camí Catalunya #10','6344560721','1985-03-06','26'),
('Placeta Horno #11','6417828841','1967-08-08','27'),
('Via Iglesia #81','6200469481','1966-07-16','28'),
('Plaza Catalunya #73','6414801221','1952-12-11','29'),
('Sector Real #50','7748141931','1976-06-22','30'),
('Camí Pedralbes #73','7297279421','1996-09-30','31'),
('Rambla de España #90','7372234531','1983-10-06','32'),
('Bulevar Nueva #38','7957553111','1997-11-29','33'),
('Calle Horno #12','7097262111','1980-02-01','34'),
('Avinguda de España #93','6863546251','1977-01-09','35'),
('Campo Mayor #34','6778439341','1952-03-16','36'),
('Carrer Iglesia #9','7388067251','1961-11-10','37'),
('Plazuela Madrid #5','6513260181','1979-02-21','38'),
('Travesía Madrid #96','6385462531','1981-11-12','39'),
('Pasaje Madrid #63','7353251541','1958-04-02','40'),
('Enparantza Mayor #50','6567309931','1988-11-30','41'),
('Barrio de España #63','6681229661','1988-01-21','42'),
('Polígono Pedralbes #68','6671929101','1958-02-21','43'),
('Travessera Iglesia #67','7014291571','1995-09-12','44'),
('Edificio Horno #15','6324245871','1987-11-13','45'),
('Carretera Iglesia #38','6359711411','1978-03-03','46'),
('Parque Catalunya #35','7298470641','1970-04-21','47'),
('Enparantza Madrid #31','7318610291','1967-07-14','48'),
('Carrera Real #68','6255454691','1987-03-12','49'),
('Calleja de España #14','7547109511','1983-06-04','50'),
('Edificio Mayor #9','7613619331','1998-11-12','51'),
('Avenida Catalunya #9','6754029881','1966-01-19','52'),
('Ronda Iglesia #51','6834771581','1958-07-05','53'),
('Edificio Pedralbes #45','6498626931','1959-05-12','54'),
('Poblado de España #78','7571217741','1994-07-04','55'),
('Placeta Madrid #67','6059612521','1958-06-04','56'),
('Plazuela Mayor #12','6930148491','1953-10-04','57'),
('Jardins de España #69','6392111061','1964-03-12','58'),
('Alameda Iglesia #4','6941132381','1978-06-02','59'),
('Passeig Nueva #9','6647298051','1985-08-05','60'),
('Parque Iglesia #82','7515027241','1995-08-28','61'),
('Enparantza Mayor #93','6681535151','1954-04-22','62'),
('Camí Catalunya #79','6801306731','1952-12-12','63'),
('Calle Madrid #9','7267434591','2002-01-03','64'),
('Poblado Nueva #18','7398245441','1983-09-11','65'),
('Carrera Madrid #80','6692424451','1959-03-29','66'),
('Polígono de España #86','6597492321','1979-05-21','67'),
('Barrio Catalunya #7','6727795971','1964-07-24','68'),
('Via Nueva #10','7643678341','1957-07-10','69'),
('Poblado Mayor #34','6114135011','1969-11-14','70'),
('Polígono Madrid #27','6501937721','1951-09-03','71'),
('Cuesta de España #0','7624411361','1951-07-12','72'),
('Cuesta Iglesia #64','7096035021','1993-03-12','73'),
('Travessera de España #22','7905872951','1993-02-14','74'),
('Camino Pedralbes #23','7594253951','1997-08-01','75'),
('Glorieta Madrid #67','6102880161','1950-01-07','76'),
('Camí Real #11','7161756471','1996-03-16','77'),
('Enparantza Nueva #48','7141398461','1962-02-07','78'),
('Kalea Iglesia #17','7096753951','1993-05-21','79'),
('Urbanización Iglesia #80','6887609051','1950-01-09','80'),
('Avinguda Real #98','6171976421','2001-02-10','81'),
('Calleja de España #71','7195194301','1994-07-10','82'),
('Rambla Iglesia #22','7176864731','1957-12-05','83'),
('Urbanización Catalunya #99','7426309991','1956-11-18','84'),
('Paseo Catalunya #67','7160155261','1980-05-03','85'),
('Passeig Iglesia #75','7804316061','1957-09-26','86'),
('Carrer Catalunya #43','6309293921','1987-06-01','87'),
('Plazuela Iglesia #20','7526864751','1987-02-11','88'),
('Edificio Madrid #86','7379612101','2000-05-04','89'),
('Jardines Real #97','6323535781','1957-02-05','90'),
('Polígono Iglesia #66','6750050731','1986-11-18','91'),
('Passatge Real #50','6409527621','1976-02-15','92'),
('Carretera Horno #45','7840192571','1958-08-07','93'),
('Plaça Madrid #81','6612395171','1988-02-11','94'),
('Travesía Pedralbes #60','6613233041','1965-06-27','95'),
('Praza de España #67','6445076131','1951-12-28','96'),
('Ronda Madrid #56','7684810841','1981-01-08','97'),
('Travesía Iglesia #79','6762569141','1959-02-20','98'),
('Parque Mayor #62','7569985121','1952-01-11','99'),
('Rúa Nueva #42','6495928991','2000-09-14','100');



