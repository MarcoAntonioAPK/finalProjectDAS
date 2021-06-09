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

USE restaurante_db;

#############################################################################################

#ADMIN:
#1.- Puede agregar NUEVO ADMINISTRADOR (+ alert de "Agregado Exitosamente). Este MODULO lo podemos agregar como un botón de los que nos esta enseñando el profe, 
#	pero con una consulta donde muestre primero todos los datos de dicha tabla.
INSERT INTO administrador(adm_usuario, adm_contrasena)
		VALUES('', '');

#2.- Puede agregar NUEVO MESERO (+ alert de "Agregado Exitosamente"). Este MODULO lo podemos agregar como un botón de los que nos esta enseñando el profe, 
#	pero con una consulta donde muestre primero todos los datos de dicha tabla.
INSERT INTO mesero(mesero_usuario, mesero_contrasena, mesero_nombre, mesero_ap_pat, mesero_ap_mat,
mesero_fecha_nacimiento, mesero_fecha_contrato, mesero_genero, mesero_tel_propio, mesero_tel_emergencia, mesero_dir, mesero_activo)
		VALUES('', '', '', '', '', '', '', '', '', '', '');
        
#3.- Puede agregar NUEVA MESA (+ alert de "AgregadoExitosamente"). Este MODULO lo podemos agregar como un botón de los que nos esta enseñando el profe, 
#	pero con una consulta donde muestre primero todos los datos de dicha tabla.
INSERT INTO mesa(mesa_capacidad_personas, mesa_area, mesa_descripcion)
		VALUES(  , '', '');
        
#4.- Puede agregar NUEVO PRODUCTO (+ alert de "AgregadoExitosamente"). Este MODULO lo podemos agregar como un botón de los que nos esta enseñando el profe, 
#	pero con una consulta donde muestre primero todos los datos de dicha tabla.
INSERT INTO producto_menu (prod_nombre, prod_cat_id, prod_costo_unit)
		VALUES('',  ,  );
        
#5.- Puede agregar NUEVA CATEGORIA DE PRODUCTO (+ alert de "AgregadoExitosamente"). Este MODULO lo podemos agregar como un botón de los que nos esta enseñando el profe, 
#	pero con una consulta donde muestre primero todos los datos de dicha tabla.
INSERT INTO categoria_producto (cat_tipo_producto, cat_descripcion)
		VALUES('' , '');
        
#6.- Puede agregar NUEVA DIRECCIÓN (+ alert de "AgregadoExitosamente"). Este MODULO lo podemos agregar como un botón de los que nos esta enseñando el profe, 
#	pero con una consulta donde muestre primero todos los datos de dicha tabla.*/
INSERT INTO direccion (dir_colonia, dir_calle, dir_num_ext, dir_num_int)
		VALUES('', '',  ,  );

# 7.- Puede eliminar ADMINISTRADOR. Este MODULO lo podemos agregar como un botón de los que nos esta enseñando el profe, 
# pero con una consulta donde muestre primero todos los datos de dicha tabla y para que posteriormente refresque dichos datos y se muestren.
DELETE 
	FROM administrador
	WHERE adm_id = 3;

# 8.- Puede eliminar MESERO. Este MODULO lo podemos agregar como un botón de los que nos esta enseñando el profe, 
# pero con una consulta donde muestre primero todos los datos de dicha tabla y para que posteriormente refresque dichos datos y se muestren.
DELETE  
	FROM mesero 
	WHERE mesero_id = 10;

# 9.- Puede eliminar MESA. Este MODULO lo podemos agregar como un botón de los que nos esta enseñando el profe, 
# pero con una consulta donde muestre primero todos los datos de dicha tabla y para que posteriormente refresque dichos datos y se muestren.
DELETE
	FROM mesa 
	WHERE mesa_id = 2;

# 10.- Puede eliminar PRODUCTO. Este MODULO lo podemos agregar como un botón de los que nos esta enseñando el profe, 
# pero con una consulta donde muestre primero todos los datos de dicha tabla y para que posteriormente refresque dichos datos y se muestren.
DELETE 
	FROM producto_menu 
    WHERE producto_menu.prod_id = 1;

# 11.- Puede eliminar CATEGORIA DE PRODUCTO. Este MODULO lo podemos agregar como un botón de los que nos esta enseñando el profe, 
# pero con una consulta donde muestre primero todos los datos de dicha tabla y para que posteriormente refresque dichos datos y se muestren.
DELETE
	FROM categoria_producto 
	WHERE cat_id = 4;

