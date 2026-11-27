-- ==========================================
-- DATA INSERTION
-- ==========================================

-- 1. Movement Types
INSERT INTO farm.movement_types (name_movement_type, coefficient)
VALUES
    (N'Receipt', 1),
    (N'Issue', -1);

-- 2. Locations (Base + New ones for new employees)
INSERT INTO MLP.locations (name_location, city_location)
VALUES
    -- Ponyville
    (N'Sweet Apple Acres', N'Ponyville'),       -- ID 1
    (N'Golden Oak Library', N'Ponyville'),      -- ID 2
    (N'Carousel Boutique', N'Ponyville'),       -- ID 3
    (N'Sugarcube Corner', N'Ponyville'),        -- ID 4
    (N'Fluttershy''s Cottage', N'Ponyville'),   -- ID 5
    (N'Rock Farm (Pie Family)', N'Ponyville'),  -- ID 6
    
    -- Canterlot
    (N'Canterlot Castle', N'Canterlot'),        -- ID 7
    (N'Sparkle Residence', N'Canterlot'),       -- ID 8
    
    -- Cloudsdale
    (N'Cloudsdale', N'Cloudsdale'),             -- ID 9
    
    -- Others
    (N'Crystal Castle', N'Crystal Empire'),     -- ID 10
    (N'Appleloosa Orchard', N'Appleloosa'),     -- ID 11
    (N'Manehattan Apartment', N'Manehattan'),   -- ID 12
    (N'Zecora''s Hut', N'Everfree Forest'),     -- ID 13

    -- New locations added for supply chains
    (N'Cherry Hill Ranch', N'Dodge Junction'),  -- ID 14
    (N'Carrot Farm', N'Ponyville'),             -- ID 15
    (N'Hooffield Farms', N'Smokey Mountains');  -- ID 16

-- 3. Employees (Base + New suppliers)
INSERT INTO MLP.employees (name_employee, role_employee, id_location_employee, is_active)
VALUES
    -- Mane 6 & Spike
    (N'Twilight Sparkle', N'Princess / Librarian', 2, 1),
    (N'Applejack',        N'Farmer',               1, 1),
    (N'Rarity',           N'Fashion Designer',     3, 1),
    (N'Pinkie Pie',       N'Baker / Party Planner',4, 1),
    (N'Fluttershy',       N'Animal Caretaker',     5, 1),
    (N'Rainbow Dash',     N'Weather Manager',      9, 1),
    (N'Spike',            N'Assistant',            2, 1),

    -- Royalty & Family
    (N'Princess Celestia', N'Co-ruler',            7, 1),
    (N'Princess Luna',     N'Co-ruler',            7, 1),
    (N'Princess Cadance',  N'Princess',            10, 1),
    (N'Shining Armor',     N'Prince / Guard',      10, 1),
    (N'Granny Smith',      N'Family Matriarch',    1, 1),
    (N'Big McIntosh',      N'Farmer',              1, 1),
    (N'Apple Bloom',       N'Student / Helper',    1, 1),
    
    -- Others
    (N'Maud Pie',          N'Geologist',           6, 1),
    (N'Igneous Rock Pie',  N'Rock Farmer',         6, 1),
    (N'Braeburn',          N'Farmer',              11, 1),
    (N'Zecora',            N'Herbalist & Importer',13, 1),

    -- New Suppliers (Linked to IDs 14, 15, 16)
    (N'Cherry Jubilee',    N'Ranch Owner',         14, 1),
    (N'Carrot Top',        N'Farmer',              15, 1),
    (N'Hooffield Farmer',  N'Farmer',              16, 1);

-- 4. Storage Places (Internal barns for Sweet Apple Acres)
INSERT INTO farm.storage_places (place_name, capacity_kg)
VALUES
    (N'Main Barn', 5000),        -- ID 1
    (N'Cold Cellar', 2000),      -- ID 2
    (N'Hayloft', 1500),          -- ID 3
    (N'Quarantine Zone', 500);   -- ID 4

