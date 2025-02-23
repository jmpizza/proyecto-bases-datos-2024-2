USE ElBuenGusto ;

-- Insercion de empresas externas --
INSERT INTO ElBuenGusto.`EMPRESA_EXTERNA` 
(emp_nit, emp_nombre, emp_correo_electronico, emp_telefono)
VALUES
(890123456, 'Harinas del Valle S.A.S.', 'ventas@harinasdelvalle.com.co', '601-2345678'),
(900234567, 'Lácteos Frescos Ltda.', 'contacto@lacteosfrescos.co', '315-7890123'),
(891234568, 'Dulces y Más S.A.', 'info@dulcesymas.com', '607-8912345'),
(902345679, 'Café Premium de Colombia', 'proveedores@cafepremium.com.co', '320-4567890'),
(893456780, 'Empaques Seguros S.A.S.', 'servicioalcliente@empaqueseguro.com', '601-3456789'),
(904567891, 'Chocolates Artesanales Ltda.', 'pedidos@chocoartesanal.co', '317-8901234'),
(895678902, 'Distribuidora Azucarera Nacional', 'ventas@azucarnacional.com', '607-4561237'),
(906789013, 'Frutos Secos del Caribe S.A.', 'contacto@frutosecoscaribe.com', '318-5678901'),
(897890124, 'Equipos Panaderos S.A.S.', 'cotizaciones@equipospanaderos.co', '601-6789012'),
(908901235, 'Sabores Naturales Ltda.', 'info@saboresnaturales.com.co', '310-2345678'),
(909012346, 'Coca-Cola Femsa Colombia S.A.', 'proveedores.ccf@femsa.com.co', '601-8001234'),
(910123457, 'Snacks Andinos Ltda. (Distribuidor Margarita)', 'pedidos@snacksandinos.co', '315-6789012'),
(911234568, 'Pepsico Alimentos Colombia S.A.S. (Papas Margarita)', 'contacto.colombia@pepsico.com', '01800-5195195'),
(912345679, 'Distribuidora de Bebidas La Brisa', 'ventas@labrisabebidas.com.co', '320-1234567'),
(913456780, 'Super Ricas Snacks S.A.S.', 'atencion@superricas.co', '601-3456789');

-- Insersion de personas --
INSERT INTO ElBuenGusto.`PERSONA` 
(per_documento, per_nombre, per_apellido, per_correo_electronico)
VALUES

-- Gerentes
(108567890, 'Antonio', 'Salazar', 'antonio.salazar@gmail.com'),
(108678901, 'Beatriz', 'Morales', 'beatriz.morales@hotmail.com'),
(108789012, 'José', 'González', 'jose.gonzalez@outlook.com'),
(108890123, 'Verónica', 'Díaz', 'veronica.diaz@yahoo.com'),
(108901234, 'Carlos', 'Martínez', 'carlos.martinez@live.com'),
(109012345, 'Laura', 'Rodríguez', 'laura.rodriguez@gmail.com'),
(109123456, 'Marcos', 'Gutiérrez', 'marcos.gutierrez@icloud.com'),
(109234567, 'Raquel', 'Cordero', 'raquel.cordero@protonmail.com'),
(109345678, 'José Luis', 'Fernández', 'joseluis.fernandez@hotmail.com'),

-- proveedores
(106012345, 'Alejandro', 'Torres', 'alejandro.torres@gmail.com'),
(106123456, 'Carolina', 'Hernández', 'carolina.hernandez@hotmail.com'),
(106234567, 'Gabriel', 'Martínez', 'gabriel.martinez@outlook.com'),
(106345678, 'Verónica', 'López', 'veronica.lopez@yahoo.com'),
(106456789, 'Héctor', 'Rodríguez', 'hector.rodriguez@gmail.com'),
(106567890, 'Santiago', 'Pérez', 'santiago.perez@live.com'),
(106678901, 'Margarita', 'González', 'margarita.gonzalez@gmail.com'),
(106789012, 'Ricardo', 'Jiménez', 'ricardo.jimenez@outlook.com'),
(106890123, 'Paula', 'Castillo', 'paula.castillo@icloud.com'),
(106901234, 'Luis', 'Sánchez', 'luis.sanchez@hotmail.com'),
(107012345, 'María José', 'Vega', 'mariajose.vega@gmail.com'),
(107123456, 'Carlos Eduardo', 'Gutiérrez', 'carlos.gutierrez@yahoo.com'),
(107234567, 'Sofía', 'Ramírez', 'sofia.ramirez@hotmail.com'),
(107345678, 'Luis Alfonso', 'Reyes', 'luis.reyes@outlook.com'),
(107456789, 'Andrés Felipe', 'Torres', 'andres.torres@gmail.com'),
(107567890, 'Natalia', 'Martínez', 'natalia.martinez@live.com'),
(107678901, 'Alejandra', 'González', 'alejandra.gonzalez@icloud.com'),
(107789012, 'Pedro', 'Sánchez', 'pedro.sanchez@protonmail.com'),
(107890123, 'Juan Pablo', 'Rodríguez', 'juan.rodriguez@gmail.com'),
(107901234, 'Mónica', 'Hernández', 'monica.hernandez@hotmail.com'),
(108012345, 'Eduardo', 'Ramírez', 'eduardo.ramirez@gmail.com'),
(108123456, 'Victoria', 'Cordero', 'victoria.cordero@outlook.com'),
(108234567, 'Gabriela', 'López', 'gabriela.lopez@yahoo.com'),
(108345678, 'Juliana', 'Méndez', 'juliana.mendez@live.com'),
(108456789, 'Ricardo', 'García', 'ricardo.garcia@gmail.com'),

-- trabajadores
(100123456, 'Yeswah', 'Gonzales', 'yeswahg@panaderiaelbuengusto.com.co'),
(100234567, 'Juan Manuel', 'Espitia', 'jmespitia@panaderiaelbuengusto.com.co'),
(100345678, 'Carlos Andrés', 'Rodríguez', 'crodriguez@panaderiaelbuengusto.com.co'),
(100456789, 'Ana María', 'López', 'amlopez@panaderiaelbuengusto.com.co'),
(100567890, 'Luis Fernando', 'Sánchez', 'lsanchez@panaderiaelbuengusto.com.co'),
(100678901, 'María José', 'Ramírez', 'mramirez@panaderiaelbuengusto.com.co'),
(100789012, 'Pedro Antonio', 'Gómez', 'pgomez@panaderiaelbuengusto.com.co'),
(100890123, 'Laura Camila', 'Martínez', 'lmartinez@panaderiaelbuengusto.com.co'),
(100901234, 'Diego Alejandro', 'Hernández', 'dhernandez@panaderiaelbuengusto.com.co'),
(101012345, 'Sofía Valentina', 'Díaz', 'sdiaz@panaderiaelbuengusto.com.co'),

