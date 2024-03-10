-- 1. Отримати всі дані про всі моделі пилососів
SELECT * FROM "VacuumCleaner";

-- 2. Вивести назви всіх моделей та їх потужність:
SELECT "name", "power_w" FROM "VacuumCleaner";

-- 3. Показати бренди та моделі, вироблені в Німеччині:
SELECT v."name", b."brand_name"
FROM
    "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    m."name" = 'Germany';

-- 4. Вивести моделі пилососів з їх вагою, впорядковані за зростанням ваги:
SELECT "name", "weight_kg" FROM "VacuumCleaner" ORDER BY "weight_kg";

-- 5. Показати моделі пилососів з потужністю більше 500 Вт:
SELECT "name", "power_w" FROM "VacuumCleaner" WHERE "power_w" > 500;

-- 6. Вивести моделі пилососів, впорядковані за назвою бренду:
SELECT v."name", b."brand_name"
FROM "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
ORDER BY b."brand_name";

-- 7. Показати моделі пилососів, виготовлені в Китаї або В'єтнамі:
SELECT v."name", m."name" AS "manufacture_country"
FROM
    "VacuumCleaner" v
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    m."name" IN ('Vietnam', 'China');

-- 8. Вивести унікальні типи пилососів, які представлені в базі даних:
SELECT DISTINCT
    t."type_name"
FROM "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id";

-- 9. Показати моделі пилососів, що використовують батареї, впорядковані за зменшенням потужності:
SELECT v."name", v."power_w"
FROM "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id"
WHERE
    t."power_supply_type" = 'Battery-powered'
ORDER BY v."power_w" DESC;

-- 10. Вивести середню потужність всіх пилососів у базі даних:
SELECT AVG("power_w") AS "average_power" FROM "VacuumCleaner";

-- 11. Показати кількість моделей пилососів кожного бренду в порядку зменшення:
SELECT b."brand_name", COUNT(v."vacuum_cleaner_id") AS "model_count"
FROM "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
GROUP BY
    b."brand_name"
ORDER BY "model_count" DESC;

-- 12. Вивести моделі пилососів, що мають вагу менше 6 кг та потужність більше 600 Вт:
SELECT "name", "weight_kg", "power_w"
FROM "VacuumCleaner"
WHERE
    "weight_kg" < 6
    AND "power_w" > 600;

-- 13. Показати моделі пилососів з назвами, брендами та країнами виробництва:
SELECT v."name", b."brand_name", m."name" AS "manufacture_country"
FROM
    "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id";

-- 14. Вивести моделі пилососів з найбільшою потужністю:
SELECT "name", "power_w"
FROM "VacuumCleaner"
WHERE
    "power_w" = (
        SELECT MAX("power_w")
        FROM "VacuumCleaner"
    );

-- 15. Показати моделі пилососів з найлегшою вагою:
SELECT "name", "weight_kg"
FROM "VacuumCleaner"
WHERE
    "weight_kg" = (
        SELECT MIN("weight_kg")
        FROM "VacuumCleaner"
    );

-- 16. Вивести всі моделі пилососів, у яких бренд починається на літеру "S":
SELECT v."name", b."brand_name"
FROM "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
WHERE
    b."brand_name" LIKE 'S%';

-- 17. Показати моделі пилососів з типом "Stick" і потужністю більше 400 Вт:
SELECT v."name", t."type_name", v."power_w"
FROM "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id"
WHERE
    t."type_name" = 'Stick'
    AND v."power_w" > 400;

-- 18. Вивести моделі пилососів, вироблені у Німеччині та потужністю більше 700 Вт:
SELECT v."name", m."name" AS "manufacture_country", v."power_w"
FROM
    "VacuumCleaner" v
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    m."name" = 'Germany'
    AND v."power_w" > 700;

-- 19. Показати моделі пилососів з типом фільтрації "HEPA" і потужністю більше 500 Вт:
SELECT v."name", t."filtration_system_type", v."power_w"
FROM "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id"
WHERE
    t."filtration_system_type" = 'HEPA'
    AND v."power_w" > 500;

-- 20. Вивести середню вагу пилососів для кожного бренду:
SELECT b."brand_name", AVG(v."weight_kg") AS "average_weight"
FROM "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
GROUP BY
    b."brand_name";

-- 21. Показати моделі пилососів з потужністю від 1000 Вт до 1500 Вт:
SELECT "name", "power_w"
FROM "VacuumCleaner"
WHERE
    "power_w" BETWEEN 1000 AND 1500;

