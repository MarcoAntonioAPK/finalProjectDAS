#############################################################################################
#	Proyecto de base de batos.																#
#	Descripción: Este archivo SQL crea una base de datos que nos servira para hacer			#
#				 consultas CRUD a través de nustra aplicación en VUE. 						#
#				 La aplicación sirve como un manejador de ordenes en un restaurante.		#
#	Fecha de entrega: 10 de junio de 2021.													#
#	Integrantes:																			#
#			Ángel Ramón Sierra Sánchez. 													#
#			Alejandro Iñiguez Ortiz.														#
#			Bernardo Andrés Bivian Hernández.												#
#			Cristino Navarro Muñoz.															#
#			Marco Antonio Ramírez Pérez.													#
#			Victor Raymundo	González Vela. 													#
#																							#
#	Todos los derechos reservados.															#
#############################################################################################

#Crear Base de datos
CREATE DATABASE IF NOT EXISTS restaurante_db;

USE restaurante_db;

#   Para que la base de datos funcione correctamente cree las siguientes tablas:
# 	1.- administrador
# 	2.- mesa
# 	3.- categoria_producto
# 	4.- mesero
# 	5.- orden
# 	6.- producto_menu
# 	7.- detalles_orden

# 1.- administrador
# Tipo de tabla: independiente
# PrimaryKEY: llave subrogada.
CREATE TABLE IF NOT EXISTS administrador(
	adm_id INT AUTO_INCREMENT,
    adm_usuario VARCHAR(10) NOT NULL,
    adm_contrasena VARCHAR(10) NOT NULL,
    PRIMARY KEY (adm_id)
);

# 2.- mesa
# Tipo de tabla: independiente
# PrimaryKEY: llave subrogada.
CREATE TABLE IF NOT EXISTS mesa(
	mesa_id INT AUTO_INCREMENT,
    mesa_capacidad_personas TINYINT NOT NULL, # Capacidad de personas en la mesa
    mesa_area ENUM('A','B','C','D'), # Ubicacion dentro del restaurante
    mesa_descripcion TEXT(50),
    PRIMARY KEY (mesa_id)
);

# 3.- categoria_producto
# Tipo de tabla: independiente
# PrimaryKEY: llave subrogada.
CREATE TABLE IF NOT EXISTS categoria_producto(
	cat_id INT AUTO_INCREMENT,
    cat_tipo_producto ENUM('Comida','Bebida','Postre')NOT NULL,
    cat_descripcion VARCHAR(50),
    PRIMARY KEY (cat_id)
);

# 4.- mesero
# Tipo de tabla: independiente -- dependiente
# PrimaryKEY: llave subrogada.
CREATE TABLE IF NOT EXISTS mesero(
	mesero_id INT AUTO_INCREMENT,
    mesero_usuario VARCHAR(10) NOT NULL,
    mesero_contrasena VARCHAR(10) NOT NULL,
    mesero_nombre VARCHAR(30) NOT NULL,
    mesero_ap_pat VARCHAR(15) NOT NULL,
    mesero_ap_mat VARCHAR(15),
    mesero_fecha_nacimiento DATE,
    mesero_fecha_contrato DATE NOT NULL,
    mesero_genero ENUM('H','M') NOT NULL,
    mesero_tel_propio VARCHAR(10) ,
    mesero_tel_emergencia VARCHAR(10) NOT NULL,
    mesero_dir VARCHAR(80) NOT NULL,
    mesero_activo ENUM('Si','No'),
    PRIMARY KEY (mesero_id)
);

