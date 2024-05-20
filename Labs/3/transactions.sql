-- Транзакція додавання типу пилососа
BEGIN IF NOT EXISTS (
    SELECT 1
    FROM "Type"
    WHERE
        type_name = 'NewTypeName'
        AND power_supply_type = 'PowerSupplyType'
        AND filtration_system_type = 'FiltrationSystemType'
) THEN
INSERT INTO
    "Type" (
        type_name,
        power_supply_type,
        filtration_system_type
    )
VALUES (
        'NewTypeName',
        'PowerSupplyType',
        'FiltrationSystemType'
    );

ELSE RAISE NOTICE 'Тип вже існує';

END IF;

COMMIT;