# 12.- Puede eliminar DETALLES ÓRDEN de una ÓRDEN ESPECIFICA. Este MODULO lo podemos agregar como un botón de los que nos esta enseñando el profe, 
# pero con una consulta donde muestre primero todos los datos de dicha tabla y para que posteriormente refresque dichos datos y se muestren.          
DELETE
	FROM detalles_orden
    WHERE detalles_orden.det_ord_id = 1;


# 13.- Puede eliminar ÓRDEN. Este MODULO lo podemos agregar como un botón de los que nos esta enseñando el profe, 
# pero con una consulta donde muestre primero todos los datos de dicha tabla y para que posteriormente refresque dichos datos y se muestren.
DELETE
	FROM orden
    WHERE ord_id = 1;

# 14.- Puede eliminar DIRECCIÓN. Este MODULO lo podemos agregar como un botón de los que nos esta enseñando el profe, 
# pero con una consulta donde muestre primero todos los datos de dicha tabla y para que posteriormente refresque dichos datos y se muestren.
DELETE
	FROM direcciones
    WHERE dir_id = 1;

#15.- Puede consultar todos los datos de la tabla ADMINISTRADOR.
SELECT *
	FROM administrador;
    
#16.- Puede consultar todos los datos de la tabla MESERO.
SELECT *
	FROM mesero; 
    
#17.- Puede consultar todos los datos de la tabla MESA.
SELECT *
	FROM mesa; 
    
#18.- Puede consultar todos los datos de la tabla PRODUCTO.
SELECT producto_menu.prod_nombre, categoria_producto.cat_tipo_producto, categoria_producto.cat_descripcion, producto_menu.prod_costo_unit
	FROM producto_menu
    INNER JOIN categoria_producto
		ON categoria_producto.cat_id = producto_menu.prod_cat_id
    GROUP BY prod_cat_id 
    ORDER BY prod_cat_id  ASC;
    
#19.- Puede consultar todos los datos de la tabla CATEGORIA DE PRODUCTO.
SELECT *
	FROM categoria_producto;  
    
#20.- Puede consultar todos los datos de la tabla ÓRDEN. 
SELECT *
	FROM orden; 
    
#21.- Puede consultar todos los datos de la tabla DETALLES ÓRDEN.
SELECT *
	FROM detalles_orden; 
    
#22.- Puede consultar todos los datos de la tabla DIRECCIÓN. 
SELECT *
	FROM direccion; 
    
#23.- Puede consultar ÓRDENES por MESERO para una fecha especifica.
SELECT *
	FROM mesero
	INNER JOIN orden 
		ON mesero_id = ord_mesero_id
	WHERE ord_fecha_dia = '2021-05-21'
	GROUP BY mesero.mesero_id
	ORDER BY mesero.mesero_id ASC;
        
#24.- Puede consultar ÓRDENES por MESA para una fecha especifica.
SELECT *
	FROM mesa
	INNER JOIN orden 
		ON mesa.mesa_id = ord_mesa_id
	WHERE ord_fecha_dia = '2021-05-21'
	GROUP BY mesa.mesa_id
	ORDER BY mesa.mesa_id ASC;
        
#25.- Puede consultar ÓRDENES por fecha.
SELECT *
	FROM orden
	WHERE ord_fecha_dia= '2021-05-21';


#26.- Puede consultar una ÓRDEN especifica con el ID_ORDEN.
SELECT *
	FROM orden
	WHERE ord_id = 1 ;
    
#27.- Puede consultar DETALLES DE ÓRDEN por ÓRDEN espeficia con el ID_ORDEN.
SELECT *
	FROM detalles_orden
	WHERE det_ord_id = 1;
 /*Verificar si es necesario hacer un INNER JOIN con tabla ORDEN*/   
    
#28.- Puede consultar DETALLES DE ÓRDEN de TODAS LAS ORDENES para fecha especifica.
SELECT *
	FROM detalles_orden
	INNER JOIN orden 
		ON orden.ord_id = detalles_orden.det_ord_id
	WHERE ord_fecha_dia = '2021-05-21';
    
#29.- Puede consultar DETALLES ORDEN especifica con el ID_ORDEN.
SELECT *
	FROM detalles_orden
	INNER JOIN orden
		ON orden.ord_id = detalles_orden.det_ord_id
	WHERE ord_id = 1;
    
#30.- El total de ventas para una fecha
SELECT ord_fecha_dia AS 'Fecha', SUM(ord_total_cuenta) AS 'Total'
	FROM orden
	WHERE ord_fecha_dia = '2021-05-21';	
	
#31.- El total de ventas de toda la vida.
SELECT ord_fecha_dia AS 'Fecha', SUM(ord_total_cuenta) AS 'Total'
	FROM orden;

