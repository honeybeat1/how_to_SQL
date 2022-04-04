-- 문제) STATION 테이블에서 가장 짧은, 가장 긴 이름을 가진 도시 2개 쿼리해라 (각각의 길이와 함께)
-- 1개 이상이라면 알파벳순으로 먼저인걸로 쿼리

-- 1. 처음 시도했던 방법
-- 테이블 두개 각각 쿼리하기 싫어서, 한번에 해결할 수 있나 했으나 1개씩만 쿼리하는 방법에서 막힘
-- SELECT city, char_length(city) FROM station as a,
-- (SELECT MIN(char_length(city)) as mini, MAX(char_length(city)) as maxi from station) as m
-- WHERE char_length(city) = m.maxi
-- OR char_length(city) = m.mini
-- ORDER BY city

-- 2. 무난하게 일반적인 방법 (테이블 2개 각각 정렬하고, top 1개씩 가져오기)
SELECT city, char_length(city) as lengths FROM station
GROUP BY city
ORDER BY lengths, city
LIMIT 1;

SELECT city, char_length(city) as lengths FROM station
GROUP BY city
ORDER BY lengths DESC, city
LIMIT 1;