-- Clientes
(101123456, 'Jorge Eduardo', 'Castro', 'jorgecastro82@gmail.com'),
(101234567, 'Carolina Andrea', 'Rojas', 'carorojas23@hotmail.com'),
(101345678, 'Andrés Felipe', 'Torres', 'andrestorres45@yahoo.com'),
(101456789, 'Camila Estefanía', 'Mendoza', 'camendoza1987@gmail.com'),
(101567890, 'Ricardo José', 'Vargas', 'rvargas.consultor@outlook.com'),
(101678901, 'Patricia Alejandra', 'Nuñez', 'patynunez.15@gmail.com'),
(101789012, 'Oscar David', 'Jiménez', 'ojimenez.col@protonmail.com'),
(101890123, 'Daniela Sofía', 'Guzmán', 'daniguzman.oficial@hotmail.com'),
(101901234, 'Javier Ignacio', 'Ríos', 'javierrios.co@gmail.com'),
(102012345, 'Mónica Lucía', 'Herrera', 'herrera.monica@unisabana.edu.co'),
(102123456, 'Carlos Alberto', 'Sánchez', 'carlossanchez12@gmail.com'),
(102234567, 'María Fernanda', 'Pérez', 'mariaperez_91@hotmail.com'),
(102345678, 'Luis Javier', 'Gutiérrez', 'luisgutierrrez.85@gmail.com'),
(102456789, 'Sofía Carolina', 'Vega', 'sofia.vega95@yahoo.com'),
(102567890, 'Fernando José', 'Martínez', 'fermartinez88@gmail.com'),
(102678901, 'Natalia Juliana', 'Ramírez', 'nataliaramirez@outlook.com'),
(102789012, 'Pedro Andrés', 'Gómez', 'pedroandresgomez@hotmail.com'),
(102890123, 'Sandra Isabel', 'López', 'sandra.lopez22@gmail.com'),
(102901234, 'José Luis', 'Mora', 'joseluismora23@live.com'),
(103012345, 'Paola Andrea', 'Jiménez', 'paolaandrea_jimenez@gmail.com'),
(103123456, 'Luis Enrique', 'Méndez', 'luisenrique.mendez@yahoo.com'),
(103234567, 'Carmen Elisa', 'Paredes', 'carmenelisa92@outlook.com'),
(103345678, 'Marcela Patricia', 'Castaño', 'marcelapatricia.casta@gmail.com'),
(103456789, 'David Esteban', 'Salazar', 'david.salazar87@hotmail.com'),
(103567890, 'Ana Sofía', 'Arévalo', 'anasofia.arevalo@gmail.com'),
(103678901, 'Ricardo Ernesto', 'Jiménez', 'ricardojimenez123@hotmail.com'),
(103789012, 'Victoria Eugenia', 'Luna', 'victoria_luna@live.com'),
(103890123, 'Héctor Julio', 'Castro', 'hectorjulio.castro@gmail.com'),
(103901234, 'Iván Sebastián', 'Vega', 'ivansvega98@outlook.com'),
(104012345, 'Mariana Alejandra', 'Torres', 'marianaalejandra_torres@gmail.com'),
(104123456, 'Carlos Daniel', 'Rodríguez', 'carlosdaniel.rodriguez@hotmail.com'),
(104234567, 'Margarita Beatriz', 'Salazar', 'margaritabeatriz.salazar@gmail.com'),
(104345678, 'Jorge Luis', 'Ramírez', 'jorgeramirez88@yahoo.com'),
(104456789, 'Lucía Margarita', 'Vázquez', 'luciamargarita.vazquez@gmail.com'),
(104567890, 'Óscar Javier', 'Reyes', 'oscarjavier.reyes@hotmail.com'),
(104678901, 'Carolina Marcela', 'Suárez', 'carolinamarcela.suarez@gmail.com'),
(104789012, 'Felipe Antonio', 'Mendoza', 'felipeantonio.mendoza@live.com'),
(104890123, 'Claudia Patricia', 'Cordero', 'claudiapatricia.cordero@gmail.com'),
(104901234, 'Martín Javier', 'García', 'martin.javier.garcia@outlook.com'),
(105012345, 'Elena Sofía', 'Hernández', 'elenasofia.hernandez@gmail.com'),
(105123456, 'Ricardo Alejandro', 'Pinto', 'ricardoal.pinto@yahoo.com'),
(105234567, 'Beatriz Alicia', 'Reyes', 'beatrizalicia.reyes@outlook.com'),
(105345678, 'Fernando Manuel', 'Lozano', 'fernandomanuel.lozano@gmail.com'),
(105456789, 'Sandra Margarita', 'García', 'sandramargarita.garcia@live.com'),
(105567890, 'Andrés Gabriel', 'Ríos', 'andresgabriel.rios@gmail.com'),
(105678901, 'Violeta María', 'Fernández', 'violetamaria.fernandez@outlook.com'),
(105789012, 'Ricardo Antonio', 'Vera', 'ricardoantonio.vera@hotmail.com'),
(105890123, 'Gabriela Luisa', 'Castillo', 'gabrielaluisa.castillo@gmail.com'),
(105901234, 'Eduardo Javier', 'Jiménez', 'eduardojavier.jimenez@hotmail.com');

INSERT INTO `ElBuenGusto`.`CATEGORIA` (`cat_id_categoria`, `cat_nombre`) VALUES
(1, 'Desayuno'),
(2, 'Almuerzo'),
(3, 'Cena'),
(4, 'Pan'),
(5, 'Postre'),
(6, 'Pasteles'),
(7, 'Bebidas'),
(8, 'Galletas'),
(9, 'Tartas'),
(10, 'Bollería'),
(11, 'Panes Artesanales');

-- Gerentes
INSERT INTO ElBuenGusto.TELEFONO (tel_telefono, tel_tipo, per_documento) VALUES
('300108567890', 'Móvil', 108567890),
('300108678901', 'Móvil', 108678901),
('300108789012', 'Móvil', 108789012),
('300108890123', 'Móvil', 108890123),
('300108901234', 'Móvil', 108901234),
('300109012345', 'Móvil', 109012345),
('300109123456', 'Móvil', 109123456),
('300109234567', 'Móvil', 109234567),
('300109345678', 'Móvil', 109345678),

-- Proveedores
('300106012345', 'Móvil', 106012345),
('300106123456', 'Móvil', 106123456),
('300106234567', 'Móvil', 106234567),
('300106345678', 'Móvil', 106345678),
('300106456789', 'Móvil', 106456789),
('300106567890', 'Móvil', 106567890),
('300106678901', 'Móvil', 106678901),
('300106789012', 'Móvil', 106789012),
('300106890123', 'Móvil', 106890123),
('300106901234', 'Móvil', 106901234),
('300107012345', 'Móvil', 107012345),
('300107123456', 'Móvil', 107123456),
('300107234567', 'Móvil', 107234567),
('300107345678', 'Móvil', 107345678),
('300107456789', 'Móvil', 107456789),
('300107567890', 'Móvil', 107567890),
('300107678901', 'Móvil', 107678901),
('300107789012', 'Móvil', 107789012),
('300107890123', 'Móvil', 107890123),
('300107901234', 'Móvil', 107901234),
('300108012345', 'Móvil', 108012345),
('300108123456', 'Móvil', 108123456),
('300108234567', 'Móvil', 108234567),
('300108345678', 'Móvil', 108345678),
('300108456789', 'Móvil', 108456789),

-- Trabajadores
('300100123456', 'Móvil', 100123456),
('300100234567', 'Móvil', 100234567),
('300100345678', 'Móvil', 100345678),
('300100456789', 'Móvil', 100456789),
('300100567890', 'Móvil', 100567890),
('300100678901', 'Móvil', 100678901),
('300100789012', 'Móvil', 100789012),
('300100890123', 'Móvil', 100890123),
('300100901234', 'Móvil', 100901234),
('300101012345', 'Móvil', 101012345),

-- Clientes
('300101123456', 'Móvil', 101123456),
('300101234567', 'Móvil', 101234567),
('300101345678', 'Móvil', 101345678),
('300101456789', 'Móvil', 101456789),
('300101567890', 'Móvil', 101567890),
('300101678901', 'Móvil', 101678901),
('300101789012', 'Móvil', 101789012),
('300101890123', 'Móvil', 101890123),
('300101901234', 'Móvil', 101901234),
('300102012345', 'Móvil', 102012345),
('300102123456', 'Móvil', 102123456),
('300102234567', 'Móvil', 102234567),
('300102345678', 'Móvil', 102345678),
('300102456789', 'Móvil', 102456789),
('300102567890', 'Móvil', 102567890),
('300102678901', 'Móvil', 102678901),
('300102789012', 'Móvil', 102789012),
('300102890123', 'Móvil', 102890123),
('300102901234', 'Móvil', 102901234),
('300103012345', 'Móvil', 103012345),
('300103123456', 'Móvil', 103123456),
('300103234567', 'Móvil', 103234567),
('300103345678', 'Móvil', 103345678),
('300103456789', 'Móvil', 103456789),
('300103567890', 'Móvil', 103567890),
('300103678901', 'Móvil', 103678901),
('300103789012', 'Móvil', 103789012),
('300103890123', 'Móvil', 103890123),
('300103901234', 'Móvil', 103901234),
('300104012345', 'Móvil', 104012345),
('300104123456', 'Móvil', 104123456),
('300104234567', 'Móvil', 104234567),
('300104345678', 'Móvil', 104345678),
('300104456789', 'Móvil', 104456789),
('300104567890', 'Móvil', 104567890),
('300104678901', 'Móvil', 104678901),
('300104789012', 'Móvil', 104789012),
('300104890123', 'Móvil', 104890123),
('300104901234', 'Móvil', 104901234),
('300105012345', 'Móvil', 105012345),
('300105123456', 'Móvil', 105123456),
('300105234567', 'Móvil', 105234567),
('300105345678', 'Móvil', 105345678),
('300105456789', 'Móvil', 105456789),
('300105567890', 'Móvil', 105567890),
('300105678901', 'Móvil', 105678901),
('300105789012', 'Móvil', 105789012),
('300105890123', 'Móvil', 105890123),
('300105901234', 'Móvil', 105901234);


-- Inserciones de periodos de gerentes entre 1990 y 2025
INSERT INTO ElBuenGusto.GERENTE (ger_documento,ger_fecha_ingreso,ger_fecha_salida, ger_dias_trabajados)
VALUES
(108567890, '1990-03-12', '1995-03-12', DATEDIFF('1995-03-12', '1990-03-12')),
(108678901, '1995-03-13', '2000-03-13', DATEDIFF('2000-03-13', '1995-03-13')),
(108789012, '2000-03-14', '2005-03-14', DATEDIFF('2005-03-14', '2000-03-14')),
(108890123, '2005-03-15', '2010-03-15', DATEDIFF('2010-03-15', '2005-03-15')),
(108901234, '2010-03-16', '2015-03-16', DATEDIFF('2015-03-16', '2010-03-16')),
(109012345, '2015-03-17', '2020-03-17', DATEDIFF('2020-03-17', '2015-03-17')),
(109123456, '2020-03-18', '2022-03-18', DATEDIFF('2022-03-18', '2020-03-18')),
(109234567, '2022-03-19', '2024-11-25', DATEDIFF('2024-11-25', '2022-03-19')),
(109345678, '2025-11-26', NULL, DATEDIFF(CURDATE(), '2025-11-26'));