-- 22. Вивести моделі пилососів, виготовлених у Китаї:
SELECT v."name"
FROM
    "VacuumCleaner" v
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    m."name" = 'China';

-- 23. Показати моделі пилососів, які мають вагу менше 10 кг та потужність більше 800 Вт:
SELECT "name", "weight_kg", "power_w"
FROM "VacuumCleaner"
WHERE
    "weight_kg" < 10
    AND "power_w" > 800;

-- 24. Вивести назви моделей та їх вагу, впорядковані за зростанням ваги:
SELECT "name", "weight_kg"
FROM "VacuumCleaner"
ORDER BY "weight_kg" ASC;

-- 25. Показати моделі пилососів, які використовують бездротове живлення:
SELECT "name"
FROM "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id"
WHERE
    t."power_supply_type" = 'Battery-powered';

-- 26. Вивести моделі пилососів, впорядковані за назвою в зворотньому алфавітному порядку:
SELECT "name" FROM "VacuumCleaner" ORDER BY "name" DESC;

-- 27. Показати кількість моделей пилососів для кожного типу:
SELECT t."type_name", COUNT(v."vacuum_cleaner_id") AS "model_count"
FROM "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id"
GROUP BY
    t."type_name";

-- 28. Вивести моделі пилососів, вироблені в Китаї, і потужність яких менше 600 Вт:
SELECT v."name", v."power_w"
FROM
    "VacuumCleaner" v
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    m."name" = 'China'
    AND "power_w" < 600;

-- 29. Показати моделі пилососів з потужністю менше 100 Вт:
SELECT "name", "power_w" FROM "VacuumCleaner" WHERE "power_w" < 100;

-- 30. Вивести середню вагу пилососів у кожній країні виробництва:
SELECT
    m."name" AS "manufacture_country",
    AVG(v."weight_kg") AS "average_weight"
FROM
    "VacuumCleaner" v
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
GROUP BY
    m."name";

-- 31. Показати моделі пилососів, які мають HEPA фільтрацію та вагу менше 4 кг:
SELECT
    "name",
    "filtration_system_type",
    "weight_kg"
FROM "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id"
WHERE
    t."filtration_system_type" = 'HEPA'
    AND "weight_kg" < 4;

-- 32. Вивести моделі пилососів, які мають провідний тип живлення та вагу менше 5 кг:
SELECT
    "name",
    "power_supply_type",
    "weight_kg"
FROM "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id"
WHERE
    t."power_supply_type" = 'Corded'
    AND "weight_kg" < 5;

-- 33. Показати моделі пилососів, впорядковані за потужністю від найменшої до найбільшої:
SELECT "name", "power_w" FROM "VacuumCleaner" ORDER BY "power_w" ASC;

-- 34. Вивести моделі пилососів, які випускає бренд Samsung:
SELECT "name"
FROM "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
WHERE
    b."brand_name" = 'Samsung Electronics';

-- 35. Показати кількість моделей пилососів, вироблених кожною країною, для моделей з потужністю більше 700 Вт:
SELECT
    m."name" AS "manufacture_country",
    COUNT(v."vacuum_cleaner_id") AS "model_count"
FROM
    "VacuumCleaner" v
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    v."power_w" > 700
GROUP BY
    m."name";

-- 36. Вивести моделі пилососів, які мають тип фільтрації "Aquafilter" або "HEPA":
SELECT
    "name",
    "filtration_system_type"
FROM "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id"
WHERE
    t."filtration_system_type" IN ('Aquafilter', 'HEPA');

-- 37. Показати середню потужність пилососів для кожного типу:
SELECT t."type_name", AVG(v."power_w") AS "average_power"
FROM "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id"
GROUP BY
    t."type_name";

-- 38. Вивести моделі пилососів, вироблені в Німеччині, з вагою менше 4 кг:
SELECT v."name", v."weight_kg"
FROM
    "VacuumCleaner" v
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    m."name" = 'Germany'
    AND "weight_kg" < 4;

-- 39. Показати моделі пилососів, в яких потужність дорівнює від 200 до 400 Вт:
SELECT "name", "power_w"
FROM "VacuumCleaner"
WHERE
    "power_w" BETWEEN 200 AND 400;

-- 40. Вивести моделі пилососів, які мають тип фільтрації "HEPA" та потужність більше 600 Вт:
SELECT "name", "power_w"
FROM "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id"
WHERE
    t."filtration_system_type" = 'HEPA'
    AND "power_w" > 600;

