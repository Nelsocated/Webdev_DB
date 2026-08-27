/* CREATE TABLE pies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    crust_type VARCHAR(50) NOT NULL,
    filling VARCHAR(100) NOT NULL,
    is_baked BOOLEAN DEFAULT FALSE,
    slice_count INT DEFAULT 8
); */

INSERT INTO pies (id, name, crust_type, filling, is_baked, slice_count)
VALUES (1, 'EggPie', 'Hard', 'Egg', true, 5)