-- Insertar personas como proveedores asociados a una empresa
INSERT INTO ElBuenGusto.PROVEEDOR (emp_nit, ger_documento, per_documento)
VALUES
(890123456, 108567890, 106012345); -- Antonio Salazar -> Harinas del Valle S.A.S.

INSERT INTO ElBuenGusto.PROVEEDOR (emp_nit, ger_documento, per_documento)
VALUES
(900234567, 109012345, 106123456); -- Laura Rodríguez -> Lácteos Frescos Ltda.

INSERT INTO ElBuenGusto.PROVEEDOR (emp_nit, ger_documento, per_documento)
VALUES
(891234568, 108789012, 106234567); -- José González -> Dulces y Más S.A.

INSERT INTO ElBuenGusto.PROVEEDOR (emp_nit, ger_documento, per_documento)
VALUES
(902345679, 108901234, 106345678); -- Carlos Martínez -> Café Premium de Colombia

INSERT INTO ElBuenGusto.PROVEEDOR (emp_nit, ger_documento, per_documento)
VALUES
(893456780, 109123456, 106456789); -- Marcos Gutiérrez -> Empaques Seguros S.A.S.


INSERT INTO ElBuenGusto.PROVEEDOR (emp_nit, ger_documento, per_documento)
VALUES
(904567891, 109234567, 106567890); -- Raquel Cordero -> Chocolates Artesanales Ltda.


INSERT INTO ElBuenGusto.PROVEEDOR (emp_nit, ger_documento, per_documento)
VALUES
(895678902, 108890123, 106678901); -- Verónica Díaz -> Distribuidora Azucarera Nacional

INSERT INTO ElBuenGusto.PROVEEDOR (emp_nit, ger_documento, per_documento)
VALUES
(906789013, 108901234, 106789012); -- Carlos Martínez -> Frutos Secos del Caribe S.A.

INSERT INTO ElBuenGusto.PROVEEDOR (emp_nit, ger_documento, per_documento)
VALUES
(897890124, 109345678, 106890123); -- José Luis Fernández -> Equipos Panaderos S.A.S.

INSERT INTO ElBuenGusto.PROVEEDOR (emp_nit, ger_documento, per_documento)
VALUES
(908901235, 109234567, 106901234), -- Raquel Cordero -> Sabores Naturales Ltda.
(909012346, 107012345, 107012345), -- María José Vega -> Coca-Cola Femsa Colombia S.A.
(910123457, 107123456, 107123456), -- Carlos Eduardo Gutiérrez -> Snacks Andinos Ltda.
(911234568, 107234567, 107234567), -- Sofía Ramírez -> Pepsico Alimentos Colombia S.A.S.
(912345679, 107345678, 107345678), -- Luis Alfonso Reyes -> Distribuidora de Bebidas La Brisa
(913456780, 107456789, 107456789), -- Andrés Felipe Torres -> Super Ricas Snacks S.A.S.
(890123456, 107567890, 107567890), -- Natalia Martínez -> Harinas del Valle S.A.S.
(900234567, 107678901, 107678901), -- Alejandra González -> Lácteos Frescos Ltda.
(891234568, 107789012, 107789012), -- Pedro Sánchez -> Dulces y Más S.A.
(902345679, 107890123, 107890123), -- Juan Pablo Rodríguez -> Café Premium de Colombia
(893456780, 107901234, 107901234), -- Mónica Hernández -> Empaques Seguros S.A.S.
(904567891, 108012345, 108012345), -- Eduardo Ramírez -> Chocolates Artesanales Ltda.
(895678902, 108123456, 108123456), -- Victoria Cordero -> Distribuidora Azucarera Nacional
(906789013, 108234567, 108234567), -- Gabriela López -> Frutos Secos del Caribe S.A.
(897890124, 108345678, 108345678), -- Juliana Méndez -> Equipos Panaderos S.A.S.
(908901235, 108456789, 108456789); -- Ricardo García -> Sabores Naturales Ltda.

-- Insertar materias primas para una panadería y pastelería
INSERT INTO ElBuenGusto.MATERIA (mat_codigo, mat_nombre, mat_precio_unitario, mat_cantidad_unidades, mat_fecha_llegada, mat_fecha_expiracion, per_documento)
VALUES
(1, 'Harina de Trigo', 15000, 1000, '2025-01-01', '2025-06-01', 106012345), -- Alejandro Torres -> Harinas del Valle S.A.S.
(2, 'Leche Entera', 5000, 500, '2025-01-10', '2025-03-10', 106123456), -- Carolina Hernández -> Lácteos Frescos Ltda.
(3, 'Azúcar Blanca', 10000, 1500, '2025-02-01', '2025-07-01', 106234567), -- Gabriel Martínez -> Dulces y Más S.A.
(4, 'Levadura Fresca', 2000, 300, '2025-01-15', '2025-05-15', 106345678), -- Verónica López -> Café Premium de Colombia
(5, 'Chocolate Amargo', 25000, 500, '2025-01-25', '2025-12-01', 106456789), -- Héctor Rodríguez -> Empaques Seguros S.A.S.
(6, 'Mantequilla', 12000, 600, '2025-02-01', '2025-07-01', 106567890), -- Santiago Pérez -> Chocolates Artesanales Ltda.
(7, 'Harina Integral', 18000, 700, '2025-02-05', '2025-08-01', 106678901), -- Margarita González -> Distribuidora Azucarera Nacional
(8, 'Cacao en Polvo', 22000, 400, '2025-01-20', '2025-11-01', 106789012), -- Ricardo Jiménez -> Frutos Secos del Caribe S.A.
(9, 'Nueces', 30000, 100, '2025-02-01', '2025-12-01', 106890123), -- Paula Castillo -> Equipos Panaderos S.A.S.
(10, 'Esencia de Vainilla', 8000, 200, '2025-02-05', '2025-05-05', 106901234), -- Luis Sánchez -> Sabores Naturales Ltda.
(11, 'Harina de Maíz', 14000, 1000, '2025-02-10', '2025-06-15', 107012345), -- María José Vega -> Coca-Cola Femsa Colombia S.A.
(12, 'Aceite Vegetal', 6000, 800, '2025-02-15', '2025-08-15', 107123456), -- Carlos Eduardo Gutiérrez -> Snacks Andinos Ltda.
(13, 'Frutos Secos', 28000, 300, '2025-02-20', '2025-12-20', 107234567), -- Sofía Ramírez -> Pepsico Alimentos Colombia S.A.S.
(14, 'Miel', 15000, 500, '2025-01-25', '2025-09-01', 107345678), -- Luis Alfonso Reyes -> Distribuidora de Bebidas La Brisa
(15, 'Nata de Leche', 7000, 600, '2025-02-01', '2025-04-01', 107456789), -- Andrés Felipe Torres -> Super Ricas Snacks S.A.S.
(16, 'Cremor Tártaro', 10000, 400, '2025-01-30', '2025-06-30', 107567890), -- Natalia Martínez -> Harinas del Valle S.A.S.
(17, 'Frambuesas', 15000, 250, '2025-02-05', '2025-06-01', 107678901), -- Alejandra González -> Lácteos Frescos Ltda.
(18, 'Huevo', 3000, 1500, '2025-02-10', '2025-04-10', 107789012), -- Pedro Sánchez -> Dulces y Más S.A.
(19, 'Cereal de Maíz', 8000, 1000, '2025-01-15', '2025-12-15', 107890123), -- Juan Pablo Rodríguez -> Café Premium de Colombia
(20, 'Frutas Confiteadas', 18000, 600, '2025-02-01', '2025-08-01', 107901234), -- Mónica Hernández -> Empaques Seguros S.A.S.
(21, 'Jengibre en Polvo', 12000, 400, '2025-02-05', '2025-07-01', 108012345), -- Eduardo Ramírez -> Chocolates Artesanales Ltda.
(22, 'Almendras', 25000, 500, '2025-01-28', '2025-10-01', 108123456), -- Victoria Cordero -> Distribuidora Azucarera Nacional
(23, 'Relleno de Frambuesa', 22000, 300, '2025-02-15', '2025-05-10', 108234567), -- Gabriela López -> Frutos Secos del Caribe S.A.
(24, 'Coco Rallado', 9000, 700, '2025-01-10', '2025-04-01', 108345678), -- Juliana Méndez -> Equipos Panaderos S.A.S.
(25, 'Glaseado de Azúcar', 7000, 400, '2025-02-10', '2025-06-15', 108456789); -- Ricardo García -> Sabores Naturales Ltda.

