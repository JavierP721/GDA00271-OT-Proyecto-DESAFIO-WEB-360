--CATALOGOS
CREATE TABLE TB_ROL (
	ID_ROL INT IDENTITY (1,1) PRIMARY KEY,
	ROL NVARCHAR(45) NOT NULL
);

CREATE TABLE TB_ESTADO (
	ID_ESTADO INT IDENTITY (1,1) PRIMARY KEY, 
	ESTADO NVARCHAR(45) NOT NULL
); 

--TABLAS
CREATE TABLE TB_CLIENTE (
	ID_CLIENTE INT IDENTITY (1,1) PRIMARY KEY,
	RAZON_SOCIAL NVARCHAR(245),
	NOMBRE_COMERCIAL NVARCHAR(345),
	DIRECCION_ENTREGA NVARCHAR(100),
	TELEFONO NVARCHAR(8),
	EMAIL NVARCHAR(45)
);

CREATE TABLE TB_USUARIO (
	ID_USUARIO INT IDENTITY (1,1) PRIMARY KEY,
	ID_ROL INT,
	ID_ESTADO INT,
	CORREO NVARCHAR(45),
	NOMBRE_COMPLETO NVARCHAR(45),
	PASSWORD_USUARIO NVARCHAR(45),
	TELEFONO NVARCHAR(8),
	FECHA_NACIMIENTO DATE,
	FECHA_CREACION DATETIME,
	ID_CLIENTE INT

	FOREIGN KEY (ID_ROL) REFERENCES TB_ROL (ID_ROL),
	FOREIGN KEY (ID_ESTADO) REFERENCES TB_ESTADO (ID_ESTADO),
	FOREIGN KEY (ID_CLIENTE) REFERENCES TB_CLIENTE (ID_CLIENTE)
);

CREATE TABLE TB_CATEGORIA_PRODUCTO (
	ID_CATEGORIA INT IDENTITY (1,1) PRIMARY KEY, 
	ID_USUARIO INT,
	CATEGORIA NVARCHAR(45),
	ID_ESTADO INT,
	FECHA_CREACION DATETIME

	FOREIGN KEY (ID_USUARIO) REFERENCES TB_USUARIO (ID_USUARIO),
	FOREIGN KEY (ID_ESTADO) REFERENCES TB_ESTADO (ID_ESTADO)
);

CREATE TABLE TB_PRODUCTO (
	ID_PRODUCTO INT IDENTITY (1,1) PRIMARY KEY,
	ID_CATEGORIA INT,
	ID_USUARIO INT,
	NOMBRE_PRODUCTO NVARCHAR (45),
	MARCA NVARCHAR (45),
	CODIGO NVARCHAR (45),
	STOCK FLOAT,
	ID_ESTADO INT,
	PRECIO FLOAT,
	FECHA_CREACION DATETIME,
	FOTO BINARY

	FOREIGN KEY (ID_CATEGORIA) REFERENCES TB_CATEGORIA_PRODUCTO (ID_CATEGORIA),
	FOREIGN KEY (ID_USUARIO) REFERENCES TB_USUARIO (ID_USUARIO),
	FOREIGN KEY (ID_ESTADO) REFERENCES TB_ESTADO (ID_ESTADO)
);

CREATE TABLE TB_ORDEN (
	ID_ORDEN INT IDENTITY (1,1) PRIMARY KEY, 
	ID_USUARIO INT, 
	ID_ESTADO INT,
	FECHA_CREACION DATETIME,
	NOMBRE_COMPLETO NVARCHAR(45),
	DIRECCION NVARCHAR(100),
	TELEFONO NVARCHAR(8),
	CORREO NVARCHAR(45),
	FECHA_ENTREGA DATE, 
	TOTAL_ORDEN FLOAT

	FOREIGN KEY (ID_USUARIO) REFERENCES TB_USUARIO (ID_USUARIO),
	FOREIGN KEY (ID_ESTADO) REFERENCES TB_ESTADO (ID_ESTADO)
);

CREATE TABLE TB_DETALLE_ORDEN (
	ID_DETALLE_ORDEN INT IDENTITY (1,1) PRIMARY KEY, 
	ID_ORDEN INT,
	ID_PRODUCTO INT, 
	CANTIDAD INT,
	PRECIO FLOAT,
	SUBTOTAL FLOAT

	FOREIGN KEY (ID_ORDEN) REFERENCES TB_ORDEN (ID_ORDEN),
	FOREIGN KEY (ID_PRODUCTO) REFERENCES TB_PRODUCTO (ID_PRODUCTO)
);


--INSERCION MANUAL DE DATOS EN TABLAS 
--TABLA ROL
INSERT INTO TB_ROL (ROL) VALUES 
('CLIENTE'),
('OPERADOR');

--TABLA ESTADO
INSERT INTO TB_ESTADO (ESTADO) VALUES 
('ACTIVO'),
('INACTIVO');

--TABLA CLIENT
INSERT INTO TB_CLIENTE (RAZON_SOCIAL, NOMBRE_COMERCIAL, DIRECCION_ENTREGA, TELEFONO, EMAIL) VALUES 
('Empresa ACB', 'ABC', 'Villa Hermosa 1 zona 7 San Miguel Petapa', '23845800', 'contacto@abc.com'),
('Empresa 123', '123', 'Calzada Roosevelt 14-82 zona 7 Guatemala, ', '42716754', 'ventas@123.com'),
('Empresa XYZ', 'XYZ', 'Calzada San Juan -82 zona 3 Mixco, ', '54786933', 'info@xyz.com');