-- 5. Supply Locations (External providers)
INSERT INTO farm.supply_locations (name, location_type, city, region, description)
VALUES
    -- Fruit Orchards & Ranches
    (N'Sweet Apple Acres', N'Orchard', N'Ponyville', N'Central Equestria', N'Family orchard of the Apple family, main source of apples and some vegetables.'), -- ID 1
    (N'Appleloosa Orchard', N'Orchard', N'Appleloosa', N'Southern Equestria', N'Large apple orchard run by Braeburn, known for hardy southern apples.'), -- ID 2
    (N'Cherry Hill Ranch', N'Ranch', N'Dodge Junction', N'Southern Equestria', N'Cherry ranch owned by Cherry Jubilee, supplier of red and yellow cherries.'), -- ID 3
    
    -- Vegetable Farms
    (N'Carrot Farm', N'Farm', N'Ponyville', N'Central Equestria', N'Dedicated carrot farm, a key supplier of carrots for the Ponyville market.'), -- ID 4
    (N'Hooffield Farms', N'Farm', N'Smokey Mountains', N'Northern Equestria', N'Traditional family farm in the mountains, known for root vegetables and hardy crops.'), -- ID 5
    
    -- Processing & Regions
    (N'Northeastern Windmill', N'Windmill', N'Ponyville', N'Central Equestria', N'Windmill that processes grain into flour and bread, a staple food source.'), -- ID 6
    (N'Hearthlands Farms', N'Farm', N'Central Equestria', N'Central Equestria', N'Large agricultural region with multiple farming spots, bulk supplier of grains and vegetables.'), -- ID 7
    (N'White Tail Woods Farms', N'Farm', N'White Tail Woods', N'Western Equestria', N'Small farms in the woods, supplying forest berries and specialty crops.'), -- ID 8
    
    -- Importers
    (N'Zecora''s Hut', N'Importer', N'Everfree Forest', N'Everfree Forest', N'Exotic fruit and herb importer, source of rare ingredients like blood oranges.'); -- ID 9

