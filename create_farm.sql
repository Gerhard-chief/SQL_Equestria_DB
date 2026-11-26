CREATE SCHEMA farm;
GO

CREATE TABLE farm.products (
    id_products         INT           IDENTITY(1, 1) PRIMARY KEY,
    name_products       VARCHAR(50)   NOT NULL,
    variety             VARCHAR(50)   NULL,
    type_product        VARCHAR(50)   NOT NULL,
    shelf_life_days     SMALLINT      NOT NULL CHECK (shelf_life_days >= 0),
    retail_price        DECIMAL(12,2) NULL     CHECK (retail_price >= 0),
    base_unit           VARCHAR(20)   NOT NULL,
    storage_temp_min    DECIMAL(5,2)  NOT NULL,
    storage_temp_max    DECIMAL(5,2)  NOT NULL,
    storage_conditions  VARCHAR(100)  NULL,

    UNIQUE (name_products, variety),
    CHECK (storage_temp_min <= storage_temp_max)
);

CREATE TABLE farm.locations (
    id_locations    INT          IDENTITY(1, 1) PRIMARY KEY,
    name_locations  NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE farm.movement_types (
    id_movement_types    INT          IDENTITY(1, 1) PRIMARY KEY,
    name_movement_types  NVARCHAR(50) NOT NULL UNIQUE,
    coefficient          SMALLINT     NOT NULL CHECK (coefficient IN (-1, 1))
);

CREATE TABLE farm.employees (
    id_employees    INT          IDENTITY(1, 1) PRIMARY KEY,
    name_employees  NVARCHAR(50) NOT NULL
);

CREATE TABLE farm.storage_places (
    storage_place_id  INT         IDENTITY(1, 1) PRIMARY KEY,
    place_name        VARCHAR(50) NOT NULL UNIQUE,
    capacity_kg       SMALLINT    NOT NULL CHECK (capacity_kg > 0)
);

CREATE TABLE farm.stock_movements (
    id_movements       INT           IDENTITY(1, 1) PRIMARY KEY,
    date_move          DATETIME      NOT NULL DEFAULT (GETDATE()),
    id_products        INT           NOT NULL,
    quantity           DECIMAL(12,3) NOT NULL CHECK (quantity > 0),
    id_employees       INT           NOT NULL,
    storage_place_id   INT           NOT NULL,
    id_locations       INT           NULL,
    id_movement_types  INT           NOT NULL,

    CONSTRAINT FK_id_products
        FOREIGN KEY (id_products)
        REFERENCES farm.products (id_products),

    CONSTRAINT FK_id_employees
        FOREIGN KEY (id_employees)
        REFERENCES farm.employees (id_employees),

    CONSTRAINT FK_storage_place_id
        FOREIGN KEY (storage_place_id)
        REFERENCES farm.storage_places (storage_place_id),

    CONSTRAINT FK_id_locations
        FOREIGN KEY (id_locations)
        REFERENCES farm.locations (id_locations),

    FOREIGN KEY (id_movement_types)
        REFERENCES farm.movement_types (id_movement_types)
);