--TABLA USUARIO
INSERT INTO TB_USUARIO (ID_ROL, ID_ESTADO, CORREO, NOMBRE_COMPLETO, PASSWORD_USUARIO, TELEFONO, FECHA_NACIMIENTO, FECHA_CREACION, ID_CLIENTE) VALUES 
(1, 1, 'henry@abc.com', 'Henry Perez', 'usuario123', '55511111', '1980-01-01', GETDATE(), 1),
(1, 1, 'victoria@abc.com', 'Victoria Gomez', 'usuario456', '55522222', '1990-05-15', GETDATE(), 1),
(1, 2, 'julia@abc.com', 'Julia Pereira', 'usuario678', '55533333', '1995-08-06', GETDATE(), 1),

(1, 1, 'lucia@123.com', 'Lucia Fernandez', 'luci1234', '67823456', '1989-03-17', GETDATE(), 2),
(1, 1, 'diego@123.com', 'Diego Martinez', 'diegom123', '78945874', '1995-11-22', GETDATE(), 2),

(1, 1, 'sofia@xyz.com', 'Sofia Rodriguez', 'sofia1234', '23587485', '2001-07-06', GETDATE(), 3),
(1, 1, 'maria@xyz.com', 'Maria Garcia', 'maria123', '45896214', '1987-12-30', GETDATE(), 3),
(1, 2, 'carlos@xyz.com', 'Carlos Sanchez', 'carlos456', '58774121', '1993-09-14', GETDATE(), 3),

(1, 1, 'javier@gmail.com', 'Javier Lopez', 'javier123', '58968777', '1987-05-07', GETDATE(), NULL),
(1, 1, 'anatorres@gmail.com', 'Ana Torres', 'ana456', '58693210', '1999-02-17', GETDATE(), NULL),
(1, 1, 'elena@hotmail.com', 'Elena Morales', 'elena567', '50214588', '1985-08-11', GETDATE(), NULL),
(1, 1, 'miguel@hotmail.com', 'Miguel Ruiz', 'miguel123', '42633302', '1997-01-03', GETDATE(), NULL),
(1, 1, 'pablo@outlook.com', 'Pablo Jimenez', 'pablo123', '48777410', '1983-10-19', GETDATE(), NULL),

(2, 1, 'admin1@tienda.com', 'Pedro Culajay', 'admin123', '55533333', '1985-10-30', GETDATE(), NULL),
(2, 1, 'admin2@tienda.com', 'Ana Lopez', 'admin456', '44558899', '1985-10-30', GETDATE(), NULL),

(1, 1, 'saul@outlook.com', 'Saul Mendez', 'saul456', '78852014', '1994-11-20', GETDATE(), NULL),
(1, 1, 'lisa@outlook.com', 'Lisa Marroquin', 'lisa123', '98568547', '1999-12-08', GETDATE(), NULL),
(1, 1, 'jorge@outlook.com', 'Jorge Castillo', 'jorge123', '98745200', '1999-11-18', GETDATE(), NULL),
(1, 1, 'saul@outlook.com', 'Saul Mendez', 'saul456', '78852014', '1994-11-20', GETDATE(), NULL),
(1, 1, 'lisa@outlook.com', 'Lisa Marroquin', 'lisa123', '98568547', '1999-12-08', GETDATE(), NULL),
(1, 1, 'joan@gmail.com', 'Joan Villatoro', 'jovillatoro123', '53658965', '1980-08-08', GETDATE(), NULL);

--TABLA CATEGORIA PRODUCTO
INSERT INTO TB_CATEGORIA_PRODUCTO (ID_USUARIO, CATEGORIA, ID_ESTADO, FECHA_CREACION) VALUES 
(14, 'COMESTIBLES', 1, GETDATE()),
(14, 'HOGAR', 1, GETDATE()),
(15, 'ELECTRODOMESTICOS', 1, GETDATE()),
(15, 'COMPUTACION', 1, GETDATE());

--TABLA PRODUCTO
INSERT INTO TB_PRODUCTO (ID_CATEGORIA, ID_USUARIO, NOMBRE_PRODUCTO, MARCA, CODIGO, STOCK, ID_ESTADO, PRECIO, FECHA_CREACION, FOTO) VALUES 
(1, 14, 'Arroz lb', 'Marca X', 'COM-001', 0, 1, 4.50, GETDATE(), NULL),
(1, 14, 'Frijoles 500g', 'Marca Y', 'COM-002', 0, 1, 5.00, GETDATE(), NULL),
(1, 14, 'Azucar lb', 'Marca Z', 'COM-003', 0, 1, 4.00, GETDATE(), NULL),
(2, 14, 'Servilleta de tela', 'HogarPlus', 'HOG-001', 0, 1, 2.00, GETDATE(), NULL),
(2, 14, 'Plato ceramica', 'HogarLux', 'HOG-002', 0, 1, 3.50, GETDATE(), NULL),

(3, 15, 'Microondas', 'TechHome', 'ELEC-001', 0, 2, 899.99, GETDATE(), NULL),
(4, 15, 'Laptop Core i5', 'CompuTech', 'COMP-001', 0, 2, 5799.99, GETDATE(), NULL),