-- 6. Products (Full List)
INSERT INTO farm.products (
    name_products, variety, type_product, shelf_life_days, 
    retail_price, base_unit, storage_temp_min, storage_temp_max, storage_conditions
) VALUES 
    -- Apples (5)
    (N'Apple', N'Granny Smith', N'Fruit', 60, 2.50, N'kg', 0.0, 4.0, N'Store in a cool, dark place'),
    (N'Apple', N'Red Delicious', N'Fruit', 45, 2.20, N'kg', 0.0, 4.0, N'Store in a cool, dark place'),
    (N'Apple', N'Golden Delicious', N'Fruit', 45, 2.30, N'kg', 0.0, 4.0, N'Store in a cool, dark place'),
    (N'Apple', N'Gala', N'Fruit', 50, 2.60, N'kg', 0.0, 4.0, N'Store in a cool, dark place'),
    (N'Apple', N'Pink Lady', N'Fruit', 50, 2.80, N'kg', 0.0, 4.0, N'Store in a cool, dark place'),

    -- Pears (4)
    (N'Pear', N'Conference', N'Fruit', 50, 2.80, N'kg', 0.0, 4.0, N'Keep refrigerated'),
    (N'Pear', N'Abate Fetel', N'Fruit', 40, 3.50, N'kg', 0.0, 4.0, N'Keep refrigerated'),
    (N'Pear', N'Williams', N'Fruit', 30, 2.90, N'kg', 0.0, 4.0, N'Keep refrigerated'),
    (N'Pear', N'Blanquilla', N'Fruit', 45, 3.20, N'kg', 0.0, 4.0, N'Keep refrigerated'),

    -- Potatoes (4)
    (N'Potato', N'Russet', N'Vegetable', 30, 1.20, N'kg', 4.0, 10.0, N'Store in a dark, dry, well-ventilated place'),
    (N'Potato', N'Red', N'Vegetable', 35, 1.40, N'kg', 4.0, 10.0, N'Store in a dark, dry, well-ventilated place'),
    (N'Potato', N'White', N'Vegetable', 30, 1.30, N'kg', 4.0, 10.0, N'Store in a dark, dry, well-ventilated place'),
    (N'Potato', N'Baby', N'Vegetable', 20, 3.50, N'kg', 4.0, 10.0, N'Store in a cool, dark place'),

    -- Carrots (2)
    (N'Carrot', N'Standard', N'Vegetable', 14, 1.50, N'kg', 0.0, 2.0, N'Keep refrigerated, high humidity'),
    (N'Carrot', N'Baby', N'Vegetable', 10, 2.50, N'kg', 0.0, 2.0, N'Keep refrigerated, high humidity'),

    -- Onions (3)
    (N'Onion', N'Yellow', N'Vegetable', 60, 1.00, N'kg', 4.0, 10.0, N'Store in a dark, dry, well-ventilated place'),
    (N'Onion', N'Red', N'Vegetable', 50, 1.20, N'kg', 4.0, 10.0, N'Store in a dark, dry, well-ventilated place'),
    (N'Onion', N'White', N'Vegetable', 45, 1.10, N'kg', 4.0, 10.0, N'Store in a dark, dry, well-ventilated place'),

    -- Lettuce (3)
    (N'Lettuce', N'Romaine', N'Vegetable', 7, 1.80, N'piece', 0.0, 2.0, N'Keep refrigerated, wrap in damp cloth'),
    (N'Lettuce', N'Iceberg', N'Vegetable', 10, 1.50, N'piece', 0.0, 2.0, N'Keep refrigerated'),
    (N'Lettuce', N'Butterhead', N'Vegetable', 7, 2.20, N'piece', 0.0, 2.0, N'Keep refrigerated'),

    -- Tomatoes (3)
    (N'Tomato', N'Beefsteak', N'Vegetable', 10, 3.00, N'kg', 10.0, 18.0, N'Store at room temperature, away from direct sunlight'),
    (N'Tomato', N'Roma', N'Vegetable', 14, 2.50, N'kg', 10.0, 18.0, N'Store at room temperature'),
    (N'Tomato', N'Cherry', N'Vegetable', 10, 3.50, N'kg', 10.0, 18.0, N'Store at room temperature'),

    -- Cabbage (6)
    (N'Cabbage', N'White', N'Vegetable', 30, 1.00, N'kg', 0.0, 4.0, N'Keep refrigerated'),
    (N'Cabbage', N'Red', N'Vegetable', 30, 1.20, N'kg', 0.0, 4.0, N'Keep refrigerated'),
    (N'Cabbage', N'Savoy', N'Vegetable', 20, 1.50, N'kg', 0.0, 4.0, N'Keep refrigerated'),
    (N'Broccoli', NULL, N'Vegetable', 14, 2.50, N'kg', 0.0, 4.0, N'Keep refrigerated, high humidity'),
    (N'Cauliflower', NULL, N'Vegetable', 14, 2.80, N'kg', 0.0, 4.0, N'Keep refrigerated'),
    (N'Brussels Sprouts', NULL, N'Vegetable', 20, 4.00, N'kg', 0.0, 4.0, N'Keep refrigerated'),

    -- Cucumbers (5)
    (N'Cucumber', N'English', N'Vegetable', 10, 1.50, N'piece', 10.0, 15.0, N'Keep refrigerated'),
    (N'Cucumber', N'Persian', N'Vegetable', 14, 3.50, N'kg', 10.0, 15.0, N'Keep refrigerated'),
    (N'Cucumber', N'Pickling', N'Vegetable', 7, 1.20, N'kg', 10.0, 15.0, N'Keep refrigerated'),
    (N'Cucumber', N'Lemon', N'Vegetable', 10, 2.50, N'kg', 10.0, 15.0, N'Keep refrigerated'),
    (N'Cucumber', N'Mini', N'Vegetable', 7, 3.00, N'kg', 10.0, 15.0, N'Keep refrigerated'),

    -- Corn (4)
    (N'Corn', N'Yellow', N'Vegetable', 5, 0.50, N'piece', 0.0, 4.0, N'Keep refrigerated, consume quickly'),
    (N'Corn', N'White', N'Vegetable', 5, 0.60, N'piece', 0.0, 4.0, N'Keep refrigerated, consume quickly'),
    (N'Corn', N'Bi-color', N'Vegetable', 5, 0.70, N'piece', 0.0, 4.0, N'Keep refrigerated, consume quickly'),
    (N'Corn', N'Red', N'Vegetable', 5, 1.50, N'piece', 0.0, 4.0, N'Keep refrigerated, premium variety'),

    -- Pumpkins (2)
    (N'Pumpkin', N'Regular', N'Vegetable', 60, 1.50, N'kg', 10.0, 15.0, N'Store in a cool, dry place'),
    (N'Pumpkin', N'Mini', N'Vegetable', 30, 2.00, N'piece', 10.0, 15.0, N'Store in a cool, dry place'),

    -- Beans (4)
    (N'Beans', N'Green', N'Vegetable', 7, 3.00, N'kg', 4.0, 8.0, N'Keep refrigerated'),
    (N'Beans', N'Yellow', N'Vegetable', 7, 3.20, N'kg', 4.0, 8.0, N'Keep refrigerated'),
    (N'Beans', N'Purple', N'Vegetable', 7, 3.50, N'kg', 4.0, 8.0, N'Keep refrigerated'),
    (N'Beans', N'French Filet', N'Vegetable', 10, 4.50, N'kg', 4.0, 8.0, N'Keep refrigerated'),

    -- Celery (1)
    (N'Celery', N'Stalk', N'Vegetable', 14, 1.50, N'piece', 0.0, 2.0, N'Keep refrigerated, high humidity'),

    -- Oranges (2)
    (N'Orange', N'Navel', N'Fruit', 30, 2.00, N'kg', 4.0, 10.0, N'Store in a cool, well-ventilated place'),
    (N'Orange', N'Blood Orange', N'Fruit', 30, 3.00, N'kg', 4.0, 10.0, N'Imported by Zecora, store in a cool place'),

    -- Cherries & Strawberries (3)
    (N'Cherry', N'Bing', N'Fruit', 7, 5.00, N'kg', 0.0, 2.0, N'Keep refrigerated, do not wash before storing'),
    (N'Cherry', N'Rainier', N'Fruit', 5, 7.00, N'kg', 0.0, 2.0, N'Premium variety, keep refrigerated'),
    (N'Strawberry', NULL, N'Berry', 3, 6.00, N'kg', 0.0, 2.0, N'Keep refrigerated, consume quickly');



