create table course2(dept_id VARCHAR(20) primary key,dept_name varchar(20),course_code varchar(20),course_name varchar(20));
insert into course1 values('1','ad',1,'fai');
insert into course1 values('2','cse',2,'os');
insert into course1 values('3','ad',3,'aa');
insert into course2 values('1','ad','ad','fai');
declare
cname course2.course_name%type;
procedure findcourse(c out course2.course_name%type)
is
begin
select course_name into c from course2 where course_code='ad';
end;
begin
findcourse(cname);
DBMS_OUTPUT.put_line('COURSENAME='||cname);
end;
/
declare
x number;
procedure fetchval(x in number)
is
cursor val is select * from course1;
rcount number :=0;
begin
for i in val loop
exit when rcount>=x;
rcount:=rcount+1;
DBMS_OUTPUT.PUT_LINE(i.dept_id||' '||i.dept_name||' '||i.course_code||' '||i.course_name);
end loop;
end;
begin
fetchval(2);
end;
/
declare
c number;
procedure coursecount(ccode in number,ccount out number)
is
begin
select count(*) into ccount from course1 where course_code=ccode;
end;
begin
coursecount(2,c);
DBMS_OUTPUT.put_line('Count='||c);
end;
/
