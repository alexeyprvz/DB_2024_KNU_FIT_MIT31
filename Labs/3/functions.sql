-- Функція перевірки наявності або додавання бренду та повернення його id

CREATE OR REPLACE FUNCTION check_or_add_brand(
    "add_brand" VARCHAR,
    "add_brand_country" VARCHAR
)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
    "i_brand" INTEGER;
BEGIN
    SELECT "brand_id"
    INTO "i_brand"
    FROM "Brand"
    WHERE "brand_name" = "add_brand"
    AND "brand_country" = "add_brand_country";

    IF "i_brand" IS NULL THEN
        INSERT INTO "Brand" ("brand_name", "brand_country")
        VALUES ("add_brand", "add_brand_country")
        RETURNING "brand_id" INTO "i_brand";
    END IF;
    RETURN "i_brand"; 
END;
$$;

SELECT check_or_add_brand ('Thos', 'Gny');

-- Функція перевірки наявності або додавання країни виробництва та повернення його id

CREATE OR REPLACE FUNCTION check_or_add_country(
    "add_country" VARCHAR
)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
    "i_country" INTEGER;
BEGIN
    SELECT "manufacture_country_id"
    INTO "i_country"
    FROM "ManufactureCountry"
    WHERE "name" = add_country;

    IF i_country IS NULL THEN
        INSERT INTO "ManufactureCountry" ("name")
        VALUES ("add_country")
        RETURNING "manufacture_country_id" INTO "i_country";
    END IF;
    RETURN "i_country";
END;
$$;

SELECT check_or_add_country ('German')
-- Функція перевірки наявності або додавання типу пилососа та повернення його id

CREATE OR REPLACE FUNCTION check_or_add_type(
    "add_type_name" VARCHAR,
    "add_power_supply_type" VARCHAR,
    "add_filtration_system_type" VARCHAR
)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
    "i_type" INTEGER;
BEGIN
    SELECT "type_id"
    INTO "i_type"
    FROM "Type"
    WHERE "type_name" = "add_type_name"
    AND "power_supply_type" = "add_power_supply_type"
    AND "filtration_system_type" = "add_filtration_system_type";

    IF i_type IS NULL THEN
        INSERT INTO "Type" ("type_name", "power_supply_type", "filtration_system_type")
        VALUES ("add_type_name", "add_power_supply_type", "add_filtration_system_type")
        RETURNING "type_id" INTO "i_type";
    END IF;
    RETURN "i_type";
END;
$$;

SELECT check_or_add_type (
        'Classic washing', 'Corded', 'Aquafiltr'
    )