-- ==========================================
-- STOCK MOVEMENTS (Simulating 2025)
-- ==========================================
-- Note: 
-- 1 = Receipt (Income)
-- 2 = Issue (Outcome/Sale/Spoilage)
-- id_supply_location can be NULL for Issues (goods leaving the farm).

INSERT INTO farm.stock_movements (date_move, id_products, quantity, id_employee, storage_place_id, id_movement_type, id_supply_location)
VALUES
    -- 🌱 SPRING
    -- Receipt: 100kg Strawberries from Carrot Farm (Wait, Carrot Farm? Let's assume they grow berries too, or use Hearthlands)
    ('2025-03-15T10:00:00', 46, 100, 2, 2, 1, 7), 
    -- Issue: 10kg Strawberries spoiled (Spoilage)
    ('2025-03-20T14:30:00', 46, 10, 2, 4, 2, NULL), 
    -- Receipt: 200 pieces of Lettuce from Hearthlands
    ('2025-04-10T09:00:00', 20, 200, 2, 2, 1, 7),

    -- ☀️ SUMMER
    -- Receipt: 150kg Cherries from Cherry Hill Ranch
    ('2025-06-01T08:00:00', 44, 150, 19, 2, 1, 3), 
    -- Receipt: 300 pieces of Corn from Sweet Apple Acres
    ('2025-07-15T11:00:00', 36, 300, 2, 1, 1, 1), 
    -- Issue: 50kg Cherries sold to Ponyville Market (id_supply_location is NULL)
    ('2025-06-05T12:00:00', 44, 50, 2, 1, 2, NULL),
    -- Receipt: 80kg Tomatoes from Hooffield Farms
    ('2025-08-01T09:30:00', 23, 80, 21, 1, 1, 5),

    -- 🍎 AUTUMN (Harvest Season)
    -- Receipt: 500kg Apples (Gala) from Sweet Apple Acres
    ('2025-09-01T08:00:00', 4, 500, 2, 1, 1, 1), 
    -- Receipt: 400kg Apples (Granny Smith) from Sweet Apple Acres
    ('2025-09-02T09:00:00', 1, 400, 2, 1, 1, 1),
    -- Receipt: 200kg Pumpkins from Sweet Apple Acres
    ('2025-10-15T10:00:00', 40, 200, 2, 3, 1, 1),
    -- Issue: 100kg Apples sold for Harvest Festival
    ('2025-10-20T15:00:00', 4, 100, 2, 1, 2, NULL),
    -- Receipt: 300kg Cabbage (White) from Hooffield Farms
    ('2025-11-01T09:00:00', 26, 300, 21, 1, 1, 5),

    -- ❄️ WINTER
    -- Receipt: 50kg Oranges from Zecora's Hut
    ('2025-12-05T13:00:00', 43, 50, 18, 2, 1, 9),
    -- Issue: 200kg Apples sold for Hearth's Warming
    ('2025-12-20T10:00:00', 1, 200, 2, 1, 2, NULL),
    -- Issue: 150kg Potatoes sold for Hearth's Warming
    ('2025-12-22T11:00:00', 11, 150, 2, 4, 2, NULL),

    -- 🔄 INTERNAL TRANSFERS (Receipt to different barn)
    -- Issue: Move 100kg Gala Apples from Main Barn to Cold Cellar
    ('2025-09-10T09:00:00', 4, 100, 2, 1, 2, NULL),
    -- Receipt: Receive 100kg Gala Apples into Cold Cellar (id_supply_location = NULL because it's internal)
    ('2025-09-10T09:05:00', 4, 100, 2, 2, 1, NULL),

    -- 📉 SPOILAGE / QUARANTINE
    -- Issue: 20kg Tomatoes spoiled and moved to Quarantine
    ('2025-08-15T16:00:00', 23, 20, 2, 4, 2, NULL),
    
    -- 🌟 EXTRA DATA FOR ZECORA
    -- Receipt: 30kg Blood Oranges from Zecora
    ('2025-12-10T14:00:00', 44, 30, 18, 2, 1, 9),
    -- Issue: 10kg Blood Oranges sold as premium goods
    ('2025-12-15T12:00:00', 44, 10, 2, 2, 2, NULL);