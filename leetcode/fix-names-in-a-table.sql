-- 문자열 다루기
-- substr보다 length로 right 자른게 훨씬 빨라서 놀랐다
select user_id, 
concat(upper(left(name, 1)), lower(right(name, length(name)-1))) as name
from users
order by user_id
