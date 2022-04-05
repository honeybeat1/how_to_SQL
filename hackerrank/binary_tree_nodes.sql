-- 이진 트리의 노드의 타입을 출력하기
-- 칼럼 N은 노드 이름, 칼럼 P는 노드의 부모 노드 (NULL은 없다는 뜻)
-- 자식이 없는 노드는 Leaf, 부모가 없는 노드는 Root, 둘 다 있는 노드는 Inner

select N, 
    case
        when (P is null) then 'Root'
        when(n in (select distinct P from BST
where P is not null)) then 'Inner'
    else 'Leaf'
    end as case_result
from BST
order by N