-- 41. Показати моделі пилососів, які мають вагу менше 3 кг та потужність менше 500 Вт:
SELECT "name", "weight_kg", "power_w"
FROM "VacuumCleaner"
WHERE
    "weight_kg" < 3
    AND "power_w" < 500;

-- 42. Вивести моделі пилососів, вироблені в Китаї, з потужністю більше 700 Вт:
SELECT v."name", v."power_w"
FROM
    "VacuumCleaner" v
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    m."name" = 'China'
    AND "power_w" > 700;

-- 43. Показати моделі пилососів з потужністю менше 200 Вт та вагою більше 3 кг:
SELECT "name", "power_w", "weight_kg"
FROM "VacuumCleaner"
WHERE
    "power_w" < 200
    AND "weight_kg" > 3;

-- 44. Вивести моделі пилососів, в яких потужність дорівнює 18 Вт:
SELECT "name" FROM "VacuumCleaner" WHERE "power_w" = 18;

-- 45. Показати кількість моделей пилососів для кожного бренду, які мають потужність менше 700 Вт:
SELECT b."brand_name", COUNT(v."vacuum_cleaner_id") AS "model_count"
FROM "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
WHERE
    v."power_w" < 700
GROUP BY
    b."brand_name";

-- 46. Вивести моделі пилососів, які мають тип фільтрації "HEPA" та вагу менше 4 кг:
SELECT
    "name",
    "filtration_system_type",
    "weight_kg"
FROM "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id"
WHERE
    t."filtration_system_type" = 'HEPA'
    AND "weight_kg" < 4;

-- 47. Показати кількість моделей пилососів для кожного типу живлення:
SELECT t."power_supply_type", COUNT(v."vacuum_cleaner_id") AS "model_count"
FROM "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id"
GROUP BY
    t."power_supply_type";

-- 48. Вивести моделі пилососів, вироблені в В'єтнаму, з вагою менше 4 кг:
SELECT v."name", v."weight_kg"
FROM
    "VacuumCleaner" v
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    m."name" = 'Vietnam'
    AND "weight_kg" < 4;

-- 49. Показати моделі пилососів, які мають тип фільтрації "Aquafilter":
SELECT
    "name",
    "filtration_system_type",
    "weight_kg"
FROM "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id"
WHERE
    t."filtration_system_type" = 'Aquafilter';

-- 50. Вивести моделі пилососів, які випускаються брендом Rowenta та мають потужність більше 600 Вт:
SELECT "name", "power_w"
FROM "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
WHERE
    b."brand_name" = 'Rowenta'
    AND "power_w" > 600;

-- 51. Показати середню потужність пилососів для кожного бренду:
SELECT b."brand_name", AVG(v."power_w") AS "average_power"
FROM "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
GROUP BY
    b."brand_name";

-- 52. Вивести моделі пилососів, які мають найвищу та найнижчу вагу:
SELECT "name", "weight_kg"
FROM "VacuumCleaner"
WHERE
    "weight_kg" = (
        SELECT MAX("weight_kg")
        FROM "VacuumCleaner"
    )
    OR "weight_kg" = (
        SELECT MIN("weight_kg")
        FROM "VacuumCleaner"
    );

-- 53. Показати кількість моделей пилососів, випущених кожним брендом, де вага перевищує 4 кг:
SELECT b."brand_name", COUNT(v."vacuum_cleaner_id") AS "model_count"
FROM "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
WHERE
    v."weight_kg" > 4
GROUP BY
    b."brand_name";

-- 54. Вивести моделі пилососів, які мають потужність найбільше в два рази більшу за середню потужність усіх пилососів:
SELECT "name", "power_w"
FROM "VacuumCleaner"
WHERE
    "power_w" > (
        SELECT AVG("power_w") * 2
        FROM "VacuumCleaner"
    );

-- 55. Показати кількість моделей пилососів для кожного типу фільтрації, де потужність менше 800 Вт:
SELECT t."filtration_system_type", COUNT(v."vacuum_cleaner_id") AS "model_count"
FROM "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id"
WHERE
    v."power_w" < 800
GROUP BY
    t."filtration_system_type";

-- 56. Вивести середню потужність пилососів, вироблених кожною країною:
SELECT
    m."name" AS "manufacture_country",
    AVG(v."power_w") AS "average_power"
FROM
    "VacuumCleaner" v
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
GROUP BY
    m."name";

