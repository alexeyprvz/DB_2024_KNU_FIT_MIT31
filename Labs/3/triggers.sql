-- Тригер видалення всіх моделей пилососів одного бренду при видаленні бренду

CREATE OR REPLACE FUNCTION delete_vacuum_cleaners_on_brand_delete()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM "VacuumCleaner"
    WHERE "brand_id" = OLD."brand_id";

    RETURN OLD;
END;
$$;

CREATE
OR REPLACE TRIGGER trigger_delete_vacuum_cleaners_on_brand_delete BEFORE DELETE ON "Brand" FOR EACH ROW
EXECUTE FUNCTION delete_vacuum_cleaners_on_brand_delete ();

CALL add_vacuum_cleaner (
    'TestBrandToDelete',
    'Germany',
    'TestVCToDelete1',
    'Germany',
    'Classic washing',
    'Corded',
    'Aquafilter',
    1000,
    9
);

CALL add_vacuum_cleaner (
    'TestBrandToDelete',
    'Germany',
    'TestVCToDelete2',
    'Germany',
    'Classic washing',
    'Corded',
    'Aquafilter',
    1200,
    7
);

DELETE FROM "Brand" WHERE "brand_name" = 'TestBrandToDelete';

-- Тригер видалення всіх моделей пилососів однієї країни виробника при видаленні цієї країни

CREATE OR REPLACE FUNCTION delete_vacuum_cleaners_on_country_delete()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM "VacuumCleaner"
    WHERE "manufacture_country_id" = OLD."manufacture_country_id";
    RETURN OLD;
END;
$$;

CREATE
OR REPLACE TRIGGER trigger_delete_vacuum_cleaners_on_country_delete BEFORE DELETE ON "ManufactureCountry" FOR EACH ROW
EXECUTE FUNCTION delete_vacuum_cleaners_on_country_delete ();

CALL add_vacuum_cleaner (
    'Thomas',
    'Germany',
    'TestVCToDelete3',
    'TestCountryToDelete',
    'Classic washing',
    'Corded',
    'Aquafilter',
    1600,
    8.25
);

CALL add_vacuum_cleaner (
    'Thomas',
    'Germany',
    'TestVCToDelete4',
    'TestCountryToDelete',
    'Classic washing',
    'Corded',
    'Aquafilter',
    1600,
    8.25
);

DELETE FROM "ManufactureCountry"
WHERE
    "name" = 'TestCountryToDelete'
    -- Тригер видалення всіх моделей пилососів одного типу при видаленні типу пилососа

CREATE OR REPLACE FUNCTION delete_vacuum_cleaners_on_type_delete()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM "VacuumCleaner"
    WHERE "type_id" = OLD."type_id";

    RETURN OLD;
END;
$$;

CREATE
OR REPLACE TRIGGER trigger_delete_vacuum_cleaners_on_type_delete BEFORE DELETE ON "Type" FOR EACH ROW
EXECUTE FUNCTION delete_vacuum_cleaners_on_type_delete ();

CALL add_vacuum_cleaner (
    'Thomas',
    'Germany',
    'TestVCToDelete5',
    'Germany',
    'Classic washing test',
    'Corded',
    'Aquafilter',
    1600,
    8.25
);

CALL add_vacuum_cleaner (
    'Thomas',
    'Germany',
    'TestVCToDelete6',
    'Germany',
    'Classic washing test',
    'Corded',
    'Aquafilter',
    1600,
    8.25
);

DELETE FROM "Type" WHERE "type_name" = 'Classic washing test'