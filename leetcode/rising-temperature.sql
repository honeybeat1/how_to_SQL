select w.id
from weather w, weather w2
where (to_days(w.recordDate) - to_days(w2.recordDate) = 1)
and (w.temperature > w2.temperature)
