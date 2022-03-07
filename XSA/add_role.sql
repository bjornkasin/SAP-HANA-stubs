set schema "DUMMY_1#DI"; 
create local temporary column table "#ROLES" like "_SYS_DI"."TT_SCHEMA_ROLES";

insert into "#ROLES" ("ROLE_NAME", "PRINCIPAL_SCHEMA_NAME", "PRINCIPAL_NAME") values ('dummy-user-role', '', 'DBADMIN'); 

call "DUMMY_1#DI"."GRANT_CONTAINER_SCHEMA_ROLES"("#ROLES", "_SYS_DI"."T_NO_PARAMETERS", ?, ?, ?); 
--call " TEST_PROJ#DI "."REVOKE_CONTAINER_SCHEMA_ROLES"("#ROLES", "_SYS_DI"."T_NO_PARAMETERS", ?, ?, ?); 
drop table "#ROLES";