-- Insertar materia prima
INSERT INTO ElBuenGusto.MATERIA (mat_codigo, mat_nombre, mat_precio_unitario, mat_cantidad_unidades, mat_fecha_llegada, mat_fecha_expiracion, per_documento)
VALUES
(26, 'Harina de trigo Coca-Cola', 1200, 100, '2025-01-01', '2025-12-01', 107012345),  -- Harina de trigo suministrada por Coca-Cola
(27, 'Leche líquida Pepsico', 1500, 150, '2025-01-15', '2025-08-15', 107123456),  -- Leche líquida suministrada por Pepsico
(28, 'Azúcar moreno Hershey\'s', 1800, 200, '2025-01-20', '2026-01-20', 107234567),  -- Azúcar moreno de Hershey's
(29, 'Mantequilla de maní Skippy', 2200, 80, '2025-02-01', '2025-08-01', 107345678),  -- Mantequilla de maní Skippy
(30, 'Cocoa en polvo Nestlé', 1700, 120, '2025-02-10', '2025-09-10', 107456789),  -- Cocoa en polvo de Nestlé
(31, 'Mermelada Smucker\'s', 1300, 90, '2025-02-12', '2025-12-12', 107567890),  -- Mermelada de Smucker's
(32, 'Café molido Starbucks', 2500, 50, '2025-02-15', '2026-02-15', 107678901),  -- Café molido Starbucks
(33, 'Leche condensada La Lechera', 2000, 75, '2025-02-20', '2026-02-20', 107789012),  -- Leche condensada de La Lechera
(34, 'Crema de leche Alquería', 1400, 100, '2025-03-01', '2026-03-01', 107890123),  -- Crema de leche Alquería
(35, 'Chispas de chocolate M&M\'s', 2200, 130, '2025-03-05', '2026-03-05', 107901234),  -- Chispas de chocolate M&M's
(36, 'Galletas Oreo', 1600, 200, '2025-03-10', '2026-03-10', 108012345),  -- Galletas Oreo
(37, 'Vainilla extracto McCormick', 2500, 60, '2025-03-15', '2026-03-15', 108123456),  -- Extracto de vainilla McCormick
(38, 'Sirope de maíz Karo', 1300, 140, '2025-03-20', '2026-03-20', 108234567),  -- Sirope de maíz Karo
(39, 'Frutos secos Planters', 2000, 90, '2025-03-25', '2026-03-25', 108345678),  -- Frutos secos Planters
(40, 'Cereal Kellogg\'s Corn Flakes', 1700, 200, '2025-04-01', '2026-04-01', 108456789),  -- Cereal Corn Flakes de Kellogg's
(41, 'Puré de manzana Mott\'s', 1400, 110, '2025-04-05', '2026-04-05', 108567890),  -- Puré de manzana Mott's
(42, 'Frambuesas congeladas Dole', 2200, 75, '2025-04-10', '2026-04-10', 108678901),  -- Frambuesas congeladas Dole
(43, 'Graham crackers Nabisco', 1600, 150, '2025-04-15', '2026-04-15', 108789012),  -- Galletas Graham Nabisco
(44, 'Vainilla en polvo Nielsen-Massey', 1800, 80, '2025-04-20', '2026-04-20', 108890123),  -- Vainilla en polvo Nielsen-Massey
(45, 'Aceite vegetal Crisco', 1900, 60, '2025-04-25', '2026-04-25', 108901234),  -- Aceite Crisco
(46, 'Caramelo líquido Hershey\'s', 2100, 90, '2025-05-01', '2026-05-01', 109012345),  -- Caramelo líquido Hershey's
(47, 'Frutas secas Sun-Maid', 1700, 110, '2025-05-05', '2026-05-05', 109123456);  -- Frutas secas Sun-Maid


-- Insertar categorías de materias primas
INSERT INTO ElBuenGusto.MATERIA_PRIMA (mat_codigo, mat_categoria)
VALUES
(1, 'Harina'), -- Harina de Trigo
(2, 'Lácteo'), -- Leche Entera
(3, 'Endulzante'), -- Azúcar Blanca
(4, 'Levadura'), -- Levadura Fresca
(5, 'Cacao'), -- Chocolate Amargo
(6, 'Lácteo'), -- Mantequilla
(7, 'Harina'), -- Harina Integral
(8, 'Cacao'), -- Cacao en Polvo
(9, 'Frutos Secos'), -- Nueces
(10, 'Esencia'), -- Esencia de Vainilla
(11, 'Harina'), -- Harina de Maíz
(12, 'Aceite'), -- Aceite Vegetal
(13, 'Frutos Secos'), -- Frutos Secos
(14, 'Endulzante'), -- Miel
(15, 'Lácteo'), -- Nata de Leche
(16, 'Levadura'), -- Cremor Tártaro
(17, 'Frutas'), -- Frambuesas
(18, 'Lácteo'), -- Huevo
(19, 'Cereal'), -- Cereal de Maíz
(20, 'Frutas'), -- Frutas Confiteadas
(21, 'Especia'), -- Jengibre en Polvo
(22, 'Frutos Secos'), -- Almendras
(23, 'Relleno'), -- Relleno de Frambuesa
(24, 'Frutas'), -- Coco Rallado
(25, 'Endulzante'); -- Glaseado de Azúcar

-- Insertar productos de empresas externas asociados a materia prima
INSERT INTO ElBuenGusto.PRODUCTO_EMPRESA_EXTERNA (pre_codigo, pre_tipo)
VALUES
(26, 'Ingrediente'),  -- Harina de trigo Coca-Cola
(27, 'Lácteo'),       -- Leche líquida Pepsico
(28, 'Dulce'),        -- Azúcar moreno Hershey's
(29, 'Ingrediente'),  -- Mantequilla de maní Skippy
(30, 'Cocoa'),        -- Cocoa en polvo Nestlé
(31, 'Dulce'),        -- Mermelada Smucker's
(32, 'Bebida'),       -- Café molido Starbucks
(33, 'Lácteo'),       -- Leche condensada La Lechera
(34, 'Lácteo'),       -- Crema de leche Alquería
(35, 'Dulce'),        -- Chispas de chocolate M&M's
(36, 'Dulce'),        -- Galletas Oreo
(37, 'Saborizante'),  -- Vainilla extracto McCormick
(38, 'Sirope'),       -- Sirope de maíz Karo
(39, 'Frutos Secos'), -- Frutos secos Planters
(40, 'Ingrediente'),  -- Cereal Kellogg's Corn Flakes
(41, 'Dulce'),        -- Puré de manzana Mott's
(42, 'Fruta'),        -- Frambuesas congeladas Dole
(43, 'Dulce'),        -- Galletas Graham Nabisco
(44, 'Saborizante'),  -- Vainilla en polvo Nielsen-Massey
(45, 'Aceite'),       -- Aceite vegetal Crisco
(46, 'Dulce'),        -- Caramelo líquido Hershey's
(47, 'Fruta');        -- Frutas secas Sun-Maid



-- Insertar recetas de productos con las materias primas correspondientes

-- Pan de Trigo
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(1, 1),  -- Harina de Trigo
(1, 2),  -- Leche Entera
(1, 4),  -- Levadura Fresca
(1, 6),  -- Mantequilla
(1, 18); -- Huevo

-- Tarta de Manzana
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(2, 1),  -- Harina de Trigo
(2, 2),  -- Leche Entera
(2, 6),  -- Mantequilla
(2, 18), -- Huevo
(2, 17), -- Frambuesas
(2, 4);  -- Levadura Fresca

-- Bizcocho de Chocolate
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(3, 1),  -- Harina de Trigo
(3, 5),  -- Chocolate Amargo
(3, 6),  -- Mantequilla
(3, 18), -- Huevo
(3, 3),  -- Azúcar Blanca
(3, 4);  -- Levadura Fresca

-- Galletas de Avena
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(4, 1),  -- Harina de Trigo
(4, 3),  -- Azúcar Blanca
(4, 6),  -- Mantequilla
(4, 19), -- Cereal de Maíz
(4, 18), -- Huevo
(4, 10); -- Esencia de Vainilla

-- Croissants
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(5, 1),  -- Harina de Trigo
(5, 6),  -- Mantequilla
(5, 4),  -- Levadura Fresca
(5, 18), -- Huevo
(5, 2);  -- Leche Entera

-- Pan de Centeno
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(6, 7),  -- Harina de Centeno
(6, 2),  -- Leche Entera
(6, 4),  -- Levadura Fresca
(6, 6),  -- Mantequilla
(6, 18); -- Huevo