#32.- Puede editar datos de la tabla ADMINISTRADOR.
UPDATE administrador 
	SET adm_usuario = 'nuevo nombre'
	WHERE adm_usuario LIKE  'nombre anterior';

UPDATE administrador 
	SET adm_contraseña = 'nueva contraseña'
	WHERE adm_usuario LIKE  'contraseña anterior';

#33.- Puede editar datos de la tabla  MESERO.
#ALGUNAS DE LAS CUALES PODEMOS HACER 
UPDATE mesero
	SET mesero_usuario = 'nuevo usuario'
	WHERE mesero_usuario LIKE  'usuario anterior';

UPDATE mesero
	SET mesero_tel_propio = 'nuevo tel'
	WHERE mesero_tel_propio LIKE  'tel anterior';

UPDATE mesero
	SET mesero_activo = 'No'
	WHERE mesero_id =  'id de mesero';


#34.- Puede editar datos de la tabla  MESA.
UPDATE mesa
	SET mesa_capacidad_personas = 'número nuevo de capacidad'
	WHERE mesa_id = 'id de mesa';
	
UPDATE mesa
	SET mesa_area = 'nueva area'
	WHERE mesa_id = 'id de mesa';

UPDATE mesa
	SET mesa_descripción = 'nueva descripción'
	WHERE mesa_id = 'id de mesa';

#35.- Puede editar datos de la tabla  PRODUCTO.
UPDATE producto_menu
	SET producto_nombre = 'nuevo nombre'
	WHERE prod_id  = 'id de mesa';

UPDATE producto_menu
	SET prod_costo_unitario = 'nuevo costo'
	WHERE prod_id  = 'id de mesa';
    
#36.- Puede editar datos de la tabla  CATEGORIA DE PRODUCTO. 
UPDATE categoria_producto
	SET cat_tipo_producto = 'nuevo nombre'
	WHERE cat_id = 'id de categoria';

UPDATE categoria_producto
	SET cat_descripcion = 'nueva descripción'
	WHERE cat_id = 'id de categoria';

#37.- Puede editar datos de la tabla  ÓRDEN.
UPDATE orden
	SET ord_mesa_id = 'nueva mesa'
	WHERE ord_id = 'id de orden';

UPDATE orden
	SET ord_estado = 'Cerrado'
	WHERE ord_id = 'id de orden';

UPDATE orden
	SET ord_mesa_id = 'nueva mesa'
	WHERE ord_id = 'id de orden';

#38.- Puede editar datos de la tabla  DETALLES ÓRDEN.
UPDATE detalles_orden
	SET det_entregeado = 'Sí'
	WHERE det_ord_id = 'id de orden';

UPDATE detalles_orden
	SET det_cantidad = 'Nueva cantidad'
	WHERE det_ord_id = 'id de orden'; 
    
#39.- Puede editar datos de la tabla  DIRECCIÓN. 
UPDATE direccion
	SET dir_colonia = 'Nueva colonia'
	WHERE dir_id = 'id de dirección';

UPDATE direccion
	SET dir_calle = 'Nueva calle'
	WHERE dir_id = 'id de dirección';

UPDATE direccion
	SET dir_num_ext = 'Nuevo número'
	WHERE dir_id = 'id de dirección';

UPDATE direccion
	SET dir_num_int= 'Nuevo número'
	WHERE dir_id = 'id de dirección';

#############################################################################################
# MESERO

# 1.- Puede agregar NUEVA ORDEN (se abre ÓRDEN).
INSERT INTO orden (ord_fecha, ord_mesero_id, ord_mesa_id, ord_estado, ord_detalles, ord_total_cuenta)
	VALUES('', '','','', '', '');

# 2.- Puede agregar PORDUCTOS a dicha ÖRDEN. (IMPORTANTE mostrar que orden es en un RECUADRO GRANDE, además del nombre del MESERO).
INSERT INTO detalles_orden (det_ord_id, det_prod_id, det_cantidad, det_subtotal, det_detalles, det_entregado)
	VALUES ('', '', '', '', '', '');

# 3.- Puede editar PRODUCTOS de la ÓRDEN.
# DEPENDE LO QUE QUIERAS EDITAR, CHECAR LOS PUNTOS DEL 32 AL 39 DE ADMINISTRADOR.
UPDATE detalles_orden 
	SET det_prod_id = '', det_cantidad = '', det_subtotal = '', det_detalles = '', det_entregado = '' 
		WHERE det_ord_id = '' ;