--57. Показати моделі пилососів, які мають найбільшу вагу серед всіх моделей того ж бренду:
SELECT "name", "weight_kg"
FROM "VacuumCleaner" v1
WHERE
    "weight_kg" = (
        SELECT MAX("weight_kg")
        FROM "VacuumCleaner" v2
        WHERE
            v1."brand_id" = v2."brand_id"
    );

-- 58. Вивести моделі пилососів, які мають назву, що складається з більше ніж 3 слів:
SELECT "name" FROM "VacuumCleaner" WHERE "name" LIKE '% % % %';

-- 59. Показати кількість моделей пилососів для кожного типу фільтрації, які вироблені в Німеччині:
SELECT t."filtration_system_type", COUNT(v."vacuum_cleaner_id") AS "model_count"
FROM
    "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id"
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    m."name" = 'Germany'
GROUP BY
    t."filtration_system_type";

-- 60. Вивести моделі пилососів, які мають назву, що починається з літери "X" або "Z":
SELECT "name"
FROM "VacuumCleaner"
WHERE
    "name" LIKE 'X%'
    OR "name" LIKE 'Z%';

-- 61. Показати кількість моделей пилососів, випущених кожним брендом, де тип фільтрації - "HEPA" та вага менше 5 кг:
SELECT b."brand_name", COUNT(v."vacuum_cleaner_id") AS "model_count"
FROM
    "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
    JOIN "Type" t ON v."type_id" = t."type_id"
WHERE
    t."filtration_system_type" = 'HEPA'
    AND v."weight_kg" < 5
GROUP BY
    b."brand_name";

-- 62. Показати кількість моделей пилососів для кожного бренду, які мають тип фільтрації "Aquafilter" та вагу більше 4 кг:
SELECT b."brand_name", COUNT(v."vacuum_cleaner_id") AS "model_count"
FROM
    "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
    JOIN "Type" t ON v."type_id" = t."type_id"
WHERE
    t."filtration_system_type" = 'Aquafilter'
    AND v."weight_kg" > 4
GROUP BY
    b."brand_name";

-- 63. Вивести моделі пилососів, які мають назву, що містить слово "Pro" у назві:
SELECT "name" FROM "VacuumCleaner" WHERE "name" LIKE '%Pro%';

-- 64. Вивести моделі пилососів, які мають назву, що містить слово "Pure" у назві:
SELECT "name" FROM "VacuumCleaner" WHERE "name" LIKE '%Pure%';

-- 64. Вивести моделі пилососів, які мають назву, що містить слово "Stick" у назві:
SELECT "name" FROM "VacuumCleaner" WHERE "name" LIKE '%Stick%';

-- 65. Показати кількість моделей пилососів для кожної країни виробництва, де потужність менше 700 Вт та вага більше 3 кг:
SELECT
    m."name" AS "manufacture_country",
    COUNT(v."vacuum_cleaner_id") AS "model_count"
FROM
    "VacuumCleaner" v
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    v."power_w" < 700
    AND v."weight_kg" > 3
GROUP BY
    m."name";

-- 66. Вивести моделі пилососів, вироблені в країнах, в яких потужність має середнє значення менше за загальне середнє значення потужності всіх пилососів:
SELECT v."name", v."power_w", m."name" AS "manufacture_country"
FROM
    "VacuumCleaner" v
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    m."name" IN (
        SELECT m."name"
        FROM
            "VacuumCleaner" v
            JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
        GROUP BY
            m."name"
        HAVING
            AVG(v."power_w") < (
                SELECT AVG("power_w")
                FROM "VacuumCleaner"
            )
    );

-- 67. Показати моделі пилососів, які мають найбільшу потужність серед усіх пилососів того ж типу фільтрації:
SELECT v."name", v."power_w", t."filtration_system_type"
FROM "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id"
WHERE (v."type_id", v."power_w") IN (
        SELECT "type_id", MAX("power_w")
        FROM "VacuumCleaner"
        GROUP BY
            "type_id"
    );

-- 68. Вивести моделі пилососів, які мають назву, що складається з двух слів:
SELECT "name" FROM "VacuumCleaner" WHERE "name" NOT LIKE '% % %';

-- 69. Показати кількість моделей пилососів для кожного типу фільтрації, де потужність більше за середнє значення потужності всіх пилососів:
SELECT t."filtration_system_type", COUNT(v."vacuum_cleaner_id") AS "model_count"
FROM "VacuumCleaner" v
    JOIN "Type" t ON v."type_id" = t."type_id"