-- Pan de Avena
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(7, 8),  -- Harina de Avena
(7, 2),  -- Leche Entera
(7, 4),  -- Levadura Fresca
(7, 6),  -- Mantequilla
(7, 18); -- Huevo

-- Pan de Molde
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(8, 1),  -- Harina de Trigo
(8, 2),  -- Leche Entera
(8, 4),  -- Levadura Fresca
(8, 6),  -- Mantequilla
(8, 18); -- Huevo

-- Pan Integral
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(9, 9),  -- Harina Integral
(9, 2),  -- Leche Entera
(9, 4),  -- Levadura Fresca
(9, 6),  -- Mantequilla
(9, 18); -- Huevo

-- Pan Francés
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(10, 1),  -- Harina de Trigo
(10, 2),  -- Leche Entera
(10, 4),  -- Levadura Fresca
(10, 6);  -- Mantequilla

-- Pan de Chocolate
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(11, 1),  -- Harina de Trigo
(11, 5),  -- Chocolate Amargo
(11, 2),  -- Leche Entera
(11, 4),  -- Levadura Fresca
(11, 6),  -- Mantequilla
(11, 18); -- Huevo

-- Pan de Aceitunas
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(12, 1),  -- Harina de Trigo
(12, 2),  -- Leche Entera
(12, 4),  -- Levadura Fresca
(12, 6),  -- Mantequilla
(12, 13); -- Aceitunas

-- Pan de Pascua
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(13, 1),  -- Harina de Trigo
(13, 2),  -- Leche Entera
(13, 4),  -- Levadura Fresca
(13, 6),  -- Mantequilla
(13, 18), -- Huevo
(13, 16); -- Pasas

-- Pan de Maíz
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(14, 14), -- Harina de Maíz
(14, 2),  -- Leche Entera
(14, 4),  -- Levadura Fresca
(14, 6),  -- Mantequilla
(14, 18); -- Huevo

-- Pan de Leche
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(15, 1),  -- Harina de Trigo
(15, 2),  -- Leche Entera
(15, 4),  -- Levadura Fresca
(15, 6),  -- Mantequilla
(15, 18); -- Huevo

-- Pan Brioche
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(16, 1),  -- Harina de Trigo
(16, 2),  -- Leche Entera
(16, 4),  -- Levadura Fresca
(16, 6),  -- Mantequilla
(16, 18), -- Huevo
(16, 3);  -- Azúcar Blanca

-- Pan de Hot Dog
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(17, 1),  -- Harina de Trigo
(17, 2),  -- Leche Entera
(17, 4),  -- Levadura Fresca
(17, 6),  -- Mantequilla
(17, 18); -- Huevo

-- Pan de Hamburguesa
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(18, 1),  -- Harina de Trigo
(18, 2),  -- Leche Entera
(18, 4),  -- Levadura Fresca
(18, 6),  -- Mantequilla
(18, 18); -- Huevo

-- Pan de Chocolate y Avellanas
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(19, 1),  -- Harina de Trigo
(19, 5),  -- Chocolate Amargo
(19, 6),  -- Mantequilla
(19, 18), -- Huevo
(19, 15); -- Avellanas

-- Panecillos de Canela
INSERT INTO ElBuenGusto.RECETA (pro_codigo, mat_codigo)
VALUES
(20, 1),  -- Harina de Trigo
(20, 3),  -- Azúcar Blanca
(20, 6),  -- Mantequilla
(20, 18), -- Huevo
(20, 20); -- Canela

-- Insertar los cargos y salarios
INSERT INTO ElBuenGusto.CARGO (car_tipo, car_salario)
VALUES
('Mesero', 1200000),  -- Mesero: Salario mensual aproximado
('Cajero', 1300000),  -- Cajero: Salario mensual aproximado
('Pastelero', 1600000),  -- Pastelero: Salario mensual aproximado
('Panadero', 1500000),  -- Panadero: Salario mensual aproximado
('Repartidor', 1200000); -- Domiciliario: Salario mensual aproximado

-- Insertar horarios
INSERT INTO ElBuenGusto.HORARIO (hor_id, hor_entrada, hor_salida)
VALUES
(1, '06:00:00', '14:00:00'),  -- Turno mañana (6:00 AM a 2:00 PM)
(2, '07:00:00', '15:00:00'),  -- Turno mañana (7:00 AM a 3:00 PM)
(3, '08:00:00', '16:00:00'),  -- Turno mañana (8:00 AM a 4:00 PM)
(4, '10:00:00', '18:00:00'),  -- Turno tarde (10:00 AM a 6:00 PM)
(5, '12:00:00', '20:00:00'),  -- Turno tarde (12:00 PM a 8:00 PM)
(6, '14:00:00', '22:00:00'),  -- Turno tarde (2:00 PM a 10:00 PM)
(7, '16:00:00', '00:00:00'),  -- Turno nocturno (4:00 PM a 12:00 AM)
(8, '18:00:00', '02:00:00'),  -- Turno nocturno (6:00 PM a 2:00 AM)
(9, '22:00:00', '06:00:00');  -- Turno nocturno (10:00 PM a 6:00 AM)

-- Insertar tipos de gastos fijos
INSERT INTO ElBuenGusto.GASTO (gas_nombre, gas_tipo)
VALUES
('Gas', 'Servicios Públicos'),          -- Gasto de gas
('Agua', 'Servicios Públicos'),         -- Gasto de agua
('Electricidad', 'Servicios Públicos'), -- Gasto de electricidad
('Alquiler', 'Operativo'),              -- Gasto de alquiler del local
('Internet', 'Servicios'),              -- Gasto de internet
('Salarios', 'Operativo'),              -- Gasto en salarios
('Mantenimiento', 'Operativo'),         -- Gasto de mantenimiento de equipos
('Seguridad', 'Servicios'),             -- Gasto en seguridad (alarmas, vigilancia)
('Impuestos', 'Fiscales'),              -- Gasto de impuestos
('Publicidad', 'Marketing'),            -- Gasto en publicidad
('Transporte', 'Operativo'),            -- Gasto en transporte de materias primas
('Licencias', 'Fiscales');              -- Gasto en licencias comerciales o permisos

INSERT INTO PAGO_GASTO (pag_fecha,pag_costo, gas_nombre, ger_documento)
VALUES
('1990-05-15', 150000, 'Electricidad', 108567890), -- Antonio Salazar
('1991-07-20', 130000, 'Gas', 108567890), -- Antonio Salazar
('1992-09-30', 140000, 'Agua', 108567890), -- Antonio Salazar
('1993-12-05', 180000, 'Internet', 108567890), -- Antonio Salazar
('1994-04-10', 200000, 'Alquiler', 108567890), -- Antonio Salazar
('1995-06-17', 170000, 'Electricidad', 108678901), -- Beatriz Morales
('1996-01-28', 160000, 'Gas', 108678901), -- Beatriz Morales
('1997-08-13', 190000, 'Agua', 108678901), -- Beatriz Morales
('1998-11-01', 220000, 'Internet', 108678901), -- Beatriz Morales
('1999-03-20', 210000, 'Alquiler', 108678901), -- Beatriz Morales
('2000-02-15', 250000, 'Electricidad', 108789012), -- José González
('2001-05-22', 240000, 'Gas', 108789012), -- José González
('2002-09-12', 230000, 'Agua', 108789012), -- José González
('2003-11-17', 210000, 'Internet', 108789012), -- José González
('2004-06-28', 220000, 'Alquiler', 108789012), -- José González
('2005-08-02', 180000, 'Electricidad', 108890123), -- Verónica Díaz
('2006-07-14', 160000, 'Gas', 108890123), -- Verónica Díaz
('2007-04-25', 150000, 'Agua', 108890123), -- Verónica Díaz
('2008-05-15', 170000, 'Internet', 108890123), -- Verónica Díaz
('2009-11-30', 190000, 'Alquiler', 108890123), -- Verónica Díaz
('2010-03-18', 210000, 'Electricidad', 108901234), -- Carlos Martínez
('2011-07-05', 220000, 'Gas', 108901234), -- Carlos Martínez
('2012-08-30', 240000, 'Agua', 108901234), -- Carlos Martínez
('2013-11-10', 250000, 'Internet', 108901234), -- Carlos Martínez
('2014-06-12', 230000, 'Alquiler', 109012345), -- Laura Rodríguez
('2015-01-01', 210000, 'Electricidad', 109012345), -- Laura Rodríguez
('2016-08-22', 230000, 'Gas', 109012345), -- Laura Rodríguez
('2017-02-28', 220000, 'Agua', 109012345), -- Laura Rodríguez
('2018-03-05', 240000, 'Internet', 109012345), -- Laura Rodríguez
('2019-10-09', 230000, 'Alquiler', 109012345), -- Laura Rodríguez
('2020-01-15', 250000, 'Electricidad', 109123456), -- Marcos Gutiérrez
('2021-04-19', 220000, 'Gas', 109123456), -- Marcos Gutiérrez
('2022-12-05', 210000, 'Agua', 109123456), -- Marcos Gutiérrez
('2023-07-18', 200000, 'Internet', 109123456), -- Marcos Gutiérrez
('2024-11-10', 180000, 'Alquiler', 109234567), -- Raquel Cordero
('2025-09-22', 190000, 'Electricidad', 109234567); -- Raquel Cordero