# 4.- Puede eliminar PROCUTOS de la ÓRDEN. 
DELETE FROM detalles_orden 
	WHERE det_ord_id = 1 AND det_prod_id = 1;

# 5.- Si el MESERO quiere eliminar una ORDEN completa, debe acudir con el ADMIN. 
DELETE FROM orden 
	WHERE ord_id = 1 ;

# 6.- Puede consultar el menú, tabla PRODUCTOS.
SELECT producto_menu.prod_nombre, categoria_producto.cat_tipo_producto, categoria_producto.cat_descripcion, producto_menu.prod_costo_unit
	FROM producto_menu
    INNER JOIN categoria_producto
		ON categoria_producto.cat_id = producto_menu.prod_cat_id
    GROUP BY prod_cat_id 
    ORDER BY prod_cat_id  ASC;
        
# 7.- Puede consultar el TOTAL DE CUENTA de cierta ORDEN. (Desde afuera), y también desde ÓRDEN (después de CERRAR ÓRDEN).
#2
SELECT orden.ord_id, orden.ord_total_cuenta
	FROM orden 
		WHERE orden.ord_id = 4;

# 8.- El mesero puede estar realizando varias ÓRDENES, es por eso que debemos manejar lo ORDEN ABIERTA, ORDEN CERRADA.
INSERT INTO orden (ord_fecha, ord_mesero_id, ord_mesa_id, ord_estado, ord_detalles, ord_total_cuenta)
	VALUES('', '','','Abierta', '', ''),
		  ('', '','','Abierta', '', ''),
          ('', '','','Cerrada', '', ''),
          ('', '','','Abierta', '', ''),
          ('', '','','Abierta', '', ''),
          ('', '','','Cerrada', '', '');

# 9.- Debido al punto 8 de este apartado, el MESERO debe poder consultar que todas las ÓRDENES que ha hecho en su vida.
SELECT orden.*
	FROM orden
	INNER JOIN mesero
		ON orden.ord_mesero_id = mesero.mesero_id
	WHERE mesero.mesero_id = 1
		ORDER BY orden.ord_fecha_dia DESC;

# 10.- Debido al punto 8 de este apartado, el MESERO debe poder consultar que todas las ÓRDENES que ha hecho en una fecha especifica. *****************
SELECT orden.*
	FROM orden
    INNER JOIN mesero
		ON orden.ord_mesero_id = mesero.mesero_id
	WHERE (orden.ord_fecha_dia = '2021-05-21') AND mesero.mesero_id = 1; 

# 11.- Debido al punto 8 de este apartado, el MESERO debe poder consultar que todas las ÓRDENES que tiene abiertas todavía.
SELECT orden.*
	FROM orden
    INNER JOIN mesero
    ON orden.ord_mesero_id = mesero.mesero_id
    WHERE mesero_id = 2 AND orden.ord_estado = 'ABIERTA';

# --------------------------------------------------------------------------------------------------------------------------------------                  
# TICKET

SELECT orden.ord_id AS ORDEN_ID, orden.ord_fecha_dia AS DIA, orden.ord_fecha_hora AS HORA, orden.ord_mesa_id AS MESA,
	   CONCAT(mesero.mesero_nombre, ' ', mesero.mesero_ap_pat) As Mesero
       FROM orden
			INNER JOIN mesero
			ON orden.ord_mesero_id = mesero.mesero_id
            WHERE orden.ord_id = 2;

SELECT producto_menu.prod_nombre AS PRODUCTO, producto_menu.prod_costo_unit AS COSTO,
		detalles_orden.det_cantidad AS CANTIDAD, detalles_orden.det_subtotal AS SUBTOTAL
	FROM orden
	INNER JOIN detalles_orden
		ON detalles_orden.det_ord_id = orden.ord_id
	INNER JOIN producto_menu
		ON producto_menu.prod_id = detalles_orden.det_prod_id AND producto_menu.prod_costo_unit
	WHERE orden.ord_id = 2;

SELECT SUM(detalles_orden.det_subtotal) AS TOTAL
	FROM detalles_orden
		INNER JOIN orden
        ON orden.ord_id = det_ord_id
			WHERE orden.ord_id = 2;

# -------------------------------------------------------------------------------------------------------------------------------------- 
#Vista cocina
SELECT orden.ord_id, orden.ord_mesa_id, producto_menu.prod_nombre, detalles_orden.det_cantidad, detalles_orden.det_detalles, detalles_orden.det_entregado
	FROM orden, detalles_orden, producto_menu 
	WHERE det_ord_id = ord_id AND det_prod_id = prod_id AND ord_estado = 'Abierta' AND det_entregado = 'No'
    ORDER BY ord_id; 