-- median 구하기, set 별도 변수(칼럼) 만들기.
set @rowindex = -1;
select round(LAT_N,4) from (
select @rowindex:=@rowindex+1 as row_index, LAT_N from station
order by LAT_N)row_table
where row_index in ((ceil(@rowindex/2) + floor(@rowindex/2))/2, 
                    @rowindex/2)