INSERT INTO ElBuenGusto.CLIENTE (per_documento)
VALUES
(101123456),
(101234567),
(101345678),
(101456789),
(101567890),
(101678901),
(101789012),
(101890123),
(101901234),
(102012345),
(102123456),
(102234567),
(102345678),
(102456789),
(102567890),
(102678901),
(102789012),
(102890123),
(102901234),
(103012345),
(103123456),
(103234567),
(103345678),
(103456789),
(103567890),
(103678901),
(103789012),
(103890123),
(103901234),
(104012345),
(104123456),
(104234567),
(104345678),
(104456789),
(104567890),
(104678901),
(104789012),
(104890123),
(104901234),
(105012345),
(105123456),
(105234567),
(105345678),
(105456789),
(105567890),
(105678901),
(105789012),
(105890123),
(105901234);

INSERT INTO PERSONAL (pes_fecha_ingreso, pes_dias_trabajados, car_tipo, pes_documento, hor_id, pes_fecha_salida)
VALUES
('2023-01-01', 70, 'Mesero', 100123456, 1, NULL),
('2023-02-01', 128, 'Cajero', 100234567, 2, NULL),
('2023-03-01', 50, 'Pastelero', 100345678, 3, NULL),
('2023-04-01', 95, 'Panadero', 100456789, 4, NULL),
('2023-05-01', 200, 'Repartidor', 100567890, 5, NULL),
('2023-06-01', 20, 'Mesero', 100678901, 6, NULL),
('2023-07-01', 98, 'Cajero', 100789012, 7, NULL),
('2023-08-01', 300, 'Pastelero', 100890123, 8, NULL),
('2023-09-01', 307, 'Panadero', 100901234, 9, NULL),
('2023-10-01', 26, 'Repartidor', 101012345, 1, NULL);

-- Pan de Trigo
INSERT INTO ElBuenGusto.PRODUCTO (pro_codigo, pro_nombre, pro_precio_venta, pro_fecha_fabricacion, pro_fecha_expiracion, pro_cantidad_unidades, cat_id_categoria)
VALUES
(1, 'Pan de Trigo', 3000, '2025-02-10', '2025-02-15', 100, 4);

-- Tarta de Manzana
INSERT INTO ElBuenGusto.PRODUCTO (pro_codigo, pro_nombre, pro_precio_venta, pro_fecha_fabricacion, pro_fecha_expiracion, pro_cantidad_unidades, cat_id_categoria)
VALUES
(2, 'Tarta de Manzana', 12000, '2025-02-10', '2025-02-14', 50, 9);

-- Bizcocho de Chocolate
INSERT INTO ElBuenGusto.PRODUCTO (pro_codigo, pro_nombre, pro_precio_venta, pro_fecha_fabricacion, pro_fecha_expiracion, pro_cantidad_unidades, cat_id_categoria)
VALUES
(3, 'Bizcocho de Chocolate', 15000, '2025-02-10', '2025-02-13', 30, 5);

-- Galletas de Avena
INSERT INTO ElBuenGusto.PRODUCTO (pro_codigo, pro_nombre, pro_precio_venta, pro_fecha_fabricacion, pro_fecha_expiracion, pro_cantidad_unidades, cat_id_categoria)
VALUES
(4, 'Galletas de Avena', 5000, '2025-02-09', '2025-02-16', 200, 8);

-- Croissants
INSERT INTO ElBuenGusto.PRODUCTO (pro_codigo, pro_nombre, pro_precio_venta, pro_fecha_fabricacion, pro_fecha_expiracion, pro_cantidad_unidades, cat_id_categoria)
VALUES
(5, 'Croissants', 7000, '2025-02-10', '2025-02-14', 80, 10);

-- Pan de Centeno
INSERT INTO ElBuenGusto.PRODUCTO (pro_codigo, pro_nombre, pro_precio_venta, pro_fecha_fabricacion, pro_fecha_expiracion, pro_cantidad_unidades, cat_id_categoria)
VALUES
(6, 'Pan de Centeno', 3500, '2025-02-11', '2025-02-16', 60, 4);

-- Pan de Avena
INSERT INTO ElBuenGusto.PRODUCTO (pro_codigo, pro_nombre, pro_precio_venta, pro_fecha_fabricacion, pro_fecha_expiracion, pro_cantidad_unidades, cat_id_categoria)
VALUES
(7, 'Pan de Avena', 3200, '2025-02-11', '2025-02-14', 90, 4);

-- Pan de Molde
INSERT INTO ElBuenGusto.PRODUCTO (pro_codigo, pro_nombre, pro_precio_venta, pro_fecha_fabricacion, pro_fecha_expiracion, pro_cantidad_unidades, cat_id_categoria)
VALUES
(8, 'Pan de Molde', 4000, '2025-02-10', '2025-02-17', 150, 4);

-- Pan Integral
INSERT INTO ElBuenGusto.PRODUCTO (pro_codigo, pro_nombre, pro_precio_venta, pro_fecha_fabricacion, pro_fecha_expiracion, pro_cantidad_unidades, cat_id_categoria)
VALUES
(9, 'Pan Integral', 4500, '2025-02-09', '2025-02-15', 120, 4);

-- Pan Francés
INSERT INTO ElBuenGusto.PRODUCTO (pro_codigo, pro_nombre, pro_precio_venta, pro_fecha_fabricacion, pro_fecha_expiracion, pro_cantidad_unidades, cat_id_categoria)
VALUES
(10, 'Pan Francés', 3500, '2025-02-10', '2025-02-12', 80, 4);

-- Inserción de promociones

-- Promoción de porcentaje: 20% de descuento
INSERT INTO PROMOCION (prm_nombre, prm_tipo, prm_valor, prm_fecha_inicio, prm_fecha_fin) 
VALUES ('Descuento del 20%', 'porcentaje', 20.00, '2025-03-01', '2025-03-31');

-- Promoción de cantidad fija: $50 de descuento
INSERT INTO PROMOCION (prm_nombre, prm_tipo, prm_valor, prm_fecha_inicio, prm_fecha_fin) 
VALUES ('Descuento de $50', 'cantidad_fija', 50.00, '2025-04-01', '2025-04-15');

-- Promoción de "x cantidad": Compra 3 y obtén $100 de descuento
INSERT INTO PROMOCION (prm_nombre, prm_tipo, prm_valor, prm_condicion, prm_fecha_inicio, prm_fecha_fin) 
VALUES ('Compra 3 y obtén $100 de descuento', 'x_cantidad', 100.00, 3, '2025-05-01', '2025-05-15');

-- Promoción navideña: 25% de descuento en todas las compras
INSERT INTO PROMOCION (prm_nombre, prm_tipo, prm_valor, prm_fecha_inicio, prm_fecha_fin) 
VALUES ('Descuento Navideño del 25%', 'porcentaje', 25.00, '2025-12-01', '2025-12-25');

-- Promoción navideña: 2x1 en productos seleccionados
INSERT INTO PROMOCION (prm_nombre, prm_tipo, prm_valor, prm_condicion, prm_fecha_inicio, prm_fecha_fin) 
VALUES ('2x1 en productos seleccionados', 'x_cantidad', 0.00, 2, '2025-12-10', '2025-12-24');

-- Promoción de Año Nuevo: $100 de descuento en compras superiores a $500
INSERT INTO PROMOCION (prm_nombre, prm_tipo, prm_valor, prm_condicion, prm_fecha_inicio, prm_fecha_fin) 
VALUES ('Descuento de $100 por compras mayores a $500 (Año Nuevo)', 'cantidad_fija', 100.00, 500, '2025-12-26', '2025-12-31');

-- Promoción de Black Friday: 40% de descuento en toda la tienda
INSERT INTO PROMOCION (prm_nombre, prm_tipo, prm_valor, prm_fecha_inicio, prm_fecha_fin) 
VALUES ('Descuento Black Friday del 40%', 'porcentaje', 40.00, '2025-11-27', '2025-11-28');

-- Promoción de Día de San Valentín: 15% de descuento en regalos seleccionados
INSERT INTO PROMOCION (prm_nombre, prm_tipo, prm_valor, prm_fecha_inicio, prm_fecha_fin) 
VALUES ('Descuento San Valentín del 15%', 'porcentaje', 15.00, '2025-02-01', '2025-02-14');

-- Relación de productos con promociones

