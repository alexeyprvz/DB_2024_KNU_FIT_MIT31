CREATE TABLE "VacuumCleaner" (
    "vacuum_cleaner_id" SERIAL PRIMARY KEY, "brand_id" INTEGER, "name" VARCHAR, "manufacture_country_id" INTEGER, "type_id" INTEGER, "power_w" INTEGER, "weight_kg" FLOAT
);

CREATE TABLE "Brand" (
    "brand_id" SERIAL PRIMARY KEY, "brand_name" VARCHAR, "brand_country" VARCHAR
);

CREATE TABLE "ManufactureCountry" (
    "manufacture_country_id" SERIAL PRIMARY KEY, "name" VARCHAR
);

CREATE TABLE "Type" (
    "type_id" SERIAL PRIMARY KEY, "type_name" VARCHAR, "power_supply_type" VARCHAR, "filtration_system_type" VARCHAR
);

ALTER TABLE "VacuumCleaner"
ADD FOREIGN KEY ("brand_id") REFERENCES "Brand" ("brand_id");

ALTER TABLE "VacuumCleaner"
ADD FOREIGN KEY ("manufacture_country_id") REFERENCES "ManufactureCountry" ("manufacture_country_id");

ALTER TABLE "VacuumCleaner"
ADD FOREIGN KEY ("type_id") REFERENCES "Type" ("type_id");

INSERT INTO
    "Brand" ("brand_name", "brand_country")
VALUES ('Bosch', 'Germany'),
    ('Philips', 'Netherlands'),
    ('Rowenta', 'Germany'),
    ('Thomas', 'Germany'),
    (
        'Samsung Electronics', 'Korea'
    );

INSERT INTO
    "ManufactureCountry" ("name")
VALUES ('China'),
    ('Germany'),
    ('Vietnam');

INSERT INTO
    "Type" (
        "type_name", "power_supply_type", "filtration_system_type"
    )
VALUES (
        'Classic Without bag', 'Corded', 'HEPA'
    ),
    (
        'Stick washing', 'Battery-powered', 'HEPA'
    ),
    (
        'Classic washing', 'Corded', 'Aquafilter'
    ),
    (
        'Stick', 'Battery-powered', 'HEPA'
    ),
    (
        'Washing Robot', 'Battery-powered', 'HEPA'
    );

INSERT INTO
    "VacuumCleaner" (
        "brand_id", "name", "manufacture_country_id", "type_id", "power_w", "weight_kg"
    )
VALUES (
        '4', 'THOMAS TWIN XT', '2', '3', '1700', '8'
    ),
    (
        '3', 'Rowenta X-PLORER Serie 75 S RR8567WH', '1', '5', '60', '3.45'
    ),
    (
        '5', 'SAMSUNG VCC45W0S36/UK', '3', '1', '700', '4.3'
    ),
    (
        '2', 'Philips Aqua Plus XC8349/01', '1', '2', '550', '3.4'
    ),
    (
        '1', 'BOSCH BCS612KA2', '2', '4', '18', '3.52'
    );