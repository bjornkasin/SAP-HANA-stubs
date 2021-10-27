-- AS USER SYSTEM
CREATE USER devuser PASSWORD Welcome1 NO FORCE_FIRST_PASSWORD_CHANGE; --SET USERGROUP DEFAULT;
GRANT CATALOG READ TO devuser WITH ADMIN OPTION;
GRANT CREATE SCHEMA TO devuser WITH ADMIN OPTION;

CREATE USER repluser PASSWORD Welcome1 NO FORCE_FIRST_PASSWORD_CHANGE; --SET USERGROUP DEFAULT;
GRANT CATALOG READ TO devuser WITH ADMIN OPTION;
GRANT CREATE SCHEMA TO devuser WITH ADMIN OPTION;


--- IN HANA CLOUD - as DBADMIN
CREATE USER cloudrepluser PASSWORD Welcome1 NO FORCE_FIRST_PASSWORD_CHANGE SET USERGROUP DEFAULT;
GRANT CATALOG READ TO cloudrepluser WITH ADMIN OPTION;
GRANT CREATE SCHEMA TO cloudrepluser WITH ADMIN OPTION;
GRANT AGENT ADMIN TO cloudrepluser WITH ADMIN OPTION;
GRANT ADAPTER ADMIN TO cloudrepluser WITH ADMIN OPTION;
GRANT ROLE ADMIN TO cloudrepluser WITH ADMIN OPTION;
GRANT CREATE REMOTE SOURCE TO cloudrepluser WITH ADMIN OPTION;


-- IN HANA on-premise
-- AS USER DEVUSER

CREATE SCHEMA travel;
SET SCHEMA TRAVEL;

CREATE COLUMN TABLE travel.room (
  hno INTEGER,
  type CHAR(6),
  free INTEGER,
  price NUMERIC(6, 2),
  PRIMARY KEY (hno, type)
);

INSERT INTO travel.room VALUES (10, 'single', 20, 135.00);
INSERT INTO travel.room VALUES (10, 'double', 45, 200.00);
INSERT INTO travel.room VALUES (30, 'single', 12, 45.00);
INSERT INTO travel.room VALUES (30, 'double', 15, 80.00);
INSERT INTO travel.room VALUES (100, 'single', 11, 60.00);
INSERT INTO travel.room VALUES (100, 'double', 24, 100.00);
INSERT INTO travel.room VALUES (110, 'single', 2, 70.00);
INSERT INTO travel.room VALUES (110, 'double', 10, 130.00);
INSERT INTO travel.room VALUES (120, 'single', 34, 80.00);
INSERT INTO travel.room VALUES (120, 'double', 78, 140.00);
INSERT INTO travel.room VALUES (120, 'suite', 55, 350.00);
INSERT INTO travel.room VALUES (130, 'single', 89, 100.00);
INSERT INTO travel.room VALUES (130, 'double', 300, 270.00);
INSERT INTO travel.room VALUES (130, 'suite', 100, 700.00);
INSERT INTO travel.room VALUES (140, 'single', 10, 99.00);
INSERT INTO travel.room VALUES (140, 'double', 9, 149.00);
INSERT INTO travel.room VALUES (140, 'suite', 78, 499.00);


CREATE COLUMN TABLE city ( 
        zip NVARCHAR(5) PRIMARY KEY,
        name NVARCHAR(30) NOT NULL,
        state NVARCHAR(2) NOT NULL
    );

CREATE COLUMN TABLE hotel (
	hno INTEGER PRIMARY KEY,
	name NVARCHAR(50) NOT NULL,
	zip NVARCHAR(5),
	address NVARCHAR(40) NOT NULL
);

INSERT INTO city VALUES ('60601', 'Chicago', 'IL');
INSERT INTO city VALUES ('75243', 'Dallas', 'TX');
INSERT INTO city VALUES ('32018', 'Daytona Beach', 'FL');
INSERT INTO city VALUES ('48226', 'Detroit', 'MI');
INSERT INTO city VALUES ('90029', 'Hollywood', 'CA');
INSERT INTO city VALUES ('90804', 'Long Beach', 'CA');
INSERT INTO city VALUES ('11788', 'Long Island', 'NY');
INSERT INTO city VALUES ('90018', 'Los Angeles', 'CA');
INSERT INTO city VALUES ('70112', 'New Orleans', 'LA');

INSERT INTO hotel VALUES (10, 'Long Island', '11788', '1499 Grove Street');
INSERT INTO hotel VALUES (30, 'Lake Michigan', '60601', '354 Oak Terrace');
INSERT INTO hotel VALUES (100, 'Beachside', '32018', '1980 34th St.');
INSERT INTO hotel VALUES (110, 'Atlantic', '33441', '111 78th St.');
INSERT INTO hotel VALUES (120, 'Calypso', '90804', '35 Broadway');
INSERT INTO hotel VALUES (130, 'Evening Star', '90029', '13 Beechwood Place');
INSERT INTO hotel VALUES (140, 'Steamboat Louis Armstrong', '70112', '788 Main St.');
