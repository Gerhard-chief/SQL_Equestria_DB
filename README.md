# SQL Equestria

A SQL Server practice project that models farm inventory at Sweet Apple Acres,
inspired by *My Little Pony: Friendship Is Magic*.

## How inventory works

Each row in `farm.stock_movements` records a change in the quantity of one
product at one storage place. Apple varieties such as Gala and Fuji are tracked
as separate products.

Quantities are always positive. The movement type determines how each entry
affects stock: `+1` for incoming stock and `-1` for outgoing stock. For example,
receiving 30 kg of Gala apples and sending 8 kg to the bakery leaves 22 kg in
the cellar, assuming it was empty to begin with.

## Tables

| Table | What it records |
| --- | --- |
| `farm.products` | Products and varieties, units of measure, shelf life and storage requirements |
| `farm.storage_places` | Individual storage places and their capacity in kilograms |
| `farm.locations` | Sources and destinations, such as the orchard or bakery |
| `farm.movement_types` | Movement types and their effect on stock (`+1` or `-1`) |
| `farm.employees` | Employees who handle stock movements |
| `farm.stock_movements` | Dated inventory entries linking a product, quantity, storage place, movement type and employee |

## Setup

1. Create an empty database named `SQL_Equestria` in SQL Server.
2. Open [create_farm.sql](./create_farm.sql) in SQL Server Management Studio.
3. Select `SQL_Equestria` as the active database and run the script once.

The script creates the `farm` schema and all six tables. The tables start empty.

## Project status

The first version of the farm schema is complete. Next, I’ll add sample stock
movements and build a view to calculate how much of each product is available
at each storage place.