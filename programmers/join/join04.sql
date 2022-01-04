SELECT ins.ANIMAL_ID, ins.ANIMAL_TYPE, ins.NAME FROM ANIMAL_INS as ins
JOIN ANIMAL_OUTS as outs
ON ins.ANIMAL_ID = outs.ANIMAL_ID
WHERE ins.SEX_UPON_INTAKE like 'Intact %'
and outs.SEX_UPON_OUTCOME not like 'Intact %'
