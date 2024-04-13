USE Kaggle
GO
DROP TABLE dbo.starbucks
--EN CASO NO EXISTA LA TABLA starbucks, LA VOY A CREAR
IF NOT EXISTS (SELECT * FROM SYS.TABLES WHERE object_id=OBJECT_ID(N'dbo.starbucks') AND type='U')
CREATE TABLE dbo.starbucks (
		Beverage_category VARCHAR(200),
		Beverage VARCHAR(200),
		Beverage_prep VARCHAR(200),
		Calories INT,
		Total_Fat_g varchar (10),
		Trans_Fat_g DECIMAL,
		Saturated_Fat_g DECIMAL,
		Sodium_mg DECIMAL,
		Total_Carbohydrates_g INT,
		Cholesterol_mg INT,
		Dietary_Fibre_g INT,
		Sugars_g INT,
		Protein_g DECIMAL,
		Vitamin_A_DV VARCHAR(10),
		Vitamin_C_DV VARCHAR(10),
		Calcium_DV VARCHAR(10),
		Iron_DV VARCHAR(10),
		Caffeine_mg VARCHAR(10)
)
GO

--SI LA TABLA YA EXISTE starbucks, LA VOY A LIMPIAR
TRUNCATE TABLE dbo.starbucks;
GO

--IMPORTAR LA DATA DE MI ARCHIVO CSV starbucks
BULK INSERT dbo.starbucks
FROM 'C:\Proyecto_parcial\phyton\dataset\starbucks.csv' --UBICACION DE MI ARCHIVO
WITH
(
	FIRSTROW = 2, --empieza a insertar data desde la fila 2, porque la 1era fila es la cabecera del archivo
	FIELDTERMINATOR = ',', --delimitador de las columnas
	ROWTERMINATOR = '0x0a' --delimitador de las filas, salto de linea
)
GO
