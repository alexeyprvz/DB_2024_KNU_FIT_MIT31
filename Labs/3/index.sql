-- Індекс для швидкого пошуку пилососів з дротовим типом живлення
CREATE FUNCTION is_corded(integer) RETURNS boolean AS $$
    SELECT power_supply_type = 'Corded'
    FROM "Type"
    WHERE type_id = $1;
$$ LANGUAGE SQL IMMUTABLE;

CREATE INDEX idx_vacuumcleaner_corded ON "VacuumCleaner" (vacuum_cleaner_id)
WHERE
    is_corded ("VacuumCleaner".type_id);

-- Індекс для швидкого пошуку пилососів вироблених у Китаї
CREATE FUNCTION is_made_in_china(integer) RETURNS boolean AS $$
    SELECT $1 = (SELECT manufacture_country_id FROM "ManufactureCountry" WHERE name = 'China');
$$ LANGUAGE SQL IMMUTABLE;

CREATE INDEX idx_vacuumcleaner_made_in_china ON "VacuumCleaner" (vacuum_cleaner_id)
WHERE
    is_made_in_china (manufacture_country_id);