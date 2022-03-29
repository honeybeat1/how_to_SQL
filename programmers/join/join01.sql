select outs.ANIMAL_ID, outs.NAME from ANIMAL_outs as outs
left join ANIMAL_INS as ins
on outs.ANIMAL_ID = ins.ANIMAL_ID
where ins.ANIMAL_ID is NULL
