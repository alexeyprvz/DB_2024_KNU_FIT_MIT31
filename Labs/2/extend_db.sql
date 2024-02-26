INSERT INTO
    "Brand" ("brand_name", "brand_country")
VALUES ('Dyson', 'United Kingdom'),
    ('Miele', 'Germany'),
    ('Electrolux', 'Sweden');

INSERT INTO
    "ManufactureCountry" ("name")
VALUES ('Japan'),
    ('United States');

INSERT INTO
    "Type" (
        "type_name", "power_supply_type", "filtration_system_type"
    )
VALUES (
        'Robot Vacuum', 'Battery-powered', 'HEPA'
    ),
    (
        'Canister Vacuum', 'Corded', 'Bag'
    ),
    (
        'Handheld Vacuum', 'Battery-powered', 'Cyclonic'
    );

INSERT INTO
    "VacuumCleaner" (
        "brand_id", "name", "manufacture_country_id", "type_id", "power_w", "weight_kg"
    )
VALUES (
        '6', 'Dyson V11 Absolute', '5', '4', '185', '3.05'
    ),
    (
        '7', 'Miele Blizzard CX1 Cat & Dog PowerLine', '2', '1', '1200', '8.65'
    ),
    (
        '8', 'Electrolux Pure F9 Animal', '1', '4', '450', '4.2'
    ),
    (
        '1', 'BOSCH ProHygienic BCS111GB', '2', '1', '800', '5.2'
    ),
    (
        '3', 'Rowenta Silence Force RO7681', '1', '1', '750', '7.2'
    ),
    (
        '5', 'Samsung Jet 90 Complete Cordless Stick Vacuum', '3', '4', '200', '2.7'
    ),
    (
        '6', 'Dyson V7 Trigger', '5', '8', '100', '1.38'
    ),
    (
        '7', 'Miele Classic C1 Pure Suction Powerline', '2', '1', '800', '4.3'
    ),
    (
        '8', 'Electrolux Ergorapido Lithium Ion 2-1 Stick Vacuum', '1', '4', '18', '2.5'
    ),
    (
        '6', 'Dyson 360 Eye', '5', '6', '100', '2.44'
    ),
    (
        '1', 'BOSCH Roxxter BCR3P330', '2', '6', '120', '2.8'
    );