(1, 14, 'Aceite de cocina lt', 'Marca X', 'COM-004', 15, 1, 12.50, GETDATE(), NULL),
(1, 14, 'Cafe 500g', 'Marca Y', 'COM-005', 10, 1, 10.00, GETDATE(), NULL),
(2, 14, 'Cubiertos', 'HogarPro', 'HOG-003', 20, 1, 12.00, GETDATE(), NULL),
(2, 14, 'Sarten antiadherente', 'HogarChef', 'HOG-004', 5, 1, 15.99, GETDATE(), NULL),
(3, 15, 'Refrigerador', 'CoolTech', 'ELEC-002', 3, 1, 2450.00, GETDATE(), NULL),
(3, 15, 'Televisor LED 42"', 'VisualTech', 'ELEC-003', 7, 1, 3250.00, GETDATE(), NULL),
(4, 15, 'Monitor Full HD 24"', 'CompuVision', 'COMP-002', 12, 1, 2120.00, GETDATE(), NULL),
(4, 15, 'Impresora Multifuncional', 'PrintMaster', 'COMP-003', 8, 1, 5080.00, GETDATE(), NULL),
(1, 14, 'Harina de Trigo lb', 'Marca Z', 'COM-006', 25, 1, 11.20, GETDATE(), NULL),
(2, 14, 'Silla plegable', 'HogarClean', 'HOG-005', 10, 1, 35.00, GETDATE(), NULL),
(3, 15, 'Licuadora', 'TechMix', 'ELEC-004', 6, 1, 245.00, GETDATE(), NULL),
(4, 15, 'Teclado', 'CompuKey', 'COMP-004', 18, 1, 225.00, GETDATE(), NULL),
(1, 14, 'Margarina', 'Marca X', 'COM-007', 30, 1, 14.70, GETDATE(), NULL),
(2, 14, 'Cortina de Ba�o', 'HogarDeco', 'HOG-006', 8, 1, 12.50, GETDATE(), NULL),
(3, 15, 'Plancha', 'IronTech', 'ELEC-005', 4, 1, 222.99, GETDATE(), NULL),
(4, 15, 'Mouse', 'CompuMouse', 'COMP-005', 14, 1, 118.00, GETDATE(), NULL),
(1, 14, 'Jugo de naranja lt', 'Marca Z', 'COM-008', 20, 1, 22.30, GETDATE(), NULL),
(2, 14, 'Lampara', 'HogarLight', 'HOG-007', 5, 1, 318.00, GETDATE(), NULL),
(3, 15, 'Ventilador', 'CoolHome', 'ELEC-006', 2, 1, 135.00, GETDATE(), NULL),
(4, 15, 'Bocina bluetooth', 'CompuSound', 'COMP-006', 6, 1, 350.00, GETDATE(), NULL);

--TABLA ORDER
INSERT INTO TB_ORDEN (ID_USUARIO, ID_ESTADO, FECHA_CREACION, NOMBRE_COMPLETO, DIRECCION, TELEFONO, CORREO, FECHA_ENTREGA, TOTAL_ORDEN)
VALUES 
(1, 1, '2024-01-01', 'Henry Perez', 'Calle Principal 123', '55511111', 'henry@abc.com', '2024-12-05', 46.20),
(2, 1, '2024-02-02', 'Victoria Gomez', 'Avenida Central 45', '55522222', 'victoria@abc.com', '2024-12-06', 49.99),
(4, 1, '2024-02-03', 'Lucia Fernandez', 'Zona 2, Edificio 3', '67823456', 'lucia@123.com', '2024-12-07', 84.70),
(5, 1, '2024-02-04', 'Diego Martinez', 'Colonia Centro', '78945874', 'diego@123.com', '2024-12-08', 4912.5),
(6, 1, '2024-03-05', 'Sofia Rodriguez', 'Residencial Las Palmas', '23587485', 'sofia@xyz.com', '2024-12-09', 170.00),
(7, 1, '2024-03-06', 'Maria Garcia', 'Calle 8, Zona 10', '45896214', 'maria@xyz.com', '2024-12-10', 122.50),
(9, 1, '2024-04-06', 'Javier Lopez', 'Colonia Los Arcos', '58968777', 'javier@gmail.com', '2024-12-10', 306.38),
(10, 2, '2024-05-07', 'Ana Torres', 'Residencial San Jose', '58693210', 'anatorres@gmail.com', '2024-12-11', 375.10),
(11, 1, '2024-06-07', 'Elena Morales', 'Sector C, Zona 7', '50214588', 'elena@hotmail.com', '2024-12-11', 287.39),
(12, 1, '2024-07-08', 'Miguel Ruiz', 'Boulevard Principal', '42633302', 'miguel@hotmail.com', '2024-12-12', 2699.00),
(13, 1, '2024-07-08', 'Pablo Jimenez', 'Condominio Las Brisas', '48777410', 'pablo@outlook.com', '2024-12-12', 485.00), 
(17, 1, '2024-08-09', 'Lisa Marroquin', 'Zona 1, Ciudad Nueva', '98568547', 'lisa@outlook.com', '2024-12-13', 92.00), 
(18, 1, '2024-08-09', 'Jorge Castillo', 'Apartamentos El Encanto', '98745200', 'jorge@outlook.com', '2024-12-13', 2549.40),
(7, 1, '2024-08-09', 'Maria Garcia', 'Calle 8, Zona 10', '45896214', 'maria@xyz.com', '2024-12-13', 112.10), 
(9, 1, '2024-08-09', 'Javier Lopez', 'Colonia Los Arcos', '58968777', 'javier@gmail.com', '2024-12-13', 317.00),
(10, 2, '2024-09-10', 'Ana Torres', 'Residencial San Jose', '58693210', 'anatorres@gmail.com', '2024-12-14', 2644.40),
(11, 1, '2024-09-10', 'Elena Morales', 'Sector C, Zona 7', '50214588', 'elena@hotmail.com', '2024-12-14', 414.40),
(7, 1, '2024-10-11', 'Maria Garcia', 'Calle 8, Zona 10', '45896214', 'maria@xyz.com', '2024-12-15', 302.99), 
(12, 2, '2024-11-11', 'Miguel Ruiz', 'Boulevard Principal', '42633302', 'miguel@hotmail.com', '2024-12-15', 5180.09), 
(13, 1, '2024-12-02', 'Pablo Jimenez', 'Condominio Las Brisas', '48777410', 'pablo@outlook.com', '2024-12-16', 122.37),
(11, 1, '2024-12-03', 'Elena Morales', 'Sector C, Zona 7', '50214588', 'elena@hotmail.com', '2024-12-16', 535.00); 

