set @row = 21;
select repeat('* ', @row:=@row-1) from information_schema.tables
limit 20