-- Relación del "Pan de Trigo" con la promoción del 20% de descuento
INSERT INTO ElBuenGusto.DETALLE_PROMOCION (prm_id, pro_codigo) 
VALUES (1, 1);  -- prm_id 1 -> 'Descuento del 20%', pro_codigo 1 -> 'Pan de Trigo'

-- Relación de la "Tarta de Manzana" con la promoción de $50 de descuento
INSERT INTO ElBuenGusto.DETALLE_PROMOCION (prm_id, pro_codigo) 
VALUES (2, 2);  -- prm_id 2 -> 'Descuento de $50', pro_codigo 2 -> 'Tarta de Manzana'

-- Relación del "Bizcocho de Chocolate" con la promoción de "Compra 3 y obtén $100 de descuento"
INSERT INTO ElBuenGusto.DETALLE_PROMOCION (prm_id, pro_codigo) 
VALUES (3, 3);  -- prm_id 3 -> 'Compra 3 y obtén $100 de descuento', pro_codigo 3 -> 'Bizcocho de Chocolate'

-- Relación de las "Galletas de Avena" con la promoción navideña del 25% de descuento
INSERT INTO ElBuenGusto.DETALLE_PROMOCION (prm_id, pro_codigo) 
VALUES (4, 4);  -- prm_id 4 -> 'Descuento Navideño del 25%', pro_codigo 4 -> 'Galletas de Avena'

-- Relación de los "Croissants" con la promoción navideña 2x1 en productos seleccionados
INSERT INTO ElBuenGusto.DETALLE_PROMOCION (prm_id, pro_codigo) 
VALUES (5, 5);  -- prm_id 5 -> '2x1 en productos seleccionados', pro_codigo 5 -> 'Croissants'

-- Relación del "Pan de Centeno" con la promoción de Año Nuevo: $100 de descuento por compras mayores a $500
INSERT INTO ElBuenGusto.DETALLE_PROMOCION (prm_id, pro_codigo) 
VALUES (6, 6);  -- prm_id 6 -> 'Descuento de $100 por compras mayores a $500 (Año Nuevo)', pro_codigo 6 -> 'Pan de Centeno'

-- Relación del "Pan de Avena" con la promoción Black Friday: 40% de descuento
INSERT INTO ElBuenGusto.DETALLE_PROMOCION (prm_id, pro_codigo) 
VALUES (7, 7);  -- prm_id 7 -> 'Descuento Black Friday del 40%', pro_codigo 7 -> 'Pan de Avena'

-- Relación del "Pan de Molde" con la promoción del 15% de descuento de San Valentín
INSERT INTO ElBuenGusto.DETALLE_PROMOCION (prm_id, pro_codigo) 
VALUES (8, 8);  -- prm_id 8 -> 'Descuento San Valentín del 15%', pro_codigo 8 -> 'Pan de Molde'

-- Relación del "Pan Integral" con la promoción del 20% de descuento
INSERT INTO ElBuenGusto.DETALLE_PROMOCION (prm_id, pro_codigo) 
VALUES (1, 9);  -- prm_id 1 -> 'Descuento del 20%', pro_codigo 9 -> 'Pan Integral'

-- Relación del "Pan Francés" con la promoción de "Compra 3 y obtén $100 de descuento"
INSERT INTO ElBuenGusto.DETALLE_PROMOCION (prm_id, pro_codigo) 
VALUES (3, 10);  -- prm_id 3 -> 'Compra 3 y obtén $100 de descuento', pro_codigo 10 -> 'Pan Francés'


-- =====================================================
-- Inserción de datos para VENTA y DETALLE_VENTA
-- =====================================================

-- Venta 1: Solo productos internos
INSERT INTO VENTA 
  (ven_precio_total, ven_hora, ven_fecha, ven_tipo_pago, ven_tipo, ven_direccion, per_documento, pes_documento)
VALUES 
  (18000, '10:30:00', '2025-02-14 10:30:00', 'efectivo', 'Venta en tienda', 'Sucursal Centro', 101123456, 1);

-- Detalles Venta 1: 2 unidades de Pan de Trigo (pro_codigo = 1) y 1 unidad de Tarta de Manzana (pro_codigo = 2)
INSERT INTO DETALLE_VENTA 
  (ven_id_venta, det_cantidad_producto, pro_codigo, pre_codigo)
VALUES 
  ((SELECT MAX(ven_id_venta) FROM VENTA), 2, 1, NULL),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 1, 2, NULL);

-- Venta 2: Venta a domicilio (solo productos internos)
INSERT INTO VENTA 
  (ven_precio_total, ven_hora, ven_fecha, ven_tipo_pago, ven_tipo, ven_direccion, per_documento, pes_documento)
VALUES 
  (44000, '12:00:00', '2025-02-14 12:00:00', 'tarjeta', 'Venta a domicilio', 'Calle 123 #45-67', 101234567, 2);

-- Detalles Venta 2: 1 Bizcocho de Chocolate (pro_codigo = 3), 3 Galletas de Avena (pro_codigo = 4) y 2 Croissants (pro_codigo = 5)
INSERT INTO DETALLE_VENTA 
  (ven_id_venta, det_cantidad_producto, pro_codigo, pre_codigo)
VALUES 
  ((SELECT MAX(ven_id_venta) FROM VENTA), 1, 3, NULL),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 3, 4, NULL),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 2, 5, NULL);

-- Venta 3: Venta en tienda (solo productos internos)
INSERT INTO VENTA 
  (ven_precio_total, ven_hora, ven_fecha, ven_tipo_pago, ven_tipo, ven_direccion, per_documento, pes_documento)
VALUES 
  (32400, '14:15:00', '2025-02-14 14:15:00', 'efectivo', 'Venta en tienda', 'Sucursal Norte', 101345678, 3);

-- Detalles Venta 3: 2 Pan de Centeno (pro_codigo = 6), 2 Pan de Avena (pro_codigo = 7), 1 Pan de Molde (pro_codigo = 8),
-- 1 Pan Integral (pro_codigo = 9) y 3 Pan Francés (pro_codigo = 10)
INSERT INTO DETALLE_VENTA 
  (ven_id_venta, det_cantidad_producto, pro_codigo, pre_codigo)
VALUES 
  ((SELECT MAX(ven_id_venta) FROM VENTA), 2, 6, NULL),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 2, 7, NULL),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 1, 8, NULL),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 1, 9, NULL),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 3, 10, NULL);

-- Venta 4: Venta mixta (internos y externos)
INSERT INTO VENTA 
  (ven_precio_total, ven_hora, ven_fecha, ven_tipo_pago, ven_tipo, ven_direccion, per_documento, pes_documento)
VALUES 
  (16000, '15:00:00', '2025-02-14 15:00:00', 'efectivo', 'Venta en tienda', 'Sucursal Sur', 101456789, 4);

-- Detalles Venta 4: 2 Pan de Trigo (interno, pro_codigo = 1) y 5 unidades de Harina de trigo Coca-Cola (externo, pre_codigo = 26)
INSERT INTO DETALLE_VENTA 
  (ven_id_venta, det_cantidad_producto, pro_codigo, pre_codigo)
VALUES 
  ((SELECT MAX(ven_id_venta) FROM VENTA), 2, 1, NULL),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 5, NULL, 26);

-- Venta 5: Venta con solo productos externos
INSERT INTO VENTA 
  (ven_precio_total, ven_hora, ven_fecha, ven_tipo_pago, ven_tipo, ven_direccion, per_documento, pes_documento)
VALUES 
  (22000, '16:30:00', '2025-02-14 16:30:00', 'tarjeta', 'Venta a domicilio', 'Calle 456 #78-90', 101567890, 5);

-- Detalles Venta 5: 2 Leche líquida Pepsico (externo, pre_codigo = 27), 3 Azúcar moreno Hershey's (externo, pre_codigo = 28)
-- y 1 Cocoa en polvo Nestlé (externo, pre_codigo = 30)
INSERT INTO DETALLE_VENTA 
  (ven_id_venta, det_cantidad_producto, pro_codigo, pre_codigo)
VALUES 
  ((SELECT MAX(ven_id_venta) FROM VENTA), 2, NULL, 27),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 3, NULL, 28),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 1, NULL, 30);

-- Venta 6: Venta mixta (internos y externos)
INSERT INTO VENTA 
  (ven_precio_total, ven_hora, ven_fecha, ven_tipo_pago, ven_tipo, ven_direccion, per_documento, pes_documento)
VALUES 
  (24000, '17:45:00', '2025-02-14 17:45:00', 'tarjeta', 'Venta a domicilio', 'Calle 789 #12-34', 101678901, 6);

-- Detalles Venta 6: 1 Croissants (interno, pro_codigo = 5), 2 Mermelada Smucker's (externo, pre_codigo = 31)
-- y 1 Tarta de Manzana (interno, pro_codigo = 2)
INSERT INTO DETALLE_VENTA 
  (ven_id_venta, det_cantidad_producto, pro_codigo, pre_codigo)