WHERE
    v."power_w" > (
        SELECT AVG("power_w")
        FROM "VacuumCleaner"
    )
GROUP BY
    t."filtration_system_type";

-- 70. Вивести моделі пилососів, вироблені в країнах, крім Німеччини та Китаю, з вагою менше 5 кг:
SELECT v."name", m."name" AS "manufacture_country", v."weight_kg"
FROM
    "VacuumCleaner" v
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    m."name" NOT IN ('Germany', 'China')
    AND v."weight_kg" < 5;

-- 71. Показати кількість моделей пилососів для кожного бренду, які мають вагу менше 3 кг та вироблені у В'єтнамі:
SELECT b."brand_name", COUNT(v."vacuum_cleaner_id") AS "model_count"
FROM
    "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    m."name" = 'Vietnam'
    AND v."weight_kg" < 3
GROUP BY
    b."brand_name";

-- 72. Вивести моделі пилососів, які мають назву без цифри 1:
SELECT "name" FROM "VacuumCleaner" WHERE "name" NOT LIKE '%1%';

-- 73. Вивести моделі пилососів, які мають назву з символом "/":
SELECT "name" FROM "VacuumCleaner" WHERE "name" LIKE '%/%';

-- 74. Показати моделі пилососів, в яких вага менше середнього значення ваги всіх пилососів, а потужність більше середнього значення потужності:
SELECT "name", "weight_kg", "power_w"
FROM "VacuumCleaner"
WHERE
    "weight_kg" < (
        SELECT AVG("weight_kg")
        FROM "VacuumCleaner"
    )
    AND "power_w" > (
        SELECT AVG("power_w")
        FROM "VacuumCleaner"
    );

-- 75. Вивести моделі пилососів, які мають назву, що містить цифри:
SELECT "name" FROM "VacuumCleaner" WHERE "name" SIMILAR TO '%[0-9]%';

-- 76. Показати моделі пилососів, які мають потужність у межах від 1000 до 1500 Вт включно:
SELECT "name", "power_w"
FROM "VacuumCleaner"
WHERE
    "power_w" BETWEEN 1200 AND 1500;

-- 77. Вивести моделі пилососів, в яких бренд є виробником та країна виробництва співпадає:
SELECT v."name", b."brand_name", m."name" AS "manufacture_country"
FROM
    "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    b."brand_country" = m."name";

-- 78. Показати моделі пилососів, які мають найбільшу вагу серед пилососів того ж бренду:
SELECT v1."name", v1."weight_kg"
FROM "VacuumCleaner" v1
    JOIN (
        SELECT "brand_id", MAX("weight_kg") AS "max_weight"
        FROM "VacuumCleaner"
        GROUP BY
            "brand_id"
    ) v2 ON v1."brand_id" = v2."brand_id"
    AND v1."weight_kg" = v2."max_weight";

-- 79. Вивести моделі пилососів, які мають назву, що починається на "D" або "S" і мають потужність більше 500 Вт:
SELECT "name", "power_w"
FROM "VacuumCleaner"
WHERE (
        "name" LIKE 'D%'
        OR "name" LIKE 'S%'
    )
    AND "power_w" > 500;

-- 80. Показати моделі пилососів, які мають найменшу вагу серед пилососів з тим же типом фільтрації:
SELECT v1."name", v1."weight_kg"
FROM "VacuumCleaner" v1
    JOIN (
        SELECT "type_id", MIN("weight_kg") AS "min_weight"
        FROM "VacuumCleaner"
        GROUP BY
            "type_id"
    ) v2 ON v1."type_id" = v2."type_id"
    AND v1."weight_kg" = v2."min_weight";

-- 81. Показати моделі пилососів, вироблені в країнах, де кількість випущених моделей перевищує 3:
SELECT v."name", m."name" AS "manufacture_country"
FROM
    "VacuumCleaner" v
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    m."manufacture_country_id" IN (
        SELECT "manufacture_country_id"
        FROM "VacuumCleaner"
        GROUP BY
            "manufacture_country_id"
        HAVING
            COUNT("vacuum_cleaner_id") > 3
    );

-- 83. Вивести моделі пилососів, які мають назву, що складається з символів верхнього регістру:
SELECT "name" FROM "VacuumCleaner" WHERE "name" ~ '[[:upper:]]+';

-- 84. Отримати всі дані з таблиці Brand
SELECT * FROM "Brand";

