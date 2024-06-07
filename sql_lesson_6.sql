/*
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

delimiter $$
create function sec(n int)
returns varchar(250)
deterministic
begin
	declare n1 int default 0;
    declare n2 int default 0;
    declare n3 int default 0;
    declare res varchar(250) default '';
    if n >= 86400 then
        set n1 = floor(n / 86400);
        set n = n - n1 * 86400;
	end if;
	if n >=	3600 then
		set n2 = floor(n / 3600);
        set n = n - n2 * 3600;
	end if;
	if n >= 60 then 
		set n3 = floor(n / 60);
        set n = n - n3 * 60;
	end if;
	set res = concat(n1, ' days ', n2, ' hours ', n3, ' minutes ', n, ' seconds');
	return res;
end $$
delimiter ;

select sec(123456);

/*
2. Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10
*/

delimiter $$
create procedure chetnye(a int)
begin
	declare res varchar(250) default '';
	while a > 0 do
		if a % 2 = 0 then set 
			res = concat(a, ' ', res);
		end if;
		set a = a - 1;
	end while;
    select res;
end $$
delimiter ;

call chetnye(10);