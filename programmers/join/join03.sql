SELECT ins.NAME, ins.DATETIME from ANIMAL_INS as ins
LEFT JOIN ANIMAL_OUTS as outs
ON ins.ANIMAL_ID = outs.ANIMAL_ID
WHERE outs.ANIMAL_ID is NULL
ORDER BY ins.DATETIME
LIMIT 3
