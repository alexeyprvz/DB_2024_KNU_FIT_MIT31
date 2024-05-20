CREATE OR REPLACE PROCEDURE add_vacuum_cleaner(
    "add_brand" VARCHAR, 
    "add_brand_country" VARCHAR, 
    "add_name" VARCHAR, 
    "add_manufacture_country" VARCHAR, 
    "add_type_name" VARCHAR, 
    "add_power_supply_type" VARCHAR,
    "add_filtration_system_type" VARCHAR,
    "add_power_w" INTEGER, 
    "add_weight_kg" FLOAT
)
LANGUAGE plpgsql
AS $$
DECLARE
    "add_brand_id" INTEGER;
    "add_manufacture_country_id" INTEGER;
    "add_type_id" INTEGER;
BEGIN
    "add_brand_id" = check_or_add_brand("add_brand", "add_brand_country");
    "add_manufacture_country_id" = check_or_add_country("add_manufacture_country");
    "add_type_id" = check_or_add_type("add_type_name", "add_power_supply_type", "add_filtration_system_type");
    INSERT INTO "VacuumCleaner"(
        "brand_id", 
        "name", 
        "manufacture_country_id", 
        "type_id", 
        "power_w", 
        "weight_kg"
    )
    VALUES(
        "add_brand_id", 
        "add_name", 
        "add_manufacture_country_id", 
        "add_type_id", 
        "add_power_w", 
        "add_weight_kg"
    );
END;
$$;

CALL add_vacuum_cleaner (
    'Thomas',
    'Germany',
    'Thomas Sky XT Aqua-Box',
    'Germany',
    'Classic washing',
    'Corded',
    'Aquafilter',
    1600,
    8.25
);

CREATE OR REPLACE PROCEDURE delete_vacuum_cleaner_by_id(
    delete_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM "VacuumCleaner" WHERE "vacuum_cleaner_id" = delete_id) THEN
        DELETE FROM "VacuumCleaner"
        WHERE "vacuum_cleaner_id" = delete_id;
        RAISE NOTICE 'Vacuum cleaner with ID % has been deleted.', delete_id;
    ELSE
        RAISE NOTICE 'Vacuum cleaner with ID % does not exist.', delete_id;
    END IF;
END;
$$;

CALL delete_vacuum_cleaner_by_id (25);