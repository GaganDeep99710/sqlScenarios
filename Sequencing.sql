CREATE TABLE edw_test_tb.Emp(
Groups varchar(20),
Sequence  int )


INSERT INTO edw_test_tb.Emp VALUES('A',1);
INSERT INTO edw_test_tb.Emp VALUES('A',2);
INSERT INTO edw_test_tb.Emp VALUES('A',3);
INSERT INTO edw_test_tb.Emp VALUES('A',5);
INSERT INTO edw_test_tb.Emp VALUES('A',6);
INSERT INTO edw_test_tb.Emp VALUES('A',8);
INSERT INTO edw_test_tb.Emp VALUES('A',9);
INSERT INTO edw_test_tb.Emp VALUES('B',11);
INSERT INTO edw_test_tb.Emp VALUES('C',1);
INSERT INTO edw_test_tb.Emp VALUES('C',2);
INSERT INTO edw_test_tb.Emp VALUES('C',3);

select * from edw_test_tb.Emp

select groups,sequence,row_number() over (partition by Groups order by sequence ) as ranks from edw_test_tb.Emp
select Groups,min(Sequence),max(Sequence) from (select groups,sequence,row_number() over (partition by Groups order by sequence ) as ranks,(Sequence-ranks) as diff from edw_test_tb.Emp) A group by Groups,diff ORDER by Groups