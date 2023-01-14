CREATE TABLE edw_test_tb.Transaction_Tbl(
 CustID int ,
 TranID int ,
 TranAmt float ,
 TranDate date 
) 
INSERT edw_test_tb.Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1001, 20001, 10000, CAST('2020-04-25' AS Date));
INSERT edw_test_tb.Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1001, 20002, 15000, CAST('2020-04-25' AS Date));
INSERT edw_test_tb.Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1001, 20003, 80000, CAST('2020-04-25' AS Date));
INSERT edw_test_tb.Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1001, 20004, 20000, CAST('2020-04-25' AS Date));
INSERT edw_test_tb.Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1002, 30001, 7000, CAST('2020-04-25' AS Date)) ;
INSERT edw_test_tb.Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1002, 30002, 15000, CAST('2020-04-25' AS Date));
INSERT edw_test_tb.Transaction_Tbl (CustID, TranID, TranAmt, TranDate) VALUES (1002, 30003, 22000, CAST('2020-04-25' AS Date));



select b.custID,b.TranID,a.MaximumTransaction,(TranAmt/MaximumTransaction) as Ratio,TranDate From edw_test_tb.Transaction_Tbl b Inner join 
(select custID,max(TranAmt) AS MaximumTransaction from edw_test_tb.Transaction_Tbl group by custID)a on a.custID=b.custID

with ctemax as 
(select CustID,max(TranAmt) as maximumm from edw_test_tb.Transaction_Tbl group by custID)
select a.CustID,a.TranID,maximumm,(TranAmt/maximumm) as ratio, a.TranDate from edw_test_tb.Transaction_Tbl a inner join ctemax b on a.custID=b.CustID
