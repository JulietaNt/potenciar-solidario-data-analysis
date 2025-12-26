CREATE DATABASE GUAYERD_EDIT;
USE GUAYERD_EDIT;
-- --------------Creo tabla cuenta--------------------------------------------
CREATE TABLE ´cuenta´(
´id_cuenta´ INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
´Nro_cuenta´ VARCHAR(30),
´Tipo_cuenta´ VARCHAR(40)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
-- -----------------------Inserto valores a la tabla cuenta------------------------------
INSERT INTO ´cuenta´ (´Nro_cuenta´, ´Tipo_cuenta´)
VALUES
('404100', 'Donante'),
('403103', 'Donante'),
('405100', 'Donante'),
('501400', 'Proveedor'),
('503100', 'Proveedor'),
('506100', 'Proveedor'),
('509100', 'Proveedor'),
('516000', 'Proveedor'),
('514100', 'Proveedor'),
('502100', 'Proveedor'),
('507100', 'Proveedor');
-- --------------------------------Creo tabla razon_social----------------------------------------------------
CREATE TABLE razon_social (
Id_razon_social INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Razon_social VARCHAR(30)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
-- --------------------------------Inserto valores a la tabla razon_social----------------------------------------------
INSERT INTO razon_social (Razon_social)
VALUES
('SAS'),
('SA'),
('GOB'),
('SRL'),
('ONG'),
('COOPERATIVA');
-- -------------------------------------------Creo tabla tipo_donante---------------------------------------------------------
CREATE TABLE tipo_donante (
Id_tipo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Tipo_donante VARCHAR(30)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
-- ------------------------------------------Inserto valores a la tabla tipo_donante-----------------------------------------------
INSERT INTO tipo_donante (Tipo_donante)
VALUES
('Empresa'),
('Estado'),
('Campaña'),
('ONG'),
('Agroindustria'),
('Tecnología');
-- ---------------------------------------------Creo tabla contribuyente-------------------------------------------------
CREATE TABLE contribuyente (
Id_contribuyente  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Tipo_contribuyente VARCHAR(40)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
-- -------------------------------------Inserto valores a la tabla contribuyente-------------------------------------------------
INSERT INTO contribuyente (Tipo_contribuyente)
VALUES
('Monotributista'),
('Exento'),
('Responsable Inscripto');
-- --------------------------------------------Creo tabla estado_donante--------------------------------------------
CREATE TABLE estado_donante (
Id_estado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Estado_donante TEXT(30)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
-- -----------------------------------------------Inserto valores a la tabla estado_donante----------------------------------------
INSERT INTO estado_donante (Estado_donante)
VALUES
('ACTIVO'),
('INACTIVO');
-- ----------------------------------------Creo tabla frecuencia---------------------------------------------------------------
CREATE TABLE frecuencia (
Id_frecuencia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Frecuencia VARCHAR(30)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
-- ---------------------------------------------Inserto valores a la tabla frecuencia--------------------------------------------
INSERT INTO frecuencia (Frecuencia)
VALUES
('Mensual'),
('Bimestral'),
('Trimestral'),
('Semestral'),
('Anual');
-- ---------------------------------------------------Creo tabla categ_proveedores--------------------------------------------
CREATE TABLE categ_proveedores (
Id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Categoria VARCHAR(40)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
-- --------------------------------------------Inserto valores a la tabla categ_proveedores-------------------------------------------
INSERT INTO categ_proveedores (Categoria)
VALUES
('SERVICIOS'),
('MATERIALES'),
('AGENTE IMPOSITIVO'),
('TECNOLOGIA'),
('CONSULTORIA'),
('ENERGIA RENOVABLE'),
('TRANSPORTE'),
('CONSTRUCCION'),
('AGROINDUSTRIA'),
('SOFTWARE'),
('CONSULTORIA IT'),
('ENERGIA EOLICA'),
('ENERGIA SOLAR');
-- -------------------------------------------Creo tabla pais-----------------------------------------------------------------
CREATE TABLE pais (
Id_pais INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Pais VARCHAR(40)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
-- -------------------------------------Inserto valores a la tabla pais--------------------------------------------------------
INSERT INTO pais (Pais)
VALUES
('Argentina'),
('Uruguay'),
('Brasil'),
('Paraguay'),
('Chile'),
('Colombia'),
('Bolivia'),
('Mexico'),
('Venezuela'),
('Peru');
-- -------------------------------------------------Creo tabla ciudad------------------------------------------------------------
CREATE TABLE ciudad (
Id_ciudad INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Ciudad VARCHAR(40)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
-- ------------------------------------------Inserto valores a la tabla ciudad---------------------------------------------------
INSERT INTO ciudad (Ciudad)
VALUES
('Buenos Aires'),
('Cordoba'),
('Rosario'),
('Mendoza'),
('San Miguel de Tucumán'),
('Mar del Plata'),
('La Plata'),
('Salta'),
('Santa Fe'),
('San Juan'),
('Neuquen'),
('Rio Gallegos'),
('San Rafael'),
('Bahía Blanca'),
('Santiago del Estero'),
('Rio Cuarto'),
('San Fernando del Valle de Catamarca'),
('Villa Maria'),
('San Luis'),
('Chaco'),
('San Nicolas'),
('Lujan'),
('Jujuy'),
('Trelew'),
('San Fernando'),
('Merlo'),
('San Martín'),
('Viedma'),
('Rawson'),
('Obera'),
('Calafate'),
('Gualeguaychu'),
('Rio Grande'),
('Villa Carlos Paz'),
('Villa Allende'),
('San Pedro'),
('General Roca'),
('Junin'),
('Rafaela'),
('Posadas'),
('Resistencia'),
('Formosa');
-- ---------------------------------Creo tabla donantes---------------------------------------------------------------------
CREATE TABLE donantes (
Id_donante VARCHAR(15) NOT NULL PRIMARY KEY,
Nombre TEXT(50),
CUIT VARCHAR(20),
Correo_electronico VARCHAR(100),
Telefono VARCHAR(15),
Alta DATE,
Baja DATE,
Id_tipo INT,
Id_razon_social INT,
Id_contribuyente INT,
Id_estado INT,
Id_frecuencia INT,
Id_pais INT
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
-- ---------------------------------------------Agrego las claves foraneas para la tabla donantes-----------------------------------------
ALTER TABLE donantes
ADD CONSTRAINT fk_tipo FOREIGN KEY (Id_tipo) REFERENCES tipo_donante (Id_tipo) ON DELETE CASCADE,
ADD CONSTRAINT fk_razon_social FOREIGN KEY (Id_razon_social) REFERENCES razon_social (Id_razon_social) ON DELETE CASCADE,
ADD CONSTRAINT fk_contribuyente FOREIGN KEY (Id_contribuyente) REFERENCES contribuyente (Id_contribuyente) ON DELETE CASCADE,
ADD CONSTRAINT fk_estado FOREIGN KEY (Id_estado) REFERENCES estado_donante (Id_estado) ON DELETE CASCADE,
ADD CONSTRAINT fk_frecuencia FOREIGN KEY (Id_frecuencia) REFERENCES frecuencia (Id_frecuencia) ON DELETE CASCADE,
ADD CONSTRAINT fk_pais FOREIGN KEY (Id_pais) REFERENCES pais (Id_pais) ON DELETE CASCADE;
-- --Intente hacer la carga masiva de los datos de la tabla donantes mediante la sentencia LOAD DATA LOCAL INFILE pero me lo impidió el error 2068, apesar de modificar el archivo de configuracion y de seguir todas los pasos que nos dio nuestro mentor, no lo pude solucionar, ni tampoco pude usar el asistente de workbench por los errores de sintaxis en los datos,  por lo que tuve que hacer la carga manual--
SET GLOBAL local_infile= true;
SHOW VARIABLES LIKE 'secure_file_priv';
SHOW VARIABLES LIKE 'sql_mode';
LOAD DATA LOCAL INFILE 'C:\Users\Public\Downloads‪\TABLAS MODELO BD GUAYERD SPRINT 3 - donantes.csv'
INTO TABLE donantes
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1
LINES (Id_donante, Nombre, CUIT, Correo_electronico, Telefono, Alta, Baja, Id_tipo, Id_razon_social, Id_contribuyente, Id_estado, Id_frecuencia, Id_pais);
-- ---------------------------------- Inserto valores a la tabla donantes-----------------------------------------------------------------
INSERT INTO donantes (Id_donante, Nombre, CUIT, Correo_electronico, Telefono, Alta, Baja, Id_tipo, Id_razon_social, Id_contribuyente, Id_estado, Id_frecuencia, Id_pais)
VALUES
('D00116', 'Universidad del Sur', '29-38793456-3', 'universidadds@mail.com', '51 5550-9220',	'2018-12-23','1900-1-1',1, 2, 3, 1, 5, 10),
('D00142', 'Bebidas S.A', '34-38765566-0', 'bebidassa@mail.com', '52 1234-4324',	'2024-1-1', '2024-5-30',3, 2, 3, 2, 1, 8),
('D00127',	'Horizonte Ecológico',	'23-45678901-3',	'juan.rodriguez@horizonteecologico.com',	'52 55 1234-5678',	'2024-1-4','1900-1-1',	4,	5,	1,	1,	1,	8),
('D00138',	'Innovación Solar S.A.',	'30-99887766-7',	'julia.martinez@innovacionsolar.com',	'52 55 1234-5678',	'2024-2-2',	'1900-1-1',	3,	2,	3,	1,	1,	8),
('D00109',	'Innovatech Solutions',	'24-56588769-6',	'innovatechsolutions@mail.com',	'54 5263-2378',	'2019-8-9',	'1900-1-1',	2,	2,	2,	1,	2,	1),
('D00124',	'Soluciones VerdeVida',	'20-12345678-9',	'ana.solis@verdevida.com',	'549111234-5678',	'2024-2-1',	'1900-1-1',	4,	5,	1,	1,	1,	1),
('D00139',	'TechGreen Innovación S.R.L.',	'25-67890123-0',	'tech@techgreeninnovacion.com',	'549114567-8901',	'2024-4-1','1900-1-1',	5,	4,	3,	1,	1,	1),
('D00137',	'TecnoAvanzado S.R.L.',	'20-22334455-6',	'roberto.sanchez@tecnoavanzado.com',	'549116543-2109',	'2022-6-5',	'1900-1-1',	6,	4,	1,	1,	1,	1),
('D00140',	'EcoTransporte S.A.',	'30-33445566-7',	'fernando.lopez@ecotransporte.com',	'549118765-4321',	'2022-4-1',	'2023-12-1',	2,	2,	2,	2,	4,	1),
('D00141',	'Apoyo Social Universal',	'30-33675566-8',	'apoyosocialuniversal@example.com',	'549118765-5588',	'2021-1-1',	'2024-6-1',	2,	3,	2,	2,	3,	1),
('D00125',	'Innovación Global S.A.',	'27-23456789-1',	'carlos.martinez@innovacionglobal.com',	'55 21 9876-5432',	'2024-2-2', '1900-1-1',	1,	2,	3,	1,	1,	3),
('D00133',	'Energía Futuro S.A.',	'30-67891234-7',	'maria.lopez@energiasfuturo.com',	'55 21 9876-5432',	'2022-1-1',	'2023-12-31',	1,	2,	3,	2,	1,	3),
('D00134',	'Energía Sustentable S.A.',	'33-12345678-9',	'maria.lopez@energiasustentable.com',	'55 21 9876-5432',	'2023-1-1',	'2023-12-31',	3,	2,	3,	2,	1,	3),
('D00131',	'InnovaLogix S.A.',	'27-65432109-8',	'carla.fernandez@innovalogix.com',	'55 301 234-5678',	'2023-1-1', '1900-1-1',	3,	2,	2,	1,	2,	3),
('D00115',	'Mercado Popular',	'24-34193456-2',	'mercadopopular@example.com',	'55 5550-9219',	'2020-12-22', '1900-1-1', 	3,	1,	1,	1,	2,	3),
('D00108',	'Iniciativa Solidaria',	'24-91224120-6',	'iniciativasolidaria@mail.com',	'55 5747-7433',	'2022-10-4',	'2024-08-20',	1,	1,	1,	2,	2,	3),
('D00121',	'Ministerio de Acción Comunitaria',	'34-01712356-6',	'accióncomunitaria@mail.com',	'56 5550-9223',	'2018-01-26', '1900-1-1',	2,	3,	2,	1,	5,	5),
('D00135',	'Logística Global S.R.L.',	'20-98765432-1',	'global@logisticaglobal.com',	'56 9 7654-3210',	'2020-1-1', '1900-1-1',	3,	4,	1,	1,	2,	5),
('D00126',	'Empresas FuturoBrillante',	'30-34567890-2',	'laura.perez@futurobrillante.com',	'56 9 8765-4321',	'2024-2-3', '1900-1-1',	1,	1,	3,	1,	1,	5),
('D00132',	'VíaVerde',	'27-78434109-9',	'eco@viaverde.com',	'56 9 8765-4321',	'2021-1-2',	'2023-1-3',	3,	4,	3,	2,	1,	5),
('D00128',	'Fundación UniCorp',	'33-56789012-4',	'marta.gonzalez@unicorp.org',	'57 300 123-4567',	'2024-2-5', '1900-1-1',	4,	5,	1,	1,	1,	6),
('D00129',	'Corporación NovaTech',	'30-98765432-1',	'gerencia@novatech.com',	'57 300 123-4567',	'2023-1-1', '1900-1-1',	1,	2,	3,	1,	1,	6),
('D00136',	'AgroIndustrias del Sur',	'33-11223344-5',	'laura.garcia@agroindustrias.com',	'57 300 876-5432',	'2024-1-1', '1900-1-1',	5,	2,	3,	1,	1,	6),
('D00130',	'Servicios Plus',	'30-45765232-2',	'luis.gonzalez@ecoplus.com',	'57 301 234-5678',	'2023-1-2', '1900-1-1',	1,	1,	3,	1,	1,	6),
('D00120',	'Supermercado Vegano SRL',	'34-01712356-5',	'supermercadovegano@mail.com',	'58 5550-9222',	'2023-1-25', '1900-1-1',	1,	4,	3,	1,	2,	9),
('D00122',	'El Parque SRL',	'24-78912356-7',	'parque@mail.com',	'591 5550-9224',	'2018-1-1', '1900-1-1',	1,	4,	3,	1,	4,	7),
('D00123',	'Merendero Solidario',	'24-72582356-8',	'solidario@mail.com',	'591 5550-9225',	'2021-1-2', '1900-1-1',	4,	3,	1,	1,	1,	7),
('D00110',	'Apoyo Logistico S.A.',	'29-01265476-14',	'apoyologisticosa@mail.com',	'595 5030-0105',	'2020-5-2',	'2024-7-1',	1,	2,	3,	2,	3,	4),
('D00111',	'Futuro Corporativo',	'27-23783266-6',	'futurocorporativo@mail.com',	'595 5380-3426',	'2019-12-2', '1900-1-1',	1,	1,	1,	1,	1,	4),
('D00112',	'Global Energies S.A.',	'25-36901514-8',	'globalenergiess.a.@example.net',	'598 5503-7127',	'2019-8-13', '1900-1-1',	2,	2,	3,	1,	5,	2),
('D00117',	'Automoviles Full',	'21-38712356-4',	'afull@mail.com',	'598 5550-9221',	'2020-1-24',	'2024-2-2',	1,	2,	3,	2,	1,	2);	
-- ------------------- Creo tabla proveedores, en este caso pude cargar los valores mediante Table Data Import Wizard-----------------------
CREATE TABLE proveedores (
Id_proveedor VARCHAR(15) NOT NULL PRIMARY KEY,
Nombre VARCHAR(50),
CUIT VARCHAR(15),
Contacto VARCHAR(50),
Correo_electronico VARCHAR(100),
Telefono VARCHAR(15),
Id_categoria INT,
Id_contribuyente INT,
Id_razon_social INT,
Id_ciudad INT,
Id_pais INT 
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
-- -------------------------- Agrego las claves foraneas a la tabla proveedores-------------------------------------------
ALTER TABLE proveedores
ADD CONSTRAINT fk_categoria FOREIGN KEY (Id_categoria) REFERENCES categ_proveedores (Id_categoria) ON DELETE CASCADE,
ADD CONSTRAINT fk_contrib FOREIGN KEY (Id_contribuyente) REFERENCES contribuyente (Id_contribuyente) ON DELETE CASCADE,
ADD CONSTRAINT fk_razon_soc FOREIGN KEY (Id_razon_social) REFERENCES razon_social (Id_razon_social) ON DELETE CASCADE,
ADD CONSTRAINT fk_ciudad FOREIGN KEY (Id_ciudad) REFERENCES ciudad (Id_ciudad) ON DELETE CASCADE,
ADD CONSTRAINT fk_pa FOREIGN KEY (Id_pais) REFERENCES pais (Id_pais) ON DELETE CASCADE;
-- ----------------------------------- Creo tabla ingresos y cargo los datos usando también el asistente de workbench-------------------------
CREATE TABLE ingresos (
Id_ingreso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Id_donante VARCHAR(15),
Tipo_movimiento VARCHAR(30),
Fecha DATE,
Importe INT,
Id_cuenta INT 
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
-- ------------------------------ Agrego las claves foraneas a la tabla ingresos ------------------------------------------------------
ALTER TABLE ingresos
ADD CONSTRAINT fk_donantes FOREIGN KEY (Id_donante) REFERENCES donantes (Id_donante) ON DELETE CASCADE,
ADD CONSTRAINT fk_cuenta FOREIGN KEY (Id_cuenta) REFERENCES cuenta (Id_cuenta) ON DELETE CASCADE;
-- Al intentar establecer la fk Id_donante en la tabla ingresos me salia el error 1452, al explorar los datos note que habia registros huerfanos en la tabla ingresos que no tenian correspondencia en la tabla donantes por eso me estaba fallando la fk, por lo que elimine esos registros huerfanos y volvi a agregar la clave foranea, de esta manera pude superar el error-- 
SELECT * FROM ingresos WHERE Id_donante NOT IN (SELECT Id_donante FROM donantes);
DELETE FROM ingresos WHERE Id_donante NOT IN (SELECT Id_donante FROM donantes);
-- ------------------------- Creo la tabla egresos y cargo los datos a traves del asistente -----------------------------------------------------------------
CREATE TABLE egresos (
Id_egreso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Id_proveedor VARCHAR(15),
Tipo_movimiento VARCHAR(30),
Fecha DATE,
Importe INT,
Id_cuenta INT 
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
-- -------------------------------- Agrego las claves foraneas a la tabla egresos -------------------------------------------------
ALTER TABLE egresos
ADD CONSTRAINT fk_proveedor FOREIGN KEY (Id_proveedor) REFERENCES proveedores (Id_proveedor) ON DELETE CASCADE,
ADD CONSTRAINT fk_cuenta_egresos FOREIGN KEY (Id_cuenta) REFERENCES cuenta (Id_cuenta) ON DELETE CASCADE;
-- ----------------------- Código para practicar ALTER, DROP, SELECT Y DELETE ---------------------------------------------------
ALTER TABLE ´cuenta´
ADD Descripcion VARCHAR(50);
ALTER TABLE ´cuenta´
DROP COLUMN Descripcion;
SELECT * FROM pais;
DELETE FROM pais WHERE Id_pais= 15;
ALTER TABLE ´cuenta´
RENAME COLUMN ´id_cuenta´ TO Id_cuenta;
ALTER TABLE ´cuenta´
RENAME COLUMN ´Nro_cuenta´ TO Nro_cuenta;
ALTER TABLE ´cuenta´
RENAME COLUMN ´Tipo_cuenta´ TO Tipo_cuenta;
RENAME TABLE ´cuenta´ TO cuenta;

-- -------------------------------------------------- PRÁCTICA CONSULTAS ----------------------------------------------------------------------------------------
-- ---- Selecciono el nombre de la tabla donantes --------------------
SELECT nombre FROM donantes;
-- ----------- Realizo un listado con los tipos de contribuyentes que trabajan en la fundacion ----------
SELECT DISTINCT Tipo_contribuyente FROM contribuyente;
-- --------- Selecciono los importes de la tabla egresos asignandoles el alias Monto_egreso para los importes superiores a 290000 ----------
SELECT Importe AS Monto_egreso FROM egresos WHERE Importe > 290000;
-- ------ Selecciono el nombre de los proveedores asignandoles el alias proveedor para aquellos cuyo Id_ciudad sea igual a 3 --------
SELECT Nombre AS Proveedor
FROM proveedores
WHERE Id_ciudad=3;
-- --------- Selecciono los valores distintos de tipos de cuenta ------------------------------
SELECT DISTINCT Tipo_cuenta FROM cuenta;
-- --------- Muestro un listado de los paises que aportan donaciones a la fundacion ------------------
SELECT DISTINCT pais.Pais AS Pais
FROM donantes
JOIN pais ON donantes.Id_pais=pais.Id_pais;
-- ----- Selecciono los id_ingreso y los importes de la tabla ingresos ordenandolos de manera descendente por importe y limitando el resultado a 10 filas----
SELECT Id_ingreso, Importe
FROM ingresos
ORDER BY Importe DESC
LIMIT 10;
-- ------ Hago una lista con los primeros 15 registros de proveedores con los datos nombre, id_proveedor y cuit y los ordeno alfabeticamente- -------
SELECT Nombre, Id_proveedor, CUIT
FROM proveedores
ORDER BY Nombre ASC
LIMIT 15;
-- ------ Cuento la cantidad de gastos (ALIAS Cantidad_transacciones) de la fundacion y sumo los importes de los mismos (ALIAS Total_gastos)------
SELECT COUNT(*)AS Cantidad_transacciones,
SUM(Importe)AS Total_gastos FROM egresos;
-- ----- Calculo el promedio de las donaciones y la mayor y la menor donacion recibida por la fundacion y muestro el resultado con dos decimales ----
SELECT
ROUND(AVG(Importe),2)AS Promedio_donaciones,
ROUND(MAX(Importe),2)AS Mayor_donacion,
ROUND(MIN(Importe),2)AS Menor_donacion
FROM ingresos;
-- ------------------- Agrupo las cuentas por tipo y muestro la cantidad por cada tipo de menor a mayor -------
SELECT Tipo_cuenta, COUNT(*)AS Cantidad
FROM cuenta
GROUP BY Tipo_cuenta
ORDER BY Cantidad ASC;
-- ------ Agrupo los registros de la tabla ingresos por Tipo_movimiento y muestro la suma de los importes por cada tipo, formateando el resultado ----
SELECT Tipo_movimiento, FORMAT(SUM(Importe),2)AS Total_importe
FROM ingresos
GROUP BY Tipo_movimiento;
-- ----- Agrupo los egresos por fecha y muestro aquellos donde el total sea superior a 500000 ordenados de mayor a menor --------------------
SELECT Fecha, SUM(Importe)AS Total_egreso
FROM egresos
GROUP BY Fecha
HAVING Total_egreso > 500000
ORDER BY Total_egreso DESC;
-- -------- Realizo un informe que muestre la cantidad de donantes por pais solo para donantes con frecuencia mensual y anual, ordenados de mayor a menor por cantidad de donantes ----
SELECT pais.Pais AS Pais,
COUNT(donantes.Id_donante) AS Cantidad_donantes
FROM donantes
JOIN pais ON donantes.Id_pais=pais.Id_pais
JOIN frecuencia ON donantes.Id_frecuencia=frecuencia.Id_frecuencia
WHERE frecuencia.Frecuencia IN ('Mensual', 'Anual')
GROUP BY pais.Pais
ORDER BY Cantidad_donantes DESC;
-- --------- Realizo un LEFT JOIN entre proveedores y ciudad para mostrar la cantidad de proveedores por ciudad ----------------------
SELECT c.Ciudad AS Ciudad,
COUNT(p.Id_proveedor)AS Cantidad_proveedores
FROM ciudad c
LEFT JOIN proveedores p ON c.Id_ciudad=p.Id_ciudad
GROUP BY c.Ciudad;
-- -------------- Del ejercicio anterior muestro solo las ciudades que no tienen proveedores ----------------------------
SELECT c.Ciudad AS Ciudad
FROM ciudad c
LEFT JOIN proveedores p ON c.Id_ciudad=p.Id_ciudad
WHERE p.Id_proveedor IS NULL;
-- ------------- Muestro el nombre del donante y el pais donde reside usando un INNER JOIN -----------------------------------------
SELECT donantes.Nombre AS Nombre_donante,
pais.Pais AS Nombre_pais
FROM donantes
INNER JOIN pais ON donantes.Id_pais=pais.Id_pais;
-- -------------------- Muestro una lista con los nombres de los proveedores y la ciudad de cada uno usando un RIGHT JOIN (si una ciudad no tiene un proveedor asignado en la tabla proveedores aparecera NULL en la columna Nombre_proveedor)---
SELECT proveedores.Nombre AS Nombre_proveedor,
ciudad.Ciudad AS Nombre_ciudad
FROM proveedores
RIGHT JOIN ciudad ON proveedores.Id_ciudad=ciudad.Id_ciudad;

									