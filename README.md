# SQL Equestria

A T-SQL practice project for Microsoft SQL Server, inspired by *My Little Pony:
Friendship Is Magic*. The first module tracks inventory at Sweet Apple Acres:
which products arrive, where they are stored, and how much leaves each storage place.

## How inventory works

Each row in `farm.stock_movements` records one movement of one product at one
storage place. Apple varieties such as Gala and Granny Smith have separate
product IDs, so their stock can be tracked independently.

`quantity` is always positive and is recorded in the product's base unit, such
as kilograms or pieces. The movement type determines its effect on stock:
`Receipt` adds the quantity (`+1`), and `Issue` subtracts it (`-1`).

For example, receiving 30 kg of Gala apples into an empty Cold Cellar and later
issuing 8 kg leaves 22 kg there. Any Gala apples in the Main Barn have a
separate balance.

For a receipt, `id_supply_location` can record where the product came from.
`storage_place_id` identifies the internal storage place whose balance changes.
The current model does not record the recipient of an issue.

## Tables

| Table | Purpose |
| --- | --- |
| `farm.products` | Product names, varieties, base units, prices, shelf life and storage requirements |
| `farm.storage_places` | Internal storage places, such as the Main Barn and Cold Cellar, with capacity in kilograms |
| `farm.supply_locations` | Sources of incoming products, such as orchards, farms and importers |
| `farm.movement_types` | Movement types and their effect on stock |
| `farm.stock_movements` | Dated inventory movements by product, storage place, movement type and responsible employee |
| `MLP.employees` | Employees, their roles, locations and active status |
| `MLP.locations` | Named places and cities associated with employees |

## Setup

1. Create an empty SQL Server database named `SQL_Equestria`.
2. In SQL Server Management Studio, select `SQL_Equestria` as the active database.
3. Run [create_farm.sql](./create_farm.sql) to create both schemas and all seven tables.
4. Run [insert_farm.sql](./insert_farm.sql) to load the reference data.

Run the scripts once, in this order, on a fresh database. The seed script
uses location IDs assigned during the initial load.

## Project status

The initial dataset contains 51 products, 4 storage places, 9 supply sources
and 2 movement types, along with 21 employees and 16 employee locations.
The stock movement table starts empty.

The next step is to record sample receipts and issues, then build a view
that calculates stock on hand for each product at each storage place.