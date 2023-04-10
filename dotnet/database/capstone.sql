USE master
GO

-- Drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END

CREATE DATABASE final_capstone
GO

USE final_capstone
GO

-- Create Tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL
	CONSTRAINT PK_user PRIMARY KEY (user_id)
)

-- Populate default data for testing: user and admin with password of 'password'
-- These values should not be kept when going to Production
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');
GO

CREATE TABLE coffee_shops (
	shop_id int IDENTITY(1,1) NOT NULL,
	shop_name varchar(50) NOT NULL,
	shop_location nvarchar(150) NOT NULL,
	about_shop nvarchar (500),
	shop_has_spirits bit, 
	image_path nvarchar(300) NOT NULL,
	CONSTRAINT PK_shop_id PRIMARY KEY (shop_id)
	)


INSERT INTO coffee_shops (shop_name, shop_location, about_shop, image_path, shop_has_spirits) VALUES 
('Stauf''s Victorian Village', '1334 Neil Ave, Columbus, OH 43201', NULL, 'vvstaufs.jpg', 0),
('Stauf''s German Village', '627 S. 3rd St. Columbus, OH 43206', NULL, 'gvstaufs.jpg', 0),
('Stauf''s Grandview', '1277 Grandview Ave, Columbus, OH 43212', NULL, 'staufs.jpg', 0),
('Fox in the Snow', '1031 N 4th St, Columbus, OH 43201', NULL, 'fox.jpg', 0),
('Roaming Goat', '849 N High St, Columbus, OH 43215', NULL, 'roaminggoat.jpg', 0),
('Chocolate Cafe', '1855 Northwest Blvd, Columbus, OH 43212', NULL, 'chocolate-cafe.jpg', 1),
('Winan''s Chocolate + Coffee + Wine', '1125 Yard St, Grandview Heights, OH 43212', NULL, 'winans.jpg', 1),
('The Roosevelt Coffeehouse at Gravity', '462 W Broad St, Columbus, OH 43215', NULL, 'rooseveltgravity.jpg', 0),
('The Roosevelt Coffeehouse', '300 E Long St, Columbus, OH 43215', NULL, 'roosevelt.jpg', 0),
('Global Gallery', '3535 N High St, Columbus, OH 43214', NULL , 'globalgallery.jpg', 1),
('Cafe De Nook','175 S 3rd St, Columbus, OH 43215', NULL, 'nook.jpg', 0),
('One Line', '745 N High St, Columbus, OH 43215', NULL,'oneline.jpg', 0),
('Parable Coffee', '149 S High St, Columbus, OH 43215', NULL, 'Parable.jpg', 0),
('Thirdway Cafe', '3058 W Broad St, Columbus, OH 43204', NULL, 'thirdway.jpg', 0);
GO

SELECT shop_name, shop_location, shop_has_spirits, image_path  FROM coffee_shops

