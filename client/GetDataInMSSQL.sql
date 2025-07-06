-- This script retrieves data from a REST API endpoint and processes the JSON response in SQL Server.

/*
Before running this script, ensure that the SQL Server instance has the necessary permissions to execute OLE Automation procedures.
You can enable OLE Automation procedures by executing the following command:    
sp_configure 'show advanced options', 1;  
GO  
RECONFIGURE;  
GO  
sp_configure 'Ole Automation Procedures', 1;  
GO  
RECONFIGURE;  
GO
*/

DECLARE @URL NVARCHAR(MAX) = 'http://127.0.0.1:8000/candybar';
Declare @Object as Int;
Declare @ResponseText as Varchar(8000);
Exec sp_OACreate 'MSXML2.XMLHTTP', @Object OUT;
Exec sp_OAMethod @Object, 'open', NULL, 'get', @URL, 'False'
Exec sp_OAMethod @Object, 'send'
Exec sp_OAMethod @Object, 'responseText', @ResponseText OUTPUT
IF((Select @ResponseText) <> '')
BEGIN
    DECLARE @json NVARCHAR(MAX) = (Select @ResponseText)
    SELECT
        JSON_VALUE([value], '$.id')     AS id,
        JSON_VALUE([value], '$.name')   AS name,
        JSON_VALUE([value], '$.flavor') AS flavor,
        JSON_VALUE([value], '$.price')  AS price
    FROM OPENJSON(@json, '$.candies')
END
ELSE
BEGIN
    DECLARE @ErroMsg NVARCHAR(30) = 'No data found.';
    Print @ErroMsg;
END
Exec sp_OADestroy @Object