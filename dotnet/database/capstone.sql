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
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('parker','2faHsM4nx5IVczbM/AryqkIiOQg=','ZJhvbTfwCts=', 'user');
GO

CREATE TABLE coffee_shops (
	shop_id int IDENTITY(1,1) NOT NULL,
	shop_name varchar(50) NOT NULL,
	shop_location nvarchar(150) NOT NULL,
	about_shop nvarchar (max),
	shop_has_spirits bit, 
	image_path nvarchar(300) NOT NULL,
	hours_weekdays nvarchar (150),
	hours_weekends nvarchar (150),
	price_range nvarchar (5), 
	website nvarchar (150),
	CONSTRAINT PK_shop_id PRIMARY KEY (shop_id)
	)

	CREATE TABLE user_favorites (
	user_id int NOT NULL,
	shop_id int NOT NULL,
	CONSTRAINT PK_user_shop_favorites PRIMARY KEY (user_id, shop_id), 
	CONSTRAINT FK_user_favorites FOREIGN KEY (user_id) REFERENCES users (user_id),
	CONSTRAINT FK_coffee_shop_favorites FOREIGN KEY (shop_id) REFERENCES coffee_shops (shop_id)
	);



INSERT INTO coffee_shops (shop_name, shop_location, about_shop, image_path, shop_has_spirits, hours_weekdays, hours_weekends, price_range, website) VALUES 
('Stauf''s Victorian Village', '1334 Neil Ave, Columbus, OH 43201', NULL, 'vvstaufs.jpg', 0, NULL, NULL, NULL, NULL),
('Stauf''s German Village', '627 S. 3rd St. Columbus, OH 43206', 'In 1988 Stauf’s Coffee Roasters began offering specialty coffee to Central Ohio. From day one we have been obsessed with the entire process of achieving the finest cup of coffee- from acquiring the best specialty grade green arabica beans available, to roasting exclusively on gas-fired drum roasters. All of the coffees that we offer are roasted by us, by hand, everyday. Our profile method of roasting coffee in small batches allows us to concentrate on the best roast and flavor profile for each varietal and origin. You will not experience coffees of higher quality, consistency, or freshness. Our coffee is fresh and shipped within 48 hours of roasting. We are Columbus’ first micro roaster and we''ll always provide you with the best coffee available.', 'gvstaufs.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$', 'https://www.staufs.com/'),
('Stauf''s Grandview', '1277 Grandview Ave, Columbus, OH 43212', NULL, 'staufs.jpg', 0, NULL, NULL, NULL, NULL),
('Fox in the Snow', '1031 N 4th St, Columbus, OH 43201', NULL, 'fox.jpg', 0, NULL, NULL, NULL, NULL),
('Roaming Goat', '849 N High St, Columbus, OH 43215', NULL, 'roaminggoat.jpg', 0, NULL, NULL, NULL, NULL),
('Chocolate Cafe', '1855 Northwest Blvd, Columbus, OH 43212', NULL, 'chocolate-cafe.jpg', 1, NULL, NULL, NULL, NULL),
('Winan''s Chocolate + Coffee + Wine', '1125 Yard St, Grandview Heights, OH 43212', NULL, 'winans.jpg', 1, NULL, NULL, NULL, NULL),
('The Roosevelt Coffeehouse at Gravity', '462 W Broad St, Columbus, OH 43215', 'You are supporting more than a coffeehouse. You are supporting the efforts of those working to fight the local and global injustices of unclean water, hunger, and human trafficking. We partner with organizations that we KNOW are building wells and latrines, feeding people locally and internationally, and rescuing & restoring dignity to those who have been enslaved.', 'rooseveltgravity.jpg', 0, 'Mon-Sun: 8:00AM- 3:00PM', NULL, '$', 'https://the-roosevelt-coffeehouse.square.site/'),
('The Roosevelt Coffeehouse', '300 E Long St, Columbus, OH 43215', NULL, 'roosevelt.jpg', 0, NULL, NULL, NULL, NULL),
('Global Gallery', '3535 N High St, Columbus, OH 43214', NULL , 'globalgallery.jpg', 1, NULL, NULL, NULL, NULL),
('Cafe De Nook','175 S 3rd St, Columbus, OH 43215', NULL, 'nook.jpg', 0, NULL, NULL, NULL, NULL),
('One Line', '745 N High St, Columbus, OH 43215', NULL,'oneline.jpg', 0, NULL, NULL, NULL, NULL),
('Parable Coffee', '149 S High St, Columbus, OH 43215', 'A parable is a simple story that illustrates a moral understanding, or lesson. The story we want to tell has its roots in coffee, we believe that by fundamentally restructuring the way we run businesses, we can help liberate people: educationally, professionally, and economically. Our mission is to support and serve the people that gave us community. Together we can reimagine the coffee industry.', 'Parable.jpg', 0, 'Mon-Sun: 7:00 AM- 5:00PM', NULL, '$', 'https://www.parableparable.com/'),
('Thirdway Cafe', '3058 W Broad St, Columbus, OH 43204', NULL, 'thirdway.jpg', 0, NULL, NULL, NULL, NULL);
GO



SELECT shop_id, shop_name, shop_location, shop_has_spirits, image_path, about_shop, hours_weekdays,price_range, website  FROM coffee_shops

select * from users

INSERT INTO user_favorites (user_id, shop_id) VALUES
	(1, 1);
INSERT INTO user_favorites (user_id, shop_id) VALUES
	(3, 5);
SELECT * FROM user_favorites