-- 85. Отримати всі дані з таблиці ManufactureCountry
SELECT * FROM "ManufactureCountry";

-- 86. Отримати всі дані з таблиці Type
SELECT * FROM "Type";

-- 87. Вивести всю інформацію за алфавітним порядком
SELECT
    v."vacuum_cleaner_id",
    b."brand_name",
    v."name",
    m."name" as manufacture_country,
    t."type_name",
    v."power_w",
    v."weight_kg"
FROM
    "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
    JOIN "Type" t ON v."type_id" = t."type_id"
ORDER BY "name" ASC;

-- 88. Вивести всю інформацію з лімітом 5
SELECT
    v."vacuum_cleaner_id",
    b."brand_name",
    v."name",
    m."name" as manufacture_country,
    t."type_name",
    v."power_w",
    v."weight_kg"
FROM
    "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
    JOIN "Type" t ON v."type_id" = t."type_id"
LIMIT 5;

-- 89. Отримати всі типи пилососів з системою фітрації, крім HEPA:
SELECT *
FROM "Type" t
WHERE
    t."filtration_system_type" NOT LIKE 'HEPA'
    -- 90. Отримати всі бренди пилососів, крім країни походження Німеччина:
SELECT *
FROM "Brand" b
WHERE
    b."brand_country" NOT LIKE 'Germany'
    -- 91. Показати моделі пилососів, в яких потужність, поділена на 100, більше ваги:
SELECT "name", "power_w", "weight_kg"
FROM "VacuumCleaner"
WHERE ("power_w" / 100) > "weight_kg";

-- 92. Вивести моделі пилососів, які мають вагу більше 6 кг або потужність менше 500 Вт:
SELECT "name", "power_w", "weight_kg"
FROM "VacuumCleaner"
WHERE
    "weight_kg" > 6
    OR "power_w" < 500;

-- 93. Показати моделі пилососів, в яких назва складається з більше ніж двох слів:
SELECT "name" FROM "VacuumCleaner" WHERE "name" LIKE '% % %';

-- 94. Вивести моделі пилососів, які мають найменшу вагу серед всіх моделей:
SELECT "name", "weight_kg"
FROM "VacuumCleaner"
WHERE
    "weight_kg" = (
        SELECT MIN("weight_kg")
        FROM "VacuumCleaner"
    );

-- 95. Показати моделі пилососів, вироблені у країнах, де бренд та країна не співпадають:
SELECT v."name", b."brand_name", m."name" AS "manufacture_country"
FROM
    "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    b."brand_country" != m."name";

-- 96. Вивести моделі пилососів, які мають вагу менше або рівну 3 кг та потужність більше 700 Вт:
SELECT "name", "power_w", "weight_kg"
FROM "VacuumCleaner"
WHERE
    "weight_kg" <= 6
    AND "power_w" > 700;

-- 97. Показати моделі пилососів, вироблені в Німеччині та мають потужність більше 1000 Вт:
SELECT v."name", v."power_w"
FROM
    "VacuumCleaner" v
    JOIN "ManufactureCountry" m ON v."manufacture_country_id" = m."manufacture_country_id"
WHERE
    m."name" = 'Germany'
    AND v."power_w" > 1000;

-- 98. Вивести моделі пилососів, які мають найменшу вагу серед всіх моделей виробника "Bosch":
SELECT "name", "weight_kg"
FROM "VacuumCleaner"
WHERE
    "brand_id" = (
        SELECT "brand_id"
        FROM "Brand"
        WHERE
            "brand_name" = 'Bosch'
    )
ORDER BY "weight_kg"
LIMIT 1;

-- 99. Показати моделі пилососів, які мають назву, що починається з літери, що йде після "M" у алфавіті:
SELECT "name"
FROM "VacuumCleaner"
WHERE
    "name" > 'M'
ORDER BY "name";

-- 100. Вивести моделі пилососів, які мають потужність, що кратна 100 Вт:
SELECT "name", "power_w"
FROM "VacuumCleaner"
WHERE
    "power_w" % 100 = 0;

SELECT * FROM "Brand"
--К-ть брендів які випуск типи пилесосів id=6

SELECT COUNT(DISTINCT b."brand_name") as "q_brands", t."type_name"
FROM
    "VacuumCleaner" v
    JOIN "Brand" b ON v."brand_id" = b."brand_id"
    JOIN "Type" t ON v."type_id" = t."type_id"
WHERE
    t."type_id" = 6
GROUP BY
    t."type_name"