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
	address_link nvarchar (Max),
	header_picture_path nvarchar(300) NOT NULL,
	map_picture nvarchar (300) NOT NULL,
	menu_picture nvarchar (300) NOT NULL,
	gallery_1 nvarchar (300) NOT NULL,
	gallery_2 nvarchar (300) NOT NULL,
	gallery_3 nvarchar (300) NOT NULL,
	gallery_4 nvarchar (300) NOT NULL,
	CONSTRAINT PK_shop_id PRIMARY KEY (shop_id)
	)

	CREATE TABLE user_favorites (
	user_id int NOT NULL,
	shop_id int NOT NULL,
	CONSTRAINT PK_user_shop_favorites PRIMARY KEY (user_id, shop_id), 
	CONSTRAINT FK_user_favorites FOREIGN KEY (user_id) REFERENCES users (user_id),
	CONSTRAINT FK_coffee_shop_favorites FOREIGN KEY (shop_id) REFERENCES coffee_shops (shop_id)
	);



INSERT INTO coffee_shops (shop_name, shop_location, about_shop, image_path, shop_has_spirits, hours_weekdays, hours_weekends, price_range, website, address_link, header_picture_path, map_picture, menu_picture, gallery_1, gallery_2, gallery_3, gallery_4 ) VALUES 
('Stauf''s Victorian Village', '1334 Neil Ave, Columbus, OH 43201', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'vvstaufs.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$', 'https://www.staufs.com/', 'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','CoffeeMenu.webp','fillerGallery1.jpg','fillerGallery2.jpg','fillerGallery3.jpg','fillerGallery4.jpg'),
('Stauf''s German Village', '627 S. 3rd St. Columbus, OH 43206', 'In 1988 Stauf’s Coffee Roasters began offering specialty coffee to Central Ohio. From day one we have been obsessed with the entire process of achieving the finest cup of coffee- from acquiring the best specialty grade green arabica beans available, to roasting exclusively on gas-fired drum roasters. All of the coffees that we offer are roasted by us, by hand, everyday. Our profile method of roasting coffee in small batches allows us to concentrate on the best roast and flavor profile for each varietal and origin. You will not experience coffees of higher quality, consistency, or freshness. Our coffee is fresh and shipped within 48 hours of roasting. We are Columbus’ first micro roaster and we''ll always provide you with the best coffee available.', 'gvstaufs.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$', 'https://www.staufs.com/', 'https://www.google.com/maps/place/Stauf''s+Coffee+Roasters/@39.9495897,-82.9982614,17z/data=!3m1!4b1!4m6!3m5!1s0x88388f4b7be30795:0xb4a07466b704923!8m2!3d39.9495856!4d-82.9956865!16s%2Fg%2F1tghq7lx','staufsCoffeehear.jpg','staufsMap.jpg','staufs menu.jpg','staufsgvbuilding.jpg','staufsmatcha.jpg','staufscoffee.jpg', 'staufsgermanvillage.jpg'),
('Stauf''s Grandview', '1277 Grandview Ave, Columbus, OH 43212', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'staufs.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$', 'https://www.staufs.com/','https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','CoffeeMenu.webp','fillerGallery1.jpg','fillerGallery2.jpg','fillerGallery3.jpg','fillerGallery4.jpg'),
('Fox in the Snow', '1031 N 4th St, Columbus, OH 43201', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'fox.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','CoffeeMenu.webp','fillerGallery1.jpg','fillerGallery2.jpg','fillerGallery3.jpg','fillerGallery4.jpg'),
('Roaming Goat', '849 N High St, Columbus, OH 43215', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'roaminggoat.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','CoffeeMenu.webp','fillerGallery1.jpg','fillerGallery2.jpg','fillerGallery3.jpg','fillerGallery4.jpg'),
('Chocolate Cafe', '1855 Northwest Blvd, Columbus, OH 43212', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'chocolate-cafe.jpg', 1, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','CoffeeMenu.webp','fillerGallery1.jpg','fillerGallery2.jpg','fillerGallery3.jpg','fillerGallery4.jpg'),
('Winan''s Chocolate + Coffee + Wine', '1125 Yard St, Grandview Heights, OH 43212', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'winans.jpg', 1, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','CoffeeMenu.webp','fillerGallery1.jpg','fillerGallery2.jpg','fillerGallery3.jpg','fillerGallery4.jpg'),
('The Roosevelt Coffeehouse at Gravity', '462 W Broad St, Columbus, OH 43215', 'You are supporting more than a coffeehouse. You are supporting the efforts of those working to fight the local and global injustices of unclean water, hunger, and human trafficking. We partner with organizations that we KNOW are building wells and latrines, feeding people locally and internationally, and rescuing & restoring dignity to those who have been enslaved.', 'rooseveltgravity.jpg', 0, 'Mon-Sun: 8:00AM- 3:00PM', NULL, '$', 'https://the-roosevelt-coffeehouse.square.site/','https://www.google.com/maps/place/Roosevelt+Coffee+Roasters/@39.9556938,-83.0663348,17z/data=!3m1!4b1!4m6!3m5!1s0x88388f0e3ad4faf9:0x44159fbd2dbfee2e!8m2!3d39.9556897!4d-83.0637599!16s%2Fg%2F11g0lcpr6f','rooseveltHeader.webp','RooseveltMap.jpg','RooseveltMenu.jpg','rooseveltGallery1.jpg','rooseveltGallery2.jpg','rooseveltGallery3.jpg','rooseveltGallery4.jpg'),
('The Roosevelt Coffeehouse', '300 E Long St, Columbus, OH 43215', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'roosevelt.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','CoffeeMenu.webp','fillerGallery1.jpg','fillerGallery2.jpg','fillerGallery3.jpg','fillerGallery4.jpg'),
('Global Gallery', '3535 N High St, Columbus, OH 43214', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' , 'globalgallery.jpg', 1, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','CoffeeMenu.webp','fillerGallery1.jpg','fillerGallery2.jpg','fillerGallery3.jpg','fillerGallery4.jpg'),
('Cafe De Nook','175 S 3rd St, Columbus, OH 43215', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'nook.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$$$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','CoffeeMenu.webp','fillerGallery1.jpg','fillerGallery2.jpg','fillerGallery3.jpg','fillerGallery4.jpg'),
('One Line', '745 N High St, Columbus, OH 43215', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','oneline.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','CoffeeMenu.webp','fillerGallery1.jpg','fillerGallery2.jpg','fillerGallery3.jpg','fillerGallery4.jpg'),
('Parable Coffee', '149 S High St, Columbus, OH 43215', 'A parable is a simple story that illustrates a moral understanding, or lesson. The story we want to tell has its roots in coffee, we believe that by fundamentally restructuring the way we run businesses, we can help liberate people: educationally, professionally, and economically. Our mission is to support and serve the people that gave us community. Together we can reimagine the coffee industry.', 'Parable.jpg', 0, 'Mon-Sun: 7:00 AM- 5:00PM', NULL, '$', 'https://www.parableparable.com/', 'https://www.google.com/maps/place/Parable+Coffee/@39.9590427,-83.0028306,17z/data=!3m1!4b1!4m6!3m5!1s0x8838894b268b5259:0xe845d1d2a6bca06c!8m2!3d39.9590386!4d-83.0002557!16s%2Fg%2F11k_htnmwg','parableHeader.webp','parableMap.jpg','parablemenu.jpg','parableGallery1.jpg', 'parableGallery2.jpg', 'parableGallery3.jpg','parableGallery4.jpeg'),
('Thirdway Cafe', '3058 W Broad St, Columbus, OH 43204', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'thirdway.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','CoffeeMenu.webp','fillerGallery1.jpg','fillerGallery2.jpg','fillerGallery3.jpg','fillerGallery4.jpg');
GO



SELECT * FROM coffee_shops

select * from users

INSERT INTO user_favorites (user_id, shop_id) VALUES
	(1, 1),
	(3, 5),
	(1, 4),
	(1, 8),
	(1, 12),
	(1, 3),
	(1, 9),
	(3, 2),
	(3, 8),
	(3, 13),
	(3, 12),
	(3, 14),
	(2, 1),
	(2, 4),
	(2, 6),
	(2, 2),
	(2, 11),
	(2, 12);

	Select c.shop_id, c.shop_name FROM coffee_shops c
	INNER JOIN user_favorites uf ON uf.shop_id = c.shop_id
	INNER JOIN users u ON u.user_id = uf.user_id WHERE u.user_id = 1;


	SELECT c.shop_name, c.shop_id,
		   (CASE WHEN EXISTS(SELECT 1 FROM user_favorites uf WHERE uf.shop_id = c.shop_id AND uf.user_id = 3)
					THEN 1
					ELSE 0 END) AS IsFavorite
	FROM coffee_shops c

