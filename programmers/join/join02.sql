select ins.ANIMAL_ID, ins.NAME from ANIMAL_INS as ins
left join ANIMAL_OUTS as outs
on ins.ANIMAL_ID = outs.ANIMAL_ID
-- datetime 행을 비교할때 더 빠른게 더 작음
where ins.DATETIME > outs.DATETIME
order by ins.DATETIME