--TABLA DETALLE ORDEN
INSERT INTO TB_DETALLE_ORDEN (ID_ORDEN, ID_PRODUCTO, CANTIDAD, PRECIO, SUBTOTAL)
VALUES 
(1, 8, 2, 12.5, 25.00), 
(1, 9, 2, 10.0, 20.00), 
(1, 16, 1, 11.2, 11.20), 

(2, 9, 1, 10.0, 10.00), 
(2, 11, 1, 15.99, 15.99), 
(2, 10, 2, 12.0, 24.00), 

(3, 17, 2, 35.0, 70.00), 
(3, 20, 1, 14.7, 14.70), 

(4, 21, 1, 12.5, 12.50),
(4, 12, 2, 2450.0, 4900.00), 

(5, 26, 1, 135.0, 135.00), 
(5, 17, 1, 35.0, 35.00),

(6, 8, 3, 12.5, 37.50), 
(6, 9, 4, 10.0, 40.00), 
(6, 17, 1, 35.0, 35.00),
(6, 9, 1, 10.0, 10.00), 

(7, 11, 2, 15.99, 31.98),
(7, 18, 1, 245.0, 245.00), 
(7, 20, 2, 14.7, 29.40), 

(8, 24, 2, 22.3, 44.60),
(8, 25, 1, 318.0, 318.00), 
(8, 21, 1, 12.5, 12.50), 

(9, 17, 1, 35.0, 35.00), 
(9, 20, 2, 14.7, 29.40),
(9, 22, 1, 222.99, 222.99),

(10, 10, 2, 12.0, 24.00), 
(10, 12, 1, 2450.0, 2450.00), 
(10, 19, 1, 225.0, 225.00),

(11, 26, 1, 135.0, 135.00),
(11, 27, 1, 350.0, 350.00), 

(12, 8, 4, 12.5, 50.00), 
(12, 9, 3, 10.0, 30.00), 
(12, 10, 1, 12.0, 12.00), 

(13, 12, 1, 2450.0, 2450.00), 
(13, 17, 2, 35.0, 70.00), 
(13, 20, 2, 14.7, 29.40),

(14, 8, 3, 12.5, 37.50), 
(14, 24, 2, 22.3, 44.60), 
(14, 9, 3, 10.0, 30.00), 

(15, 10, 1, 12.0, 12.00),
(15, 17, 1, 35.0, 35.00), 
(15, 18, 1, 245.0, 245.00), 
(15, 21, 2, 12.5, 25.00), 

(16, 12, 1, 2450.0, 2450.00), 
(16, 20, 2, 14.7, 29.40), 
(16, 26, 1, 135.0, 135.00), 
(16, 9, 3, 10.0, 30.00), 

(17, 27, 1, 350.0, 350.00), 
(17, 17, 1, 35.0, 35.00),  
(17, 20, 2, 14.7, 29.40), 

(18, 8, 4, 12.5, 50.00), 
(18, 19, 1, 225.0, 225.00), 
(18, 11, 1, 15.99, 15.99),
(18, 10, 1, 12.0, 12.00), 

(19, 24, 2, 22.3, 44.60), 
(19, 12, 2, 2450.0, 4900.00),
(19, 22, 1, 222.99, 222.99),
(19, 21, 1, 12.5, 12.50), 

(20, 11, 3, 15.99, 47.97), 
(20, 17, 1, 35.0, 35.00),
(20, 20, 2, 14.7, 29.40), 
(20, 9, 1, 10.0, 10.00), 

(21, 8, 2, 12.5, 25.00),
(21, 27, 1, 350.0, 350.00),
(21, 26, 1, 135.0, 135.00),
(21, 21, 2, 12.5, 25.00);


--PROCEDIMIENTOS ALMACENADOS POR TABLAS

--TABLA ROL
CREATE PROCEDURE SP_AGREGAR_ROL
    @NOMBRE_ROL NVARCHAR(45)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM TB_ROL WHERE ROL = @NOMBRE_ROL)
    BEGIN
        PRINT 'El rol ya existe. Ingrese un rol diferente';
        RETURN;
    END

    INSERT INTO TB_ROL (ROL)
    VALUES (@NOMBRE_ROL);

    PRINT 'Rol agregado con exito.';
