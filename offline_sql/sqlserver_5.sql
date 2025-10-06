-- 数据库：mssql_db
CREATE DATABASE mssql_db;
USE mssql_db;

-- 启用CDC（需先启用数据库CDC）
EXEC sys.sp_cdc_enable_db;

-- 表1：product_info（商品信息表）
CREATE TABLE product_info (
                              product_id INT IDENTITY(1,1) PRIMARY KEY,
                              product_name VARCHAR(100) NOT NULL,
                              price DECIMAL(10,2) NOT NULL,
                              update_time DATETIME NOT NULL DEFAULT GETDATE()
);

-- 表2：inventory_info（库存表）
CREATE TABLE inventory_info (
                                inventory_id INT IDENTITY(1,1) PRIMARY KEY,
                                product_id INT NOT NULL,
                                stock INT NOT NULL DEFAULT 0,
                                last_modify_time DATETIME NOT NULL DEFAULT GETDATE(),
                                FOREIGN KEY (product_id) REFERENCES product_info(product_id)
);

-- 为表启用CDC
EXEC sys.sp_cdc_enable_table
     @source_schema = 'dbo',
     @source_name = 'product_info',
     @role_name = NULL,
     @supports_net_changes = 1;

EXEC sys.sp_cdc_enable_table
     @source_schema = 'dbo',
     @source_name = 'inventory_info',
     @role_name = NULL,
     @supports_net_changes = 1;