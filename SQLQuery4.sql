CREATE LOGIN SalesAnalyst WITH PASSWORD = 'SecureHR123!';

Use hr;

create user salesAnalyst for login salesAnalyst;

create role sales_role;

alter role sales_role add member salesanalyst;

grant select, insert, update on employees to sales_role;

grant select, insert, update on departments to sales_role;

grant select on jobs to sales_role;

create login dataAnalyst with password = 'analyst@12345';

use hr;

create user dataAnalyst for login dataAnalyst;

create role analyst_role;

alter role analyst_role  add member dataAnalyst;

grant select, insert, update on employees to analyst_role;

grant select, insert, update on departments to analyst_role;

grant select on jobs to analyst_role;

create login Regional_Manager with password = 'RegionSecure789!';

use hr;

create user Regional_Manager for login Regional_manager;

create role Finance_Officer;

grant select on employees to Finance_Officer;

grant select on departments to Finance_Officer;