END;


CREATE PROCEDURE SP_EDITAR_ROL
    @ID_ROL INT,
    @NUEVO_NOMBRE NVARCHAR(45)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM TB_ROL WHERE ID_ROL = @ID_ROL)
    BEGIN
        PRINT 'El rol no existe. Ingrese un rol existente.';
        RETURN;
    END

    UPDATE TB_ROL
    SET ROL = @NUEVO_NOMBRE
    WHERE ID_ROL = @ID_ROL;

    PRINT 'Rol actualizado con exito.';
END;


--TABLA ESTADO
CREATE PROCEDURE SP_AGREGAR_ESTADO
    @NOMBRE_ESTADO NVARCHAR(45)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM TB_ESTADO WHERE ESTADO = @NOMBRE_ESTADO)
    BEGIN
		PRINT 'El estado ya existe. Ingrese un estado diferente'
        RETURN;
    END

    INSERT INTO TB_ESTADO (ESTADO)
    VALUES (@NOMBRE_ESTADO);

    PRINT 'Estado agregado con exito.';
END;


CREATE PROCEDURE SP_EDITAR_ESTADO
    @ID_ESTADO INT,
    @NUEVO_NOMBRE NVARCHAR(45)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM TB_ESTADO WHERE ID_ESTADO = @ID_ESTADO)
    BEGIN
        PRINT 'El estado no existe. Ingrese un estado existente';
        RETURN;
    END

    UPDATE TB_ESTADO
    SET ESTADO = @NUEVO_NOMBRE
    WHERE ID_ESTADO = @ID_ESTADO;

    PRINT 'Estado actualizado con exito.';
END;

--TABLA CLIENTE 
CREATE PROCEDURE SP_AGREGAR_CLIENTE
    @RAZON_SOCIAL NVARCHAR(245),
    @NOMBRE_COMERCIAL NVARCHAR(345),
    @DIRECCION_ENTREGA NVARCHAR(100),
    @TELEFONO NVARCHAR(8),
    @EMAIL NVARCHAR(45)
AS
BEGIN
	IF LEN(@TELEFONO) <> 8
    BEGIN
        PRINT 'El numero de telofono debe tener exactamente 8 digitos';
        RETURN;
    END;
    INSERT INTO TB_CLIENTE (RAZON_SOCIAL, NOMBRE_COMERCIAL, DIRECCION_ENTREGA, TELEFONO, EMAIL)
    VALUES (@RAZON_SOCIAL, @NOMBRE_COMERCIAL, @DIRECCION_ENTREGA, @TELEFONO, @EMAIL);
	PRINT 'Cliente agreagdo con exito';
END;


CREATE PROCEDURE SP_ACTUALIZAR_CLIENTE
    @ID_CLIENTE INT,
    @RAZON_SOCIAL NVARCHAR(245),
    @NOMBRE_COMERCIAL NVARCHAR(345),
    @DIRECCION_ENTREGA NVARCHAR(100),
    @TELEFONO NVARCHAR(8),
    @EMAIL NVARCHAR(45)
AS
BEGIN
	IF LEN(@TELEFONO) <> 8
    BEGIN
        PRINT 'El numero de telofono debe tener exactamente 8 digitos';
        RETURN;
    END;
    UPDATE TB_CLIENTE
    SET 
        RAZON_SOCIAL = @RAZON_SOCIAL,
        NOMBRE_COMERCIAL = @NOMBRE_COMERCIAL,
        DIRECCION_ENTREGA = @DIRECCION_ENTREGA,
        TELEFONO = @TELEFONO,
        EMAIL = @EMAIL
    WHERE ID_CLIENTE = @ID_CLIENTE;
END;


CREATE PROCEDURE SP_ELIMINAR_CLIENTE
    @ID_CLIENTE INT
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM TB_CLIENTE WHERE ID_CLIENTE = @ID_CLIENTE)
    BEGIN
        PRINT 'El cliente no existe. Ingrese un estado existente.';
        RETURN;
    END
    DELETE FROM TB_CLIENTE
    WHERE ID_CLIENTE = @ID_CLIENTE;
END;

--TABLA USUARIO
CREATE PROCEDURE SP_AGREGAR_USUARIO
    @ID_ROL INT,
	@ID_ESTADO INT,
	@CORREO NVARCHAR (45),
	@NOMBRE_COMPLETO NVARCHAR (45),
	@PASSWORD_USUARIO NVARCHAR (45),
	@TELEFONO NVARCHAR(8),
	@FECHA_NAC DATE,
	@ID_CLIENTE INT
AS
BEGIN
	IF LEN(@TELEFONO) <> 8
    BEGIN
        PRINT 'El numero de telefono debe tener exactamente 8 digitos';
        RETURN;
    END;

	DECLARE @EDAD INT;
		SET @EDAD = DATEDIFF (YEAR, @FECHA_NAC, GETDATE())
		IF DATEADD(YEAR, @EDAD, @FECHA_NAC) > GETDATE()
		BEGIN 
			SET @EDAD = @EDAD -1;
		END
		RETURN @EDAD;

	IF @EDAD < 18
    BEGIN
        PRINT 'El usuario debe ser mayor de 18 a�os';
        RETURN;
    END;

    INSERT INTO TB_USUARIO (ID_ROL, ID_ESTADO, CORREO, NOMBRE_COMPLETO, PASSWORD_USUARIO, TELEFONO, FECHA_NACIMIENTO, FECHA_CREACION, ID_CLIENTE)
    VALUES (@ID_ROL, @ID_ESTADO, @CORREO, @NOMBRE_COMPLETO, @PASSWORD_USUARIO, @TELEFONO, @FECHA_NAC, GETDATE(), @ID_CLIENTE);
	PRINT 'Usuario agregado con exito';