# 5.- orden
# Tipo de tabla: dependiente
# PrimaryKEY: llave subrogada.
CREATE TABLE IF NOT EXISTS orden(
	ord_id INT AUTO_INCREMENT,
    ord_fecha_dia DATE NOT NULL,
    ord_fecha_hora TIME NOT NULL,
    ord_mesero_id INT NOT NULL,
    ord_mesa_id INT NOT NULL,
    ord_estado ENUM('Abierta','Cerrada') NOT NULL,
    ord_detalles TEXT, # Clientes especiales(necesitan una silla para bebés, necesitan las cosas rápido)
    ord_total_cuenta FLOAT(7,2) NOT NULL,
    PRIMARY KEY (ord_id),
	CONSTRAINT fk_ord_mesero
		FOREIGN KEY (ord_mesero_id)
        REFERENCES mesero(mesero_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT fk_ord_mesa
		FOREIGN KEY (ord_mesa_id)
        REFERENCES mesa(mesa_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

# 6.- producto_menu
# Tipo de tabla: dependiente
# PrimaryKEY: llave subrogada.
CREATE TABLE IF NOT EXISTS producto_menu(
	prod_id INT AUTO_INCREMENT,
    prod_nombre VARCHAR(50) NOT NULL,
    prod_cat_id INT NOT NULL,
    prod_costo_unit FLOAT(7,2) NOT NULL,
    PRIMARY KEY (prod_id),
    CONSTRAINT fk_prod_cat
		FOREIGN KEY (prod_cat_id)
        REFERENCES categoria_producto(cat_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

# 7.- detalles_orden
# Tipo de tabla: dependiente
# PrimaryKEY: llave subrogada.
CREATE TABLE IF NOT EXISTS detalles_orden(
	det_ord_id INT NOT NULL,
    det_prod_id INT NOT NULL,
    det_cantidad INT NOT NULL,
    det_subtotal FLOAT(7,2) NOT NULL,
    det_detalles VARCHAR(50), /*Como quieres el alimento*/
    det_entregado ENUM('Si', 'No'),
    CONSTRAINT fk_detalles_orden_orden
		FOREIGN KEY (det_ord_id)
        REFERENCES orden(ord_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT fk_detalles_orden_producto
		FOREIGN KEY (det_prod_id)
        REFERENCES producto_menu(prod_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

#############################################################################################
#############################################################################################
#############################################################################################
#Insertacion de datos en las tablas

#1.- Inserción de datos en la tabla de administrador

INSERT INTO administrador(adm_usuario,adm_contrasena)
	VALUES('CAR105', 'R4171'),
		  ('JOS105', 'R4172'),
          ('MAR105', 'R4173'),
          ('BRE105', 'R4174'),
          ('GEN105', 'R4175');
          
#2.- Inserción de datos en la tabla de mesa
INSERT INTO mesa(mesa_capacidad_personas, mesa_area, mesa_descripcion)
	VALUES(2, 'A', 'La mesa esta en la terraza'),
		  (2, 'A', 'La mesa esta en la terraza, lado norte'),
          (2, 'B', 'La mesa esta a un costado de la pecera'),
          (5, 'A', 'La mesa esta en la terraza, entrando'),
          (5, 'B', ''),
          (5, 'C', 'La mesa se encuentra a un costado de la ventana'),
          (8, 'A', 'La mesa esta en la terraza, lado sur'),
          (8, 'B', 'La mesa se encuentra en la zona de la terraza'),
          (10, 'C', 'La mesa esta a un costado del baño'),
          (15, 'C', '');
          
#3.- Inserción de datos en la tabla de categoria_producto
INSERT INTO categoria_producto (cat_tipo_producto, cat_descripcion)
			VALUES('Comida', 'Ensaladas'),
				  ('Comida', 'Sopas'),
                  ('Comida', 'Carnes'),
				  ('Comida', 'Pescados'),
                  ('Comida', 'Pastas'),
				  ('Bebida', 'Refrescos'),
                  ('Bebida', 'Aguas'),
				  ('Bebida', 'Cafes'),
                  ('Bebida', 'Malteadas'),
				  ('Postre', 'Pasteles'),
                  ('Postre', 'Pays'),
                  ('Postre', 'Frutas'),
                  ('Postre', 'Helados');

#4.- Inserción de datos en la tabla de mesero	
INSERT INTO mesero(mesero_usuario, mesero_contrasena, mesero_nombre, mesero_ap_pat, mesero_ap_mat,
mesero_fecha_nacimiento, mesero_fecha_contrato, mesero_genero, mesero_tel_propio, mesero_tel_emergencia, mesero_dir, mesero_activo)
	VALUES('FER12', '1213L', 'Fernando', 'Meza', 'Torres', '1997-04-19', '2020-03-30', 'H', '4772514351', '4771056325', 'Calle 5 de marzo #13, zona centro, Salamanca', 'Si'),
		  ('MAR55', 'M56HT', 'Maria', 'Fernandez', 'Oliva', '1998-11-04', '2019-04-15', 'M', '4771428936', '4771104857', 'Calle Morelos  #25, col Bellavista, Salamanca', 'Si'),
          ('EST78', '78ES3', 'Esteban', 'Canales', 'Juarez', '1999-05-24', '2020-11-01', 'H', '4742837141', '4741416320', 'Calle Auza #4, zona centro, Irapuato', 'Si'),
          ('JUL98', '11J36', 'Julian', 'Bernal', 'Perez', '1996-01-21', '2019-04-15', 'H', '4778747125', '4771057496', 'Calle Romita #10, col San Francisco, Salamanca', 'No'),
          ('GRA33', 'G1236L', 'Graciela', 'Vasquez', 'Montes', '1999-06-18', '2021-01-01', 'M', '4728514341', '4721078935', 'Calle 16 de septiembre #2, col Humanista, Salamanca', 'Si'),
          ('JOS12', '87J34', 'Jose', 'Ornelas', 'Olguin', '1999-08-24', '2020-03-30', 'H', '4742314319', '4721026775', 'Calle Candido Navarro #48, zona centro, Salamanca', 'Si'),
          ('N421R', 'N31024', 'Nandi', 'Canales', 'Hernandez', '1998-02-05', '2019-11-15', 'M', '4771014388', '4771140204', 'Calle Juarez #69, col Villa Petrolera, Salamanca', 'Si'),
          ('RO524', 'R36C1', 'Roberto', 'Lopez', 'Navarro', '1994-10-22', '2018-12-01', 'H', '4722511592', '4721010809', 'Calle Oliva #255, zona centro, Salamanca', 'No'),
          ('CR097', 'CR1B3', 'Cristina', 'Velazquez', 'Sanchez', '1999-08-31', '2019-06-30', 'M', '4322514357', '4321056147', 'Calle Condesa #104, zona centro, Irapuato', 'Si'),
          ('FEC48', 'F154E', 'Fernanda', 'Serna', 'Hurtado', '1998-05-03', '2020-01-01', 'M', '4742514858', '4721056674', 'Calle Carranza #75, col Pirul, Salamanca', 'Si');

#5.- Inserción de datos en la tabla de orden	
INSERT INTO orden(ord_fecha_dia, ord_fecha_hora, ord_mesero_id, ord_mesa_id, ord_estado, ord_detalles, ord_total_cuenta)
	VALUES('2021-05-21', '14:25:14', 1, 2, 'Abierta', '', 250.48),
		  ('2021-05-23', '13:18:09', 3, 1, 'Abierta', 'Se necesita porta sombrero', 370.00),
          ('2021-05-21', '10:21:36', 5, 5, 'Cerrada', 'Se necesita una silla porta niños', 210.48),
		  ('2021-05-21', '15:14:14', 4, 4, 'Abierta', 'Se necesita una silla extra', 415.00),
          ('2021-05-21', '16:02:26', 6, 3, 'Abierta', '', 158.65),
		  ('2021-05-21', '13:05:00', 7, 8, 'Abierta', 'En la mesa se necesita un sujeta sombreros y una silla porta niños', 515.89),
          ('2021-05-21', '09:45:11', 8, 9, 'Cerrada', '', 275.00),
		  ('2021-05-21', '12:47:56', 2, 10, 'Abierta', 'Se necesita un porta bolsas', 385.30),
          ('2021-05-21', '11:28:47', 10, 6, 'Abierta', '', 160.85),
		  ('2021-05-21', '09:55:12', 9, 7, 'Abierta', 'Se necesita una silla porta niños', 185.50);

#6.- Inserción de datos en la tabla producto_menu				
INSERT INTO producto_menu (prod_nombre, prod_cat_id, prod_costo_unit)
			VALUES('Ensalada de pepino', 1, 50.49),
				  ('Esalada de frutos rojos', 1, 50.49),
				  ('Ensalada verde', 1, 50.49),
				  ('Sopa de camarones', 2, 125.00),
				  ('Sopa de pollo', 2, 110.00),
                  ('Sopa de verduras', 2, 90.50),
                  ('Chuleta de res', 3, 150.00),
                  ('Chuleta ahumada', 3, 140.00),
                  ('Corte brazileño', 3, 180.00),
                  ('Corte New York', 3, 150.00),
                  ('Arrachera', 3, 210.50),
                  ('Pezcado frito', 4, 175.00),
                  ('Salmon', 4, 210.00),
                  ('Pezcado asado', 4, 180.50),
                  ('Filete', 4, 150.00),
                  ('Pasta con crema', 5, 95.00),
                  ('Pasta alfredo', 5, 120.50),
                  ('Pasta a la boloñesa', 5, 95.00),
                  ('Pasta con queso', 5, 95.50),
                  ('Coca cola', 6, 15.00),
                  ('Sprite', 6, 15.00),
                  ('Manzanita', 6, 15.00),
                  ('Miranda', 6, 15.00),
                  ('Agua de fresa', 7, 15.00),
                  ('Agua de naranja', 7, 15.00),
                  ('Agua de limon', 7, 15.00),
                  ('Agua de horchata', 7, 15.00),
                  ('Expreso', 8, 25.00),
                  ('Capuchino', 8, 30.00),
                  ('Malteada de fresa', 9, 15.00),
                  ('Malteada de vainilla', 9, 15.00),
                  ('Malteada de mocha', 9, 15.00),
                  ('Pastel de chocolate', 10, 55.00),
                  ('Pastel de queso', 10, 55.00),
                  ('Pastel de tres leches', 10, 55.00),
                  ('Pay de queso', 11, 30.00),
                  ('Pay de piña', 11, 30.00),
                  ('Pay de fresa', 11, 30.00),
                  ('Fresas con crema', 12, 40.00),
                  ('Piña y melon', 12, 40.00),
                  ('Mango y sandia', 12, 40.00),
                  ('Banana split', 13, 60.00),
                  ('Helado napolitano', 13, 60.00),
                  ('Helado de fresa', 13, 60.00);
     
#7.-Inserción de datos en la tabla producto_menu
INSERT INTO detalles_orden(det_ord_id, det_prod_id, det_cantidad, det_subtotal, det_detalles,det_entregado)
			VALUES(1, 1, 1, 50.49, 'La ensalda de pepino no se entrego', 'Si'),
				  (2, 8, 1, 140.00, 'La chuleta ahumada estaba fria', 'Si'),
				  (2, 18, 2, 190.00, 'La pasta en con doble queso', 'Si'),
				  (3, 24, 1, 15.00, 'El agua no lleva hielo', 'Si'),
				  (5, 30, 1, 15.00, 'La malteada de fresa es sin azucar', 'No'),
				  (2, 13, 1, 210.00, 'El salmon es a la plancha', 'Si'),
				  (6, 28, 2, 60.00, 'Los cafes son sin azucar', 'No'),
				  (8, 42, 1, 60, 'Lleva poco chocolate', 'Si');
                  