VALUES 
  ((SELECT MAX(ven_id_venta) FROM VENTA), 1, 5, NULL),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 2, NULL, 31),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 1, 2, NULL);

-- Venta 7: Venta mixta (internos y externos)
INSERT INTO VENTA 
  (ven_precio_total, ven_hora, ven_fecha, ven_tipo_pago, ven_tipo, ven_direccion, per_documento, pes_documento)
VALUES 
  (23000, '18:30:00', '2025-02-14 18:30:00', 'efectivo', 'Venta en tienda', 'Sucursal Este', 101789012, 7);

-- Detalles Venta 7: 1 Bizcocho de Chocolate (interno, pro_codigo = 3) y 2 Leche condensada La Lechera (externo, pre_codigo = 33)
INSERT INTO DETALLE_VENTA 
  (ven_id_venta, det_cantidad_producto, pro_codigo, pre_codigo)
VALUES 
  ((SELECT MAX(ven_id_venta) FROM VENTA), 1, 3, NULL),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 2, NULL, 33);

-- Venta 8: Venta mixta (internos y externos)
INSERT INTO VENTA 
  (ven_precio_total, ven_hora, ven_fecha, ven_tipo_pago, ven_tipo, ven_direccion, per_documento, pes_documento)
VALUES 
  (15500, '19:15:00', '2025-02-14 19:15:00', 'efectivo', 'Venta en tienda', 'Sucursal Oeste', 101890123, 8);

-- Detalles Venta 8: 2 Croissants (interno, pro_codigo = 5) y 1 Chispas de chocolate M&M's (externo, pre_codigo = 35)
INSERT INTO DETALLE_VENTA 
  (ven_id_venta, det_cantidad_producto, pro_codigo, pre_codigo)
VALUES 
  ((SELECT MAX(ven_id_venta) FROM VENTA), 2, 5, NULL),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 1, NULL, 35);

-- Venta 9: Venta mixta (internos y externos)
INSERT INTO VENTA 
  (ven_precio_total, ven_hora, ven_fecha, ven_tipo_pago, ven_tipo, ven_direccion, per_documento, pes_documento)
VALUES 
  (22000, '20:00:00', '2025-02-14 20:00:00', 'tarjeta', 'Venta a domicilio', 'Calle 321 #98-76', 101901234, 9);

-- Detalles Venta 9: 1 Tarta de Manzana (interno, pro_codigo = 2), 2 Pan Francés (interno, pro_codigo = 10)
-- y 1 Galletas Oreo (externo, pre_codigo = 36)
INSERT INTO DETALLE_VENTA 
  (ven_id_venta, det_cantidad_producto, pro_codigo, pre_codigo)
VALUES 
  ((SELECT MAX(ven_id_venta) FROM VENTA), 1, 2, NULL),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 2, 10, NULL),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 1, NULL, 36);

-- Venta 10: Venta mixta con varios productos
INSERT INTO VENTA 
  (ven_precio_total, ven_hora, ven_fecha, ven_tipo_pago, ven_tipo, ven_direccion, per_documento, pes_documento)
VALUES 
  (14500, '20:45:00', '2025-02-14 20:45:00', 'efectivo', 'Venta en tienda', 'Sucursal Central', 102012345, 10);

-- Detalles Venta 10: 2 Pan de Trigo (interno, pro_codigo = 1), 3 Vainilla extracto McCormick (externo, pre_codigo = 37)
-- y 1 Sirope de maíz Karo (externo, pre_codigo = 38)
INSERT INTO DETALLE_VENTA 
  (ven_id_venta, det_cantidad_producto, pro_codigo, pre_codigo)
VALUES 
  ((SELECT MAX(ven_id_venta) FROM VENTA), 2, 1, NULL),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 3, NULL, 37),
  ((SELECT MAX(ven_id_venta) FROM VENTA), 1, NULL, 38);

-- =====================================================
-- Inserción de datos en DEVOLUCION
-- =====================================================

INSERT INTO ElBuenGusto.DEVOLUCION (dev_id, dev_fecha, dev_estado, per_documento, ger_documento)
VALUES
  (1, '2025-03-01', 'pendiente', 106012345, 108567890),
  (2, '2025-03-05', 'aprobado', 106123456, 109012345),
  (3, '2025-03-10', 'rechazado', 106234567, 108789012),
  (4, '2025-03-15', 'pendiente', 106345678, 108901234),
  (5, '2025-03-20', 'aprobado', 106456789, 109123456),
  (6, '2025-03-25', 'pendiente', 106567890, 109234567),
  (7, '2025-03-28', 'aprobado', 106678901, 108890123),
  (8, '2025-04-01', 'rechazado', 106789012, 109345678),
  (9, '2025-04-05', 'pendiente', 106890123, 108789012),
  (10, '2025-04-10', 'aprobado', 106901234, 109234567);

-- =====================================================
-- Inserción de datos en DETALLE_DEVOLUCION
-- =====================================================

-- Para DEVOLUCION con dev_id = 1:
-- 5 unidades de producto externo (pre_codigo = 26) y 10 unidades de materia (mat_codigo = 1)
INSERT INTO ElBuenGusto.DETALLE_DEVOLUCION (det_cantidad_producto, dev_id, pre_codigo, mat_codigo)
VALUES 
  (5, 1, 26, NULL),
  (10, 1, NULL, 1);

-- Para DEVOLUCION con dev_id = 2:
-- 3 unidades de producto externo (pre_codigo = 28)
INSERT INTO ElBuenGusto.DETALLE_DEVOLUCION (det_cantidad_producto, dev_id, pre_codigo, mat_codigo)
VALUES 
  (3, 2, 28, NULL);

-- Para DEVOLUCION con dev_id = 3:
-- 2 unidades de materia (mat_codigo = 2) y 4 unidades de producto externo (pre_codigo = 30)
INSERT INTO ElBuenGusto.DETALLE_DEVOLUCION (det_cantidad_producto, dev_id, pre_codigo, mat_codigo)
VALUES 
  (2, 3, NULL, 2),
  (4, 3, 30, NULL);

-- Para DEVOLUCION con dev_id = 4:
-- 6 unidades de materia (mat_codigo = 4)
INSERT INTO ElBuenGusto.DETALLE_DEVOLUCION (det_cantidad_producto, dev_id, pre_codigo, mat_codigo)
VALUES 
  (6, 4, NULL, 4);

-- Para DEVOLUCION con dev_id = 5:
-- 8 unidades de producto externo (pre_codigo = 31) y 7 unidades de materia (mat_codigo = 5)
INSERT INTO ElBuenGusto.DETALLE_DEVOLUCION (det_cantidad_producto, dev_id, pre_codigo, mat_codigo)
VALUES 
  (8, 5, 31, NULL),
  (7, 5, NULL, 5);

-- Para DEVOLUCION con dev_id = 6:
-- 4 unidades de materia (mat_codigo = 6), 5 unidades de producto externo (pre_codigo = 32)
-- y 2 unidades de producto externo (pre_codigo = 33)
INSERT INTO ElBuenGusto.DETALLE_DEVOLUCION (det_cantidad_producto, dev_id, pre_codigo, mat_codigo)
VALUES 
  (4, 6, NULL, 6),
  (5, 6, 32, NULL),
  (2, 6, 33, NULL);

-- Para DEVOLUCION con dev_id = 7:
-- 9 unidades de materia (mat_codigo = 7)
INSERT INTO ElBuenGusto.DETALLE_DEVOLUCION (det_cantidad_producto, dev_id, pre_codigo, mat_codigo)
VALUES 
  (9, 7, NULL, 7);

-- Para DEVOLUCION con dev_id = 8:
-- 3 unidades de producto externo (pre_codigo = 34) y 4 unidades de materia (mat_codigo = 8)
INSERT INTO ElBuenGusto.DETALLE_DEVOLUCION (det_cantidad_producto, dev_id, pre_codigo, mat_codigo)
VALUES 
  (3, 8, 34, NULL),
  (4, 8, NULL, 8);

-- Para DEVOLUCION con dev_id = 9:
-- 7 unidades de producto externo (pre_codigo = 35) y 5 unidades de materia (mat_codigo = 9)
INSERT INTO ElBuenGusto.DETALLE_DEVOLUCION (det_cantidad_producto, dev_id, pre_codigo, mat_codigo)
VALUES 
  (7, 9, 35, NULL),
  (5, 9, NULL, 9);

-- Para DEVOLUCION con dev_id = 10:
-- 6 unidades de producto externo (pre_codigo = 36) y 8 unidades de materia (mat_codigo = 10)
INSERT INTO ElBuenGusto.DETALLE_DEVOLUCION (det_cantidad_producto, dev_id, pre_codigo, mat_codigo)
VALUES 
  (6, 10, 36, NULL),
  (8, 10, NULL, 10);


select * from DETALLE_PROMOCION;