END;


CREATE PROCEDURE SP_ACTUALIZAR_USUARIO
	@ID_USUARIO INT,
	@ID_ROL INT,
	@ID_ESTADO INT,
	@CORREO NVARCHAR (45),
	@NOMBRE_COMPLETO NVARCHAR (45),
	@PASSWORD_USUARIO NVARCHAR (45),
	@TELEFONO NVARCHAR(8),
	@FECHA_NAC DATE,
	@ID_CLIENTE INT
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM TB_USUARIO WHERE ID_USUARIO = @ID_USUARIO)
    BEGIN
        PRINT 'El usuario no existe. Ingrese un usuario existente';
        RETURN;
    END

	IF LEN(@TELEFONO) <> 8
    BEGIN
        PRINT 'El numero de telofono debe tener exactamente 8 digitos';
        RETURN;
    END;

	DECLARE @EDAD INT;
		SET @EDAD = DATEDIFF (YEAR, @FECHA_NAC, GETDATE())
		IF DATEADD(YEAR, @EDAD, @FECHA_NAC) > GETDATE()
		BEGIN 
			SET @EDAD = @EDAD -1;
		END
		RETURN @EDAD;

	IF @EDAD < 18
    BEGIN
        PRINT 'El usuario debe ser mayor de 18 a�os';
        RETURN;
    END;

    UPDATE TB_USUARIO
    SET 
    ID_ROL = @ID_ROL,
	ID_ESTADO = @ID_ESTADO,
	CORREO = @CORREO,
	NOMBRE_COMPLETO = @NOMBRE_COMPLETO,
	PASSWORD_USUARIO = @PASSWORD_USUARIO,
	TELEFONO = @TELEFONO, 
	FECHA_NACIMIENTO = @FECHA_NAC,
	ID_CLIENTE = @ID_CLIENTE
    WHERE ID_USUARIO = @ID_USUARIO;
END;

CREATE PROCEDURE SP_ELIMINAR_USUARIO
    @ID_USUARIO INT
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM TB_USUARIO WHERE ID_USUARIO = @ID_USUARIO)
    BEGIN
        PRINT 'El usuario no existe. Ingrese un producto existente';
        RETURN;
    END
    DELETE FROM TB_USUARIO
    WHERE ID_USUARIO = @ID_USUARIO;
END;


--TABLA CATEGORIA
CREATE PROCEDURE SP_AGREGAR_CATEGORIA
    @ID_USUARIO INT,
	@NOMBRE_CATEGORIA NVARCHAR(45),
	@ID_ESTADO INT
AS
BEGIN
    INSERT INTO TB_CATEGORIA_PRODUCTO (ID_USUARIO, CATEGORIA, ID_ESTADO, FECHA_CREACION)
    VALUES (@ID_USUARIO, @NOMBRE_CATEGORIA, @ID_ESTADO, GETDATE());
	PRINT 'Categoria agregada con exito';
END;


CREATE PROCEDURE SP_ACTUALIZAR_CATEGORIA
	@ID_CATEGORIA INT, 
	@ID_USUARIO INT,
	@NOMBRE_CATEGORIA NVARCHAR (45),
	@ID_ESTADO INT
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM TB_CATEGORIA_PRODUCTO WHERE ID_CATEGORIA = @ID_CATEGORIA)
    BEGIN
        PRINT 'La categoria no existe. Ingrese categoria existente';
        RETURN;
    END
    UPDATE TB_CATEGORIA_PRODUCTO
    SET 
    ID_USUARIO = @ID_USUARIO,
	CATEGORIA = @NOMBRE_CATEGORIA,
	ID_ESTADO = @ID_ESTADO
    WHERE ID_CATEGORIA = @ID_CATEGORIA;
END;


CREATE PROCEDURE SP_ELIMINAR_CATEGORIA
    @ID_CATEGORIA INT
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM TB_CATEGORIA_PRODUCTO WHERE ID_CATEGORIA = @ID_CATEGORIA)
    BEGIN
        PRINT 'La categoria no existe. Ingrese categoria existente';
        RETURN;
    END
    DELETE FROM TB_CATEGORIA_PRODUCTO
    WHERE ID_CATEGORIA = @ID_CATEGORIA;
END;


--TABLA PRODUCTO
CREATE PROCEDURE SP_AGREGAR_PRODUCTO
    @ID_CATEGORIA INT,
	@ID_USUARIO INT, 
	@NOMBRE_PRODUCTO NVARCHAR(45),
	@MARCA NVARCHAR(45),
	@CODIGO NVARCHAR(45),
	@STOCK FLOAT,
	@ID_ESTADO INT,
	@PRECIO FLOAT,
	@FOTO BINARY
