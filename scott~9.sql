set serveroutpu on
declare
    cursor cemp is select empno,empjob from emp;
    pempno emp.empno%type;
    pjob emp.empjob%type;
begin
    rollback;
    open cemp;
    loop
        fetch cemp into pempno,pjob;
        exit when cemp%notfound;
        if pjob='president' then update emp set sal=sal+1000 where empno=pempno;
            elsif pjob='manager' then update emp set sal=sal+800 where empno=pempno;
            else update emp set sal=sal+400 where empno=pempno;
        end if;

    end loop;
    close cemp;
    commit;
    dbms_output.put_line(' salary increase ');
end;
/