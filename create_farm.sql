CREATE SCHEMA farm;
GO
CREATE SCHEMA MLP;
GO

CREATE TABLE farm.products (
    id_products         INT           IDENTITY(1, 1) PRIMARY KEY,
    name_products       VARCHAR(50)   NOT NULL,
    variety             VARCHAR(50)   NULL,
    type_product        VARCHAR(50)   NOT NULL,
    shelf_life_days     SMALLINT      NOT NULL,
    retail_price        DECIMAL(12,2) NULL,
    base_unit           VARCHAR(20)   NOT NULL,
    storage_temp_min    DECIMAL(5,2)  NOT NULL,
    storage_temp_max    DECIMAL(5,2)  NOT NULL,
    storage_conditions  VARCHAR(100)  NULL,

    CONSTRAINT UQ_products_name_variety UNIQUE (name_products, variety),
    CONSTRAINT CK_products_min_max CHECK (storage_temp_min <= storage_temp_max),
    CONSTRAINT CK_products_shelf_life CHECK (shelf_life_days >= 0),
    CONSTRAINT CK_products_retail_price CHECK (retail_price >= 0)
);

CREATE TABLE MLP.locations (
    id_location    INT          IDENTITY(1, 1) PRIMARY KEY,
    name_location  NVARCHAR(50) NOT NULL,
    city_location  NVARCHAR(50) NOT NULL
);

CREATE TABLE farm.movement_types (
    id_movement_type    INT          IDENTITY(1, 1) PRIMARY KEY,
    name_movement_type  NVARCHAR(50) NOT NULL UNIQUE,
    coefficient          SMALLINT     NOT NULL CHECK (coefficient IN (-1, 1))
);

CREATE TABLE MLP.employees (
    id_employee          INT          IDENTITY(1, 1) PRIMARY KEY,
    name_employee        NVARCHAR(50) NOT NULL,
    role_employee        NVARCHAR(50) NOT NULL,
    id_location_employee INT, 
    is_active            BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_employees_locations
    FOREIGN KEY (id_location_employee)
        REFERENCES MLP.locations (id_location)
);

CREATE TABLE farm.storage_places (
    storage_place_id  INT         IDENTITY(1, 1) PRIMARY KEY,
    place_name        VARCHAR(50) NOT NULL UNIQUE,
    capacity_kg       SMALLINT    NOT NULL CHECK (capacity_kg > 0)
);

CREATE TABLE farm.stock_movements (
    id_movement        INT           IDENTITY(1, 1) PRIMARY KEY,
    date_move          DATETIME2     NOT NULL DEFAULT (SYSDATETIME()),
    id_products        INT           NOT NULL,
    quantity           DECIMAL(12,3) NOT NULL,
    id_employee        INT           NOT NULL,
    storage_place_id   INT           NOT NULL,
    id_location        INT           NULL,
    id_movement_type   INT           NOT NULL,

    CONSTRAINT CK_stock_movements_quantity CHECK (quantity > 0),

    CONSTRAINT FK_stock_movements_products
        FOREIGN KEY (id_products)
        REFERENCES farm.products (id_products),

    CONSTRAINT FK_stock_movements_employees
        FOREIGN KEY (id_employee)
        REFERENCES MLP.employees (id_employee),

    CONSTRAINT FK_stock_movements_storage
        FOREIGN KEY (storage_place_id)
        REFERENCES farm.storage_places (storage_place_id),

    CONSTRAINT FK_stock_movements_locations
        FOREIGN KEY (id_location)
        REFERENCES MLP.locations (id_location),

    CONSTRAINT FK_stock_movements_type
    FOREIGN KEY (id_movement_type)
        REFERENCES farm.movement_types (id_movement_type)
);