AS
BEGIN
    INSERT INTO TB_PRODUCTO(ID_CATEGORIA, ID_USUARIO, NOMBRE_PRODUCTO, MARCA, CODIGO, STOCK, ID_ESTADO, PRECIO, FECHA_CREACION, FOTO)
    VALUES (@ID_CATEGORIA, @ID_USUARIO, @NOMBRE_PRODUCTO, @MARCA, @CODIGO, @STOCK, @ID_ESTADO, @PRECIO, GETDATE(), @FOTO);
	PRINT 'Producto agregado con exito.';
END;

CREATE PROCEDURE SP_ACTUALIZAR_PRODUCTO
	@ID_PRODUCTO INT,
	@ID_CATEGORIA INT,
	@ID_USUARIO INT, 
	@NOMBRE_PRODUCTO NVARCHAR(45),
	@MARCA NVARCHAR(45),
	@CODIGO NVARCHAR(45),
	@STOCK FLOAT,
	@ID_ESTADO INT,
	@PRECIO FLOAT,
	@FOTO BINARY
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM TB_PRODUCTO WHERE ID_PRODUCTO = @ID_PRODUCTO)
    BEGIN
        PRINT 'El producto no existe. Ingrese un producto existente';
        RETURN;
    END
    UPDATE TB_PRODUCTO
    SET 
    ID_CATEGORIA = @ID_CATEGORIA,
	ID_USUARIO = @ID_USUARIO,
	NOMBRE_PRODUCTO = @NOMBRE_PRODUCTO,
	MARCA = @MARCA,
	CODIGO = @CODIGO,
	STOCK = @STOCK,
	ID_ESTADO = @ID_ESTADO,
	PRECIO = @PRECIO,
	FOTO = @FOTO
    WHERE ID_PRODUCTO = @ID_PRODUCTO;
END;

CREATE PROCEDURE SP_ELIMINAR_PRODUCTO
    @ID_PRODUCTO INT
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM TB_PRODUCTO WHERE ID_PRODUCTO = @ID_PRODUCTO)
    BEGIN
        PRINT 'El producto no existe. Ingrese un producto existente';
        RETURN;
    END
    DELETE FROM TB_PRODUCTO
    WHERE ID_PRODUCTO = @ID_PRODUCTO;
END;


--REGISTRO ORDEN Y DETALLES DE ORDEN 

CREATE PROCEDURE SP_CREAR_ORDEN_JSON
    @DATOS NVARCHAR(MAX)
AS
BEGIN
    BEGIN TRANSACTION;

    DECLARE @ID_ORDEN INT, @TOTAL FLOAT;
    INSERT INTO TB_ORDEN (ID_USUARIO, ID_ESTADO, FECHA_CREACION, NOMBRE_COMPLETO, DIRECCION, TELEFONO, CORREO, FECHA_ENTREGA, TOTAL_ORDEN)
    SELECT 
        JSON_VALUE(@DATOS, '$.ID_USUARIO'),
        JSON_VALUE(@DATOS, '$.ID_ESTADO'),
        GETDATE(),
        JSON_VALUE(@DATOS, '$.NOMBRE_COMPLETO'),
        JSON_VALUE(@DATOS, '$.DIRECCION'),
        JSON_VALUE(@DATOS, '$.TELEFONO'),
        JSON_VALUE(@DATOS, '$.CORREO'),
        JSON_VALUE(@DATOS, '$.FECHA_ENTREGA'),
        0;

    SET @ID_ORDEN = SCOPE_IDENTITY();

    INSERT INTO TB_DETALLE_ORDEN (ID_ORDEN, ID_PRODUCTO, CANTIDAD, PRECIO, SUBTOTAL)
    SELECT 
        @ID_ORDEN,
        JSON_VALUE(D.value, '$.ID_PRODUCTO'),
        CAST(JSON_VALUE(D.value, '$.CANTIDAD') AS FLOAT),
        CAST(JSON_VALUE(D.value, '$.PRECIO') AS FLOAT),
        CAST(JSON_VALUE(D.value, '$.CANTIDAD') AS FLOAT) * CAST(JSON_VALUE(D.value, '$.PRECIO') AS FLOAT)
    FROM OPENJSON(JSON_QUERY(@DATOS, '$.DETALLES')) AS D;

    SELECT @TOTAL = SUM(SUBTOTAL) 
    FROM TB_DETALLE_ORDEN WHERE ID_ORDEN = @ID_ORDEN;

    UPDATE TB_ORDEN
    SET TOTAL_ORDEN = @TOTAL
    WHERE ID_ORDEN = @ID_ORDEN;

    COMMIT TRANSACTION;

    PRINT 'Orden creada con �xito.';
END;

CREATE PROCEDURE SP_ACTUALIZAR_ORDEN
    @ID_ORDEN INT,
    @ID_ESTADO INT
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM TB_ORDEN WHERE ID_ORDEN = @ID_ORDEN)
    BEGIN
        PRINT 'La orden no existe. Ingrese una orden existente';
        RETURN;
    END
    UPDATE TB_ORDEN
    SET ID_ESTADO = @ID_ESTADO
    WHERE ID_ORDEN = @ID_ORDEN;

    PRINT 'Estado de la orden actualizado con �xito.';
END;


CREATE PROCEDURE SP_ACTUALIZAR_DETALLE_ORDEN
    @ID_DETALLE_ORDEN INT,
    @CANTIDAD INT,
    @PRECIO FLOAT
