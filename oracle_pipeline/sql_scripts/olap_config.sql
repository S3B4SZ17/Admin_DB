--- Creation of tablespaces
CREATE TABLESPACE glob DATAFILE '/home/oracle/proyecto_final/tablespaces/dato_glob.dbf' SIZE 3M AUTOEXTEND ON NEXT 12K MAXSIZE 10M;
CREATE TEMPORARY TABLESPACE globtmp TEMPFILE '/home/oracle/proyecto_final/tablespaces/temp_glob.dbf' SIZE 10M AUTOEXTEND ON NEXT 64K MAXSIZE 20M;

--- User GLOBAL creation
CREATE USER "GLOBAL" IDENTIFIED BY password
   DEFAULT TABLESPACE glob
   TEMPORARY TABLESPACE globtmp
   QUOTA UNLIMITED ON glob;

--- Assigning priviliges to user GLOBAL
GRANT OLAP_USER TO GLOBAL;
GRANT CREATE SESSION TO GLOBAL;
GRANT OLAP_XS_ADMIN TO GLOBAL;
