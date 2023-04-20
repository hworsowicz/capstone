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
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','sAYbpBw8Ur8gaPuN1ixorq4loZM=','f9AqmhzUSdk=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','sAYbpBw8Ur8gaPuN1ixorq4loZM=', 'f9AqmhzUSdk=','admin');
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
	latitude decimal (8,6) NOT NULL,
	longitude decimal (9,6) NOT NULL
	CONSTRAINT PK_shop_id PRIMARY KEY (shop_id)
	)

	CREATE TABLE user_favorites (
	user_id int NOT NULL,
	shop_id int NOT NULL,
	CONSTRAINT PK_user_shop_favorites PRIMARY KEY (user_id, shop_id), 
	CONSTRAINT FK_user_favorites FOREIGN KEY (user_id) REFERENCES users (user_id),
	CONSTRAINT FK_coffee_shop_favorites FOREIGN KEY (shop_id) REFERENCES coffee_shops (shop_id)
	);



INSERT INTO coffee_shops (shop_name, shop_location, about_shop, image_path, shop_has_spirits, hours_weekdays, hours_weekends, price_range, website, address_link, header_picture_path, map_picture, menu_picture, gallery_1, gallery_2, gallery_3, gallery_4, latitude, longitude) VALUES 
('Stauf''s Victorian Village', '1334 Neil Ave, Columbus, OH 43201', 'In 1988 Stauf�s Coffee Roasters began offering specialty coffee to Central Ohio. From day one we have been obsessed with the entire process of achieving the finest cup of coffee- from acquiring the best specialty grade green arabica beans available, to roasting exclusively on gas-fired drum roasters. All of the coffees that we offer are roasted by us, by hand, everyday. Our profile method of roasting coffee in small batches allows us to concentrate on the best roast and flavor profile for each varietal and origin. You will not experience coffees of higher quality, consistency, or freshness. Our coffee is fresh and shipped within 48 hours of roasting. We are Columbus� first micro roaster and we''ll always provide you with the best coffee available.', 'vvstaufs.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$', 'https://www.staufs.com/', 'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','staufs menu.jpg','staufsvGallery1.jpg','staufsvGallery2.jpg','staufsvGallery3.jpg','staufsvGallery4.jpg', 39.98903079322317,-83.0127170243042),
('Stauf''s German Village', '627 S. 3rd St. Columbus, OH 43206', 'In 1988 Stauf�s Coffee Roasters began offering specialty coffee to Central Ohio. From day one we have been obsessed with the entire process of achieving the finest cup of coffee- from acquiring the best specialty grade green arabica beans available, to roasting exclusively on gas-fired drum roasters. All of the coffees that we offer are roasted by us, by hand, everyday. Our profile method of roasting coffee in small batches allows us to concentrate on the best roast and flavor profile for each varietal and origin. You will not experience coffees of higher quality, consistency, or freshness. Our coffee is fresh and shipped within 48 hours of roasting. We are Columbus� first micro roaster and we''ll always provide you with the best coffee available.', 'gvstaufs.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$', 'https://www.staufs.com/', 'https://www.google.com/maps/place/Stauf''s+Coffee+Roasters/@39.9495897,-82.9982614,17z/data=!3m1!4b1!4m6!3m5!1s0x88388f4b7be30795:0xb4a07466b704923!8m2!3d39.9495856!4d-82.9956865!16s%2Fg%2F1tghq7lx','staufsCoffeehear.jpg','staufsMap.jpg','staufs menu.jpg','staufsgvbuilding.jpg','staufsmatcha.jpg','staufscoffee.jpg', 'staufsgermanvillage.jpg',39.9717939,-83.0662527),