AS
BEGIN
    BEGIN TRANSACTION;

    DECLARE @SUBTOTAL FLOAT;
    SET @SUBTOTAL = @CANTIDAD * @PRECIO;

    UPDATE TB_DETALLE_ORDEN
    SET CANTIDAD = @CANTIDAD, PRECIO = @PRECIO, SUBTOTAL = @SUBTOTAL
    WHERE ID_DETALLE_ORDEN = @ID_DETALLE_ORDEN;

    DECLARE @ID_ORDEN INT;
    SELECT @ID_ORDEN = ID_ORDEN FROM TB_DETALLE_ORDEN WHERE ID_DETALLE_ORDEN = @ID_DETALLE_ORDEN;

    DECLARE @TOTAL FLOAT;
    SELECT @TOTAL = SUM(SUBTOTAL) FROM TB_DETALLE_ORDEN WHERE ID_ORDEN = @ID_ORDEN;

    UPDATE TB_ORDEN
    SET TOTAL_ORDEN = @TOTAL
    WHERE ID_ORDEN = @ID_ORDEN;

    COMMIT TRANSACTION;

    PRINT 'Detalle de la orden actualizado con exito.';
END;


CREATE PROCEDURE SP_ELIMINAR_DETALLE_ORDEN
    @ID_DETALLE_ORDEN INT
AS
BEGIN
    BEGIN TRANSACTION;

    DECLARE @ID_ORDEN INT;
    SELECT @ID_ORDEN = ID_ORDEN FROM TB_DETALLE_ORDEN WHERE ID_DETALLE_ORDEN = @ID_DETALLE_ORDEN;

    DELETE FROM TB_DETALLE_ORDEN WHERE ID_DETALLE_ORDEN = @ID_DETALLE_ORDEN;

    DECLARE @TOTAL FLOAT;
    SELECT @TOTAL = SUM(SUBTOTAL) FROM TB_DETALLE_ORDEN WHERE ID_ORDEN = @ID_ORDEN;

    UPDATE TB_ORDEN
    SET TOTAL_ORDEN = ISNULL(@TOTAL, 0)
    WHERE ID_ORDEN = @ID_ORDEN;

    COMMIT TRANSACTION;

    PRINT 'Detalle eliminado y total ajustado.';
END;


CREATE PROCEDURE SP_ELIMINAR_ORDEN
    @ID_ORDEN INT
AS
BEGIN
    BEGIN TRANSACTION;

    DELETE FROM TB_DETALLE_ORDEN WHERE ID_ORDEN = @ID_ORDEN;
    DELETE FROM TB_ORDEN WHERE ID_ORDEN = @ID_ORDEN;

    COMMIT TRANSACTION;

    PRINT 'Orden y sus detalles eliminados con exito.';
END;

--VIEWS

--TOTAL PRODUCTOS ACTIVOS CON STOCK MAYOR A 0
CREATE VIEW VW_PRODUCTOS_ACTIVOS_EN_STOCK AS
	SELECT P.ID_PRODUCTO, P.NOMBRE_PRODUCTO, P.MARCA, P.STOCK, P.PRECIO
	FROM TB_PRODUCTO P
	WHERE 
		P.ID_ESTADO = 1 
		AND P.STOCK > 0;

SELECT * FROM VW_PRODUCTOS_ACTIVOS_EN_STOCK


--TOTAL DINERO EN ORDEN INGRESADAS EN EL MES DE AGOSTO 2024
CREATE VIEW VW_TOTAL_ORDENES_AGOSTO_2024 AS
SELECT SUM(TOTAL_ORDEN) AS TOTAL_DINERO_AGOSTO
FROM TB_ORDEN
WHERE 
    YEAR(FECHA_CREACION) = 2024
    AND MONTH(FECHA_CREACION) = 8;

SELECT * FROM VW_TOTAL_ORDENES_AGOSTO_2024


--TOP 10 USUARIOS CON MAYOR CONSUMO EN ORDENES
CREATE VIEW VW_TOP_10_USUARIOS_MAYOR_CONSUMO AS
SELECT TOP 10 
	U.ID_USUARIO,
    U.NOMBRE_COMPLETO,
    SUM(O.TOTAL_ORDEN) AS TOTAL_CONSUMIDO
FROM 
    TB_USUARIO U
    INNER JOIN TB_ORDEN O ON U.ID_USUARIO = O.ID_USUARIO
GROUP BY 
    U.ID_USUARIO, U.NOMBRE_COMPLETO
ORDER BY 
    TOTAL_CONSUMIDO DESC;

SELECT * FROM VW_TOP_10_USUARIOS_MAYOR_CONSUMO


--TOP 10 PRODUCTOS MAS VENDIDOS 
CREATE VIEW VW_TOP_10_PRODUCTOS_MAS_VENDIDOS AS
	SELECT TOP 10
		P.ID_PRODUCTO, P.NOMBRE_PRODUCTO, SUM(DO.CANTIDAD) AS TOTAL_VENDIDO
	FROM TB_PRODUCTO P INNER JOIN TB_DETALLE_ORDEN DO ON P.ID_PRODUCTO = DO.ID_PRODUCTO
	GROUP BY 
		P.ID_PRODUCTO, P.NOMBRE_PRODUCTO
	ORDER BY 
		TOTAL_VENDIDO ASC;

SELECT * FROM VW_TOP_10_PRODUCTOS_MAS_VENDIDOS


