CREATE DATABASE dogAdoptionDB;
USE dogAdoptionDB;

CREATE TABLE users (
	 username varchar(50),
     pw varchar (50),
     firstname varchar(50),
     lastname varchar(50),
     email varchar(50)
     
);

INSERT INTO users VALUES ('darpanshah','darpanpw', 'Darpan','Shah','gg2002@wayne.edu');
INSERT INTO users VALUES ('nidhinadig','nidhipw', 'Nidhi','Nadig','nidhiEmail@gmail.com');
INSERT INTO users VALUES ('coreytessler','woofbarkbark', 'Corey','Tessler','woofwoof@bark.com');

SELECT * from users;