('Stauf''s Grandview', '1277 Grandview Ave, Columbus, OH 43212', 'In 1988 Stauf�s Coffee Roasters began offering specialty coffee to Central Ohio. From day one we have been obsessed with the entire process of achieving the finest cup of coffee- from acquiring the best specialty grade green arabica beans available, to roasting exclusively on gas-fired drum roasters. All of the coffees that we offer are roasted by us, by hand, everyday. Our profile method of roasting coffee in small batches allows us to concentrate on the best roast and flavor profile for each varietal and origin. You will not experience coffees of higher quality, consistency, or freshness. Our coffee is fresh and shipped within 48 hours of roasting. We are Columbus� first micro roaster and we''ll always provide you with the best coffee available.', 'staufs.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$', 'https://www.staufs.com/','https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','staufs menu.jpg','staufsGrandviewGallery1.jpg','staufsGrandviewGallery2.jpg','staufsGrandviewGallery3.jpg','staufsGrandviewGallery4.jpg', 39.9889637, -83.0613507),
('Fox in the Snow', '1031 N 4th St, Columbus, OH 43201', 'Fox in the Snow Cafe is a bakery, coffee shop serving up rustic-style baked goods and hand-poured drinks out of three quaint shops in the Italian Village, German Village and New Albany neighborhoods of Columbus, Ohio.', 'fox.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','CoffeeMenu.webp','foxinsnowGallery1.jpg','foxinsnowGallery2.jpg','foxinsnowGallery3.jpg','foxinsnowGallery4.jpg', 39.985548050273, -82.99942434069828),
('Roaming Goat', '849 N High St, Columbus, OH 43215', 'At Roaming Goat Coffee Co. we love all things coffee and are endlessly searching for the next great cup. We source only the highest quality Arabica coffees from around the globe, roasted to perfection to accentuate the special nuances of each varietal. Our goal is to bring you the perfect cup each and every day. Our mission is to be legendary!', 'roaminggoat.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','CoffeeMenu.webp','rgGallery1.jpg','rgGallery2.jpg','rgGallery3.jpg','rgGallery4.jpg', 39.980141216847095, -83.00455596616565),
('Chocolate Cafe', '1855 Northwest Blvd, Columbus, OH 43212', 'Welcome to the Chocolate Cafe where we have been proudly serving the Grandview Heights/Upper Arlington area since 2007. From breakfast to lunch to dinner, come enjoy a fresh, made-to-order menu with high quality ingredients. We cater to your needs. Gluten free? We got you. Vegetarian or Vegan? We got you. Low sugar? We carry sugar free chocolates! Just ask our friendly staff when you order and we will customize your meal to reflect your specific needs. Love ice cream?  Great - we proudly serve Johnson''s Real Ice Cream. A cake lover? Sweet. We feature 7-10 different cakes daily along with cookies, brownies, truffles, turtles, and chocolate covered strawberries. You''d rather drink your dessert? We can do that with our Chocolate Cake Martini. We have something for everyone!', 'chocolate-cafe.jpg', 1, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','CoffeeMenu.webp','chocolateGallery1.jpg','chocolateGallery2.jpg','chocolateGallery3.jpg','chocolateGallery4.jpg', 39.99589327984548, -83.04739373804192),
('Winan''s Chocolate + Coffee + Wine', '1125 Yard St, Grandview Heights, OH 43212', 'OUR MISSION: At Winans, we handcraft chocolates and coffees to inspire moments of joy. OUR VISION: To be the foremost destination for chocolates and coffees. OUR VALUES: Fun: We exist to create moments of enjoyment and happiness and we have fun doing it! Quality: We are stubborn about quality in all that we do. Personal Growth: We empower continuous improvement and thrive by the exchange of ideas. Respect: We care for each other, our customers, suppliers, and the origins of our ingredients', 'winans.jpg', 1, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','CoffeeMenu.webp','winansGallery1.jpg','winansGallery2.jpg','winansGallery3.jpg','winansGallery4.jpg', 39.98372979610184, -83.02804036873536),
('The Roosevelt Coffeehouse at Gravity', '462 W Broad St, Columbus, OH 43215', 'You are supporting more than a coffeehouse. You are supporting the efforts of those working to fight the local and global injustices of unclean water, hunger, and human trafficking. We partner with organizations that we KNOW are building wells and latrines, feeding people locally and internationally, and rescuing & restoring dignity to those who have been enslaved.', 'rooseveltgravity.jpg', 0, 'Mon-Sun: 8:00AM- 3:00PM', NULL, '$', 'https://the-roosevelt-coffeehouse.square.site/','https://www.google.com/maps/place/Roosevelt+Coffee+Roasters/@39.9556938,-83.0663348,17z/data=!3m1!4b1!4m6!3m5!1s0x88388f0e3ad4faf9:0x44159fbd2dbfee2e!8m2!3d39.9556897!4d-83.0637599!16s%2Fg%2F11g0lcpr6f','rooseveltHeader.webp','RooseveltMap.jpg','RooseveltMenu.jpg','rooseveltGallery1.jpg','rooseveltGallery2.jpg','rooseveltGallery3.jpg','rooseveltGallery4.jpg', 39.96257418332698, -83.01319275262914),
('The Roosevelt Coffeehouse', '300 E Long St, Columbus, OH 43215', ' You are supporting more than a coffeehouse. You are supporting the efforts of those working to fight the local and global injustices of unclean water, hunger, and human trafficking. We partner with organizations that we KNOW are building wells and latrines, feeding people locally and internationally, and rescuing & restoring dignity to those who have been enslaved.', 'roosevelt.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','RooseveltMenu.jpg','rooseveltOGgallery1.jpg','rooseveltOGgallery2.jpg','rooseveltOGgallery4.jpg','rooseveltOGgallery3.jpg', 39.96719969438043, -82.99320332227934),
('Global Gallery', '3535 N High St, Columbus, OH 43214', 'Global Gallery was established in the Short North Arts District of Columbus, Ohio in 1991. Four local churches came together to support artisans and farmers through marketing Fair Trade products. As non-profit marketplace, it has since served as Central Ohio�s foremost international arts and handcrafts organization. Global Gallery provides a venue for under served art forms, extending financial support to artists within Ohio and from around the globe.Global Gallery over the years has been located in multiple locations in an effort to deepen the organization�s connection to the community. Global Gallery currently has one location, in the Clintonville are of Columbus, Ohio. Global Gallery has also grown it�s sales, annually supporting more than 1,500 artists and producers from more than 45 countries. ' , 'globalgallery.jpg', 1, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','ggmenu.jpg','ggGallery1.jpg','ggGallery2.jpg','ggGallery3.jpg','ggGallery4.jpg', 40.036279679361236, -83.01574660218958),
('Cafe De Nook','175 S 3rd St, Columbus, OH 43215', 'Cafe De Nook is a locally owned 1920''s Parisian cafe style coffee shop located in Downtown Columbus located behind the Columbus Commons on the corner of S 3rd & Town St.', 'nook.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$$$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','CoffeeMenu.webp','cafedenookGallery1.jpg','cafedenookGallery2.jpg','cafedenookGallery3.jpg','cafedenookGallery4.jpg', 39.95985475475692, -82.99741308042579),
('One Line', '745 N High St, Columbus, OH 43215', 'it all began with a simple question�how can we find better coffee? it was the beginning of 2009. we (mark and dave, father and son, friends and partners) had been running two successful cafes for a few years, the first of which we opened in 2003 on a shoestring and a promise. but something was missing. catching a quick break one busy morning, i looked at our �today�s coffees� sign, and wondered: who grew these coffees? where did they come from? community had always been one of our core values. but we began to realize that community meant not only our customers, friends, and family, but our coffee community as well: farmers, importers, advocacy groups, other roasters and cafes, and more. we decided we�d been ignoring one particular member of this community for far too long. let me tell you, it was the beginning of a long journey. trying to figure out who grew our coffees lead to dead end after dead end. no one had the information we were looking for, or weren�t willing to share. for some coffees, we couldn�t figure out what country they were grown in, let alone the farmer or farmers responsible. after much searching and frustration, we decided to take matters into our own hands. we fired up our first roaster in July 2009. with that, we started one line coffee. better coffee means a lot of different things to different people. to us it means flavor and quality, sustainability, and traceability. it means doing everything we can to ensure farmers and workers are treated well, and earn a livable wage. it means telling the stories of our coffees, connecting you to our farmers. and it means matching the passion of our farmers with our own passion for roasting. every day, we work towards this transparent model of sourcing, traveling to origin as often as possible to find coffees, monitor farms and workers, and learn the stories of the people who grow our coffee. by buying and brewing our coffees, you help us move a little closer to that goal. for that, we thank you.think global. buy local.','oneline.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','onelinemenu.jpg','onelineGallery1.jpg','onelineGallery2.jpg','onelineGallery3.jpg','onelineGallery4.jpg', 39.980149180683306, -83.00337420733652),
('Parable Coffee', '149 S High St, Columbus, OH 43215', 'A parable is a simple story that illustrates a moral understanding, or lesson. The story we want to tell has its roots in coffee, we believe that by fundamentally restructuring the way we run businesses, we can help liberate people: educationally, professionally, and economically. Our mission is to support and serve the people that gave us community. Together we can reimagine the coffee industry.', 'Parable.jpg', 0, 'Mon-Sun: 7:00 AM- 5:00PM', NULL, '$', 'https://www.parableparable.com/', 'https://www.google.com/maps/place/Parable+Coffee/@39.9590427,-83.0028306,17z/data=!3m1!4b1!4m6!3m5!1s0x8838894b268b5259:0xe845d1d2a6bca06c!8m2!3d39.9590386!4d-83.0002557!16s%2Fg%2F11k_htnmwg','parableHeader.webp','parableMap.jpg','parablemenu.jpg','parableGallery1.jpg', 'parableGallery2.jpg', 'parableGallery3.jpg','parableGallery4.jpeg', 39.96002065207901, -83.00038870317552),
('Thirdway Cafe', '3058 W Broad St, Columbus, OH 43204', 'We are constantly looking for the �third way� of doing things; how can we be better, how can we LOVE better, how can we do MORE good - together. Built by the community, for the community with the sole purpose of pursuing good with the community.', 'thirdway.jpg', 0, 'Mon-Sun: 7:00AM- 6:00PM', NULL, '$$', NULL,'https://www.google.com/maps/@39.9880601,-83.046867,15z','CoffeeHeader.jpg','coffeeMaps.png','thirdwaymenu.jpg','thirdwayGallery1.jpg','thirdwayGallery2..jpg','thirdwayGallery3.jpg','thirdwayGallery4.jpg', 39.95634522772098, -83.08114089615681);


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
	SELECT shop_id, shop_name, shop_location, shop_has_spirits, image_path, about_shop, hours_weekdays, hours_weekends, price_range, website, address_link, header_picture_path, map_picture, menu_picture, gallery_1, gallery_2, gallery_3, gallery_4, latitude, longitude,
                  (CASE WHEN EXISTS(SELECT 1 FROM user_favorites uf WHERE uf.shop_id = c.shop_id AND uf.user_id = 3) THEN 1 ELSE 0 END) AS IsFavorite FROM coffee_shops c

SELECT * FROM users