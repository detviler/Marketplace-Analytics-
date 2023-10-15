---The plan is to create 5 data_tables to review sellers activity on an "online marketplace" the name of the project is "marketplace_analytics" 
--- DB name: marketplace_analytics, table alias has been used to be consistent first two letters are used. 2 primary keys are defined (seller_id, product_id) & Foreign keys are declared 4 tables 
--- Table 1: sellers: This have seller specific details & seller_id will act as the Primary key
--- Table 2: products: all product specific data here, product_id is primary key as I wanted all no duplicacy of product each entry is stand-alone
--- Table 3: orders: All data about orders received from buyers to a particualr seller account. This table will help understand where buyers are from, what they purchased, at what price etc. 
--- Table 4: aml_activity: Purpose of this table is "fraud detection" IP address are cpatured to match to buyers/ sellers location if IP address is a missmatch it can be redflagged for further review by anti-money-laundaring team 
--- Table 5: claims: This data keeps record of all the claims opened for a particualr seller account, certain metrics if "high" is bad while certain metrics if "low" is good. Comments below under table 5 
--- Additional doc: An excel sheet is also created for quick personal reference, which has all the data I fed to SQL, uploaded with submission 
--- Word doc submitted with writ-up as per project guideline. 
--- DB_diagram shared as per project guideline. 

---- Table 1 structure (sellers) ---------

CREATE TABLE "sellers" (
  "seller_id" int PRIMARY KEY,
  "seller_username" int,
  "address" varchar,
  "registration_date" date,
  "contact_information" int,
  "gmv" int,
  "average_selling_price" int,
  "seller_standards" varchar,
  "feedback_score" decimal,
  "category_whitelisted" varchar
);

---- Table 2 structure (products) ---------

CREATE TABLE "products" (
  "product_id" int PRIMARY KEY,
  "seller_id" int,
  "seller_username" varchar,
  "product_name" varchar,
  "category" varchar,
  "price" int,
  "listing_site" varchar,
  "inventory_count" int,
  "sold_till_date" int,
  "product_feedback" decimal,
  "product_description" varchar
);

---- Table 3 structure (orders) ---------

CREATE TABLE "orders" (
  "order_id" int,
  "seller_id" int,
  "transaction_id" int,
  "product_id" varchar,
  "buyer_id" int,
  "buyer_username" varchar,
  "order_date" date,
  "quantity" int,
  "payment_amount" int,
  "payment_mode" varchar,
  "shipping_address" varchar,
  "shipping_country" varchar,
  "order_status" varchar,
  "listing_site" varchar
);

---- Table 4 structure (aml_activity) ---------

CREATE TABLE "aml_activity" (
  "transaction_id" int,
  "order_id" int,
  "seller_id" int,
  "seller_system_ip_location" varchar,
  "seller_username" varchar,
  "transaction_date" date,
  "transaction_amount" int,
  "buyer_id" int,
  "buyer_username" varchar,
  "buyer_location" varchar,
  "buyer_system_ip" varchar,
  "suspicious_activity" varchar,
  "aml_status" varchar 
);

---- Table 5 structure (claims) ---------

CREATE TABLE "claims" (
  "seller_id" int,
  "seller_username" varchar,
  "item_not_as_described_claims" int,
  "item_not_delivered_claims" int,
  "total_claims" int,
  "order_cancellations" int,
  "feedback_percentage" decimal,
  "policy_violation_count" int
);

ALTER TABLE "products" ADD FOREIGN KEY ("seller_id") REFERENCES "sellers" ("seller_id");

ALTER TABLE "orders" ADD FOREIGN KEY ("seller_id") REFERENCES "sellers" ("seller_id");

ALTER TABLE "aml_activity" ADD FOREIGN KEY ("seller_id") REFERENCES "sellers" ("seller_id");

ALTER TABLE "claims" ADD FOREIGN KEY ("seller_id") REFERENCES "sellers" ("seller_id");

--Data creation logic Below----
---- For Orders Table ------

INSERT INTO sellers (seller_id, seller_username, address, registration_date, contact_information, gmv, average_selling_price, seller_standards, feedback_score, category_whitelisted, aml_status)
VALUES
  (10001, 'sam145', '45albertstreet1', '2001-01-01', 9673200013, 150000, 450, 'Excellent', 95, 'Autoparts', 'closed'),
  (10002, 'sam146', '45albertstreet2', '2002-01-01', 9673200014, 8000, 50, 'Good', 90, 'sportsgoods', 'open'),
  (10003, 'sam147', '45albertstreet3', '2003-01-01', 9673200015, 160000, 480, 'Excellent', 92, 'healthcare', 'closed'),
  (10004, 'sam148', '45albertstreet4', '2004-01-01', 9673200016, 7500, 40, 'Good', 89, 'home&beauty', 'underreview'),
  (10005, 'sam149', '45albertstreet5', '2005-01-01', 9673200017, 170000, 490, 'Excellent', 94, 'jewelry', 'redflagged'),
  (10006, 'sam150', '45albertstreet6', '2006-01-01', 9673200018, 6500, 35, 'Good', 88, 'Autoparts', 'closed'),
  (10007, 'sam151', '45albertstreet7', '2007-01-01', 9673200019, 180000, 505, 'Excellent', 93, 'sportsgoods', 'open'),
  (10008, 'sam152', '45albertstreet8', '2008-01-01', 9673200020, 7000, 30, 'Good', 87, 'healthcare', 'underreview'),
  (10009, 'sam153', '45albertstreet9', '2009-01-01', 9673200021, 190000, 520, 'Excellent', 96, 'home&beauty', 'redflagged'),
  (10010, 'sam154', '45albertstreet10', '2010-01-01', 9673200022, 8000, 28, 'Good', 86, 'jewelry', 'closed'),
  (10011, 'sam155', '45albertstreet11', '2011-01-01', 9673200023, 200000, 540, 'Excellent', 97, 'Autoparts', 'open'),
  (10012, 'sam156', '45albertstreet12', '2012-01-01', 9673200024, 7500, 25, 'Good', 85, 'sportsgoods', 'underreview'),
  (10013, 'sam157', '45albertstreet13', '2013-01-01', 9673200025, 210000, 560, 'Excellent', 98, 'healthcare', 'redflagged'),
  (10014, 'sam158', '45albertstreet14', '2014-01-01', 9673200026, 7000, 23, 'Good', 84, 'home&beauty', 'closed'),
  (10015, 'sam159', '45albertstreet15', '2015-01-01', 9673200027, 220000, 580, 'Excellent', 99, 'jewelry', 'open'),
  (10016, 'sam160', '45albertstreet16', '2016-01-01', 9673200028, 6500, 21, 'Good', 83, 'Autoparts', 'underreview'),
  (10017, 'sam161', '45albertstreet17', '2017-01-01', 9673200029, 230000, 600, 'Excellent', 100, 'sportsgoods', 'redflagged'),
  (10018, 'sam162', '45albertstreet18', '2018-01-01', 9673200030, 7500, 20, 'Good', 82, 'healthcare', 'closed'),
  (10019, 'sam163', '45albertstreet19', '2019-01-01', 9673200031, 240000, 620, 'Excellent', 91, 'home&beauty', 'open'),
  (10020, 'sam164', '45albertstreet20', '2020-01-01', 9673200032, 8000, 18, 'Good', 81, 'jewelry', 'underreview'),
  (10021, 'sam165', '45albertstreet21', '2021-01-01', 9673200033, 250000, 640, 'Excellent', 80, 'Autoparts', 'redflagged'),
  (10022, 'sam166', '45albertstreet22', '2022-01-01', 9673200034, 7500, 16, 'Good', 79, 'sportsgoods', 'closed'),
  (10023, 'sam167', '45albertstreet23', '2023-01-01', 9673200035, 260000, 660, 'Excellent', 98, 'healthcare', 'open'),
  (10024, 'sam168', '45albertstreet24', '2023-02-01', 9673200036, 7000, 14, 'Good', 97, 'home&beauty', 'underreview'),
  (10025, 'sam169', '45albertstreet25', '2023-03-01', 9673200037, 270000, 680, 'Excellent', 95, 'jewelry', 'redflagged'),
  (10026, 'sam170', '45albertstreet26', '2023-04-01', 9673200038, 8000, 12, 'Good', 93, 'Autoparts', 'closed'),
  (10027, 'sam171', '45albertstreet27', '2023-05-01', 9673200039, 280000, 700, 'Excellent', 91, 'sportsgoods', 'open'),
  (10028, 'sam172', '45albertstreet28', '2023-06-01', 9673200040, 7500, 10, 'Good', 89, 'healthcare', 'underreview'),
  (10029, 'sam173', '45albertstreet29', '2023-07-01', 9673200041, 290000, 720, 'Excellent', 87, 'home&beauty', 'redflagged'),
  (10030, 'sam174', '45albertstreet30', '2023-08-01', 9673200042, 8000, 8, 'Good', 85, 'jewelry', 'closed'),
  (10031, 'sam175', '45albertstreet31', '2023-09-01', 9673200043, 300000, 740, 'Excellent', 83, 'Autoparts', 'open'),
  (10032, 'sam176', '45albertstreet32', '2023-10-01', 9673200044, 7500, 6, 'Good', 81, 'sportsgoods', 'underreview'),
  (10033, 'sam177', '45albertstreet33', '2023-11-01', 9673200045, 310000, 760, 'Excellent', 79, 'healthcare', 'redflagged'),
  (10034, 'sam178', '45albertstreet34', '2023-12-01', 9673200046, 8000, 4, 'Good', 77, 'home&beauty', 'closed'),
  (10035, 'sam179', '45albertstreet35', '2023-01-01', 9673200047, 320000, 780, 'Excellent', 75, 'jewelry', 'open'),
  (10036, 'sam180', '45albertstreet36', '2023-02-01', 9673200048, 7500, 2, 'Good', 73, 'Autoparts', 'underreview'),
  (10037, 'sam181', '45albertstreet37', '2023-03-01', 9673200049, 330000, 800, 'Excellent', 71, 'sportsgoods', 'redflagged'),
  (10038, 'sam182', '45albertstreet38', '2023-04-01', 9673200050, 8000, 25, 'Good', 69, 'healthcare', 'closed'),
  (10039, 'sam183', '45albertstreet39', '2023-05-01', 9673200051, 340000, 820, 'Excellent', 67, 'home&beauty', 'open'),
  (10040, 'sam184', '45albertstreet40', '2023-06-01', 9673200052, 7500, 20, 'Good', 65, 'jewelry', 'underreview'),
  (10041, 'sam185', '45albertstreet41', '2023-07-01', 9673200053, 350000, 840, 'Excellent', 63, 'Autoparts', 'redflagged'),
  (10042, 'sam186', '45albertstreet42', '2023-08-01', 9673200054, 8000, 15, 'Good', 61, 'sportsgoods', 'closed'),
  (10043, 'sam187', '45albertstreet43', '2023-09-01', 9673200055, 360000, 860, 'Excellent', 59, 'healthcare', 'open'),
  (10044, 'sam188', '45albertstreet44', '2023-10-01', 9673200056, 7500, 10, 'Good', 57, 'home&beauty', 'underreview'),
  (10045, 'sam189', '45albertstreet45', '2023-11-01', 9673200057, 370000, 880, 'Excellent', 55, 'jewelry', 'redflagged'),
  (10046, 'sam190', '45albertstreet46', '2023-12-01', 9673200058, 8000, 5, 'Good', 53, 'Autoparts', 'closed'),
  (10047, 'sam191', '45albertstreet47', '2023-01-01', 9673200059, 380000, 900, 'Excellent', 51, 'sportsgoods', 'open'),
  (10048, 'sam192', '45albertstreet48', '2023-02-01', 9673200060, 7500, 1, 'Good', 49, 'healthcare', 'underreview'),
  (10049, 'sam193', '45albertstreet49', '2023-03-01', 9673200061, 390000, 920, 'Excellent', 47, 'home&beauty', 'redflagged'),
  (10050, 'sam194', '45albertstreet50', '2023-04-01', 9673200062, 8000, 16, 'Good', 45, 'jewelry', 'closed'),
  (10051, 'sam195', '45albertstreet51', '2023-05-01', 9673200063, 400000, 940, 'Excellent', 43, 'Autoparts', 'open'),
  (10052, 'sam196', '45albertstreet52', '2023-06-01', 9673200064, 7500, 12, 'Good', 41, 'sportsgoods', 'underreview'),
  (10053, 'sam197', '45albertstreet53', '2023-07-01', 9673200065, 410000, 960, 'Excellent', 39, 'healthcare', 'redflagged'),
  (10054, 'sam198', '45albertstreet54', '2023-08-01', 9673200066, 8000, 8, 'Good', 37, 'home&beauty', 'closed'),
  (10055, 'sam199', '45albertstreet55', '2023-09-01', 9673200067, 420000, 980, 'Excellent', 35, 'jewelry', 'open');


---- For AML --------- (Note: Since I have set seller_id as a Primary_Key for the project, made sure the seller_ids used is other table are a match to seller_id in sellers table to avoid any error)

INSERT INTO aml_activity (transaction_id, order_id, seller_id, seller_system_ip_location, seller_username, transaction_date, transaction_amount, buyer_id, buyer_username, buyer_location, buyer_system_ip, suspicious_activity, aml_status)
VALUES
  (1001, 1, 10, '192.168.1.1', 'JohnDoe', '2023-01-05', 3000, 2001, 'AliceSmith', 'New York', '192.168.1.2', 'HighTransactionAmount', 'open'),
  (1002, 2, 10, '192.168.1.3', 'JaneSmith', '2023-01-10', 2500, 2002, 'BobJohnson', 'Los Angeles', '192.168.1.4', 'SuspiciousIP', 'closed'),
  (1003, 3, 10, '192.168.1.5', 'MikeBrown', '2023-01-15', 2200, 2003, 'MaryWilson', 'Chicago', '192.168.1.6', 'LargeTransactions', 'open'),
  (1004, 4, 10, '192.168.1.7', 'SaraLee', '2023-01-20', 2800, 2004, 'JamesClark', 'Houston', '192.168.1.8', 'UnusualActivity', 'closed'),
  (1005, 5, 25, '192.168.1.9', 'ChrisWilson', '2023-01-25', 3100, 2005, 'EmilyJones', 'Miami', '192.168.1.10', 'HighTransactionAmount', 'open'),
  (1006, 6, 25, '192.168.1.11', 'EmilyJones', '2023-01-30', 2900, 2006, 'DavidSmith', 'San Francisco', '192.168.1.12', 'SuspiciousIP', 'closed'),
  (1007, 7, 24, '192.168.1.13', 'RobertDavis', '2023-02-05', 2600, 2007, 'LindaWilson', 'Boston', '192.168.1.14', 'LargeTransactions', 'open'),
  (1008, 8, 3, '192.168.1.15', 'LisaMiller', '2023-02-10', 2400, 2008, 'JohnDoe', 'Seattle', '192.168.1.16', 'UnusualActivity', 'closed'),
  (1009, 9, 3, '192.168.1.17', 'DavidSmith', '2023-02-15', 2200, 2009, 'JaneSmith', 'Dallas', '192.168.1.18', 'HighTransactionAmount', 'open'),
  (1010, 10, 3, '192.168.1.19', 'LindaWilson', '2023-02-20', 2700, 2010, 'MikeBrown', 'Philadelphia', '192.168.1.20', 'SuspiciousIP', 'closed'),
  (1011, 11, 15, '192.168.1.21', 'JaneSmith', '2023-02-25', 2900, 2011, 'SaraLee', 'Phoenix', '192.168.1.22', 'LargeTransactions', 'open'),
  (1012, 12, 15, '192.168.1.23', 'MikeBrown', '2023-03-05', 2500, 2012, 'ChrisWilson', 'San Diego', '192.168.1.24', 'UnusualActivity', 'closed'),
  (1013, 13, 15, '192.168.1.25', 'SaraLee', '2023-03-10', 3100, 2013, 'EmilyJones', 'Denver', '192.168.1.26', 'HighTransactionAmount', 'open'),
  (1014, 14, 7, '192.168.1.27', 'ChrisWilson', '2023-03-15', 2800, 2014, 'RobertDavis', 'Austin', '192.168.1.28', 'SuspiciousIP', 'closed'),
  (1015, 15, 12, '192.168.1.29', 'EmilyJones', '2023-03-20', 2600, 2015, 'LisaMiller', 'Chicago', '192.168.1.30', 'LargeTransactions', 'open'),
  (1016, 16, 12, '192.168.1.31', 'RobertDavis', '2023-03-25', 2400, 2016, 'DavidSmith', 'New York', '192.168.1.32', 'UnusualActivity', 'closed');

-- sample data created to run query on fradulent acitivty: Here kept the IP address data for both seller_system_ip_location and buyer_system_ip which gives an indication that both parties in this order is the same user, which can be a fraud indicator. 

INSERT INTO aml_activity (transaction_id, order_id, seller_id, seller_system_ip_location, seller_username, transaction_date, transaction_amount, buyer_id, buyer_username, buyer_location, buyer_system_ip, suspicious_activity, aml_status)
VALUES
  (1023, 23, 25, '192.168.1.35', 'JohnDoe', '2023-04-05', 3000, 2023, 'AliceSmith', 'New York', '192.168.1.35', 'HighTransactionAmount', 'open'),
  (1024, 24, 25, '192.168.1.36', 'JaneSmith', '2023-04-10', 2500, 2024, 'BobJohnson', 'Los Angeles', '192.168.1.36', 'SuspiciousIP', 'closed'),
  (1025, 25, 25, '192.168.1.37', 'MikeBrown', '2023-04-15', 2200, 2025, 'MaryWilson', 'Chicago', '192.168.1.37', 'LargeTransactions', 'open'),
  (1026, 26, 27, '192.168.1.38', 'SaraLee', '2023-04-20', 2800, 2026, 'JamesClark', 'Houston', '192.168.1.38', 'UnusualActivity', 'closed'),
  (1027, 27, 27, '192.168.1.39', 'ChrisWilson', '2023-04-25', 3100, 2027, 'EmilyJones', 'Miami', '192.168.1.39', 'HighTransactionAmount', 'open');

---- For claims table
--- Note for reviewer: In online marketplace item_not_as_described_claims and item_not_delivered_claims are opened by buyers if the item received is not as per the listings or if item is not delivered respectively, if any seller has high such claims its an indication that seller is not upto the mark in completing the transaction. Hence, any data we can review will help us to distinguish good sellers from not so good. Furthmore, cancelled orders should be as low as possible for a seller, Feedback % as high to be termed as a good seller 

INSERT INTO claims (seller_id, seller_username, item_not_as_described_claims, item_not_delivered_claims, total_claims, order_cancellations, feedback_percentage, policy_violation_count)
VALUES
  (10, 'noah19', 5, 3, 8, 2, 95.5, 2),
  (11, 'sophia29', 2, 1, 3, 1, 98.2, 1),
  (12, 'william36', 7, 4, 11, 3, 88.7, 3),
  (13, 'ava65', 1, 0, 1, 0, 99.8, 0),
  (14, 'mason87', 4, 2, 6, 1, 91.3, 1),
  (15, 'charlotte72', 3, 1, 4, 2, 97.9, 1),
  (16, 'james14', 6, 3, 9, 3, 89.2, 2),
  (17, 'oliver32', 0, 0, 0, 0, 100.0, 0),
  (18, 'amelia57', 9, 5, 14, 4, 86.5, 4),
  (19, 'logan28', 2, 1, 3, 1, 98.1, 0),
  (20, 'elizabeth48', 5, 2, 7, 2, 92.4, 3),
  (21, 'michael81', 4, 3, 7, 1, 90.8, 2),
  (22, 'harper99', 1, 0, 1, 1, 99.5, 0),
  (23, 'ethan41', 8, 4, 12, 3, 87.3, 4),
  (24, 'avery18', 6, 3, 9, 2, 89.8, 3),
  (25, 'olivia51', 0, 0, 0, 0, 100.0, 0),
  (26, 'jackson26', 3, 2, 5, 1, 93.7, 1),
  (27, 'emma59', 2, 0, 2, 1, 97.0, 0),
  (28, 'aiden23', 7, 3, 10, 2, 88.1, 2),
  (29, 'sophia39', 4, 1, 5, 1, 91.5, 1),
  (30, 'liam16', 5, 2, 7, 3, 90.2, 2),
  (31, 'noah38', 0, 0, 0, 0, 100.0, 0),
  (32, 'mia88', 1, 1, 2, 0, 96.8, 1),
  (33, 'lucas44', 3, 1, 4, 2, 92.1, 2),
  (34, 'harper73', 6, 2, 8, 1, 88.9, 3),
  (35, 'ben62', 7, 3, 10, 2, 86.7, 4),
  (36, 'ava42', 4, 2, 6, 1, 90.6, 2),
  (37, 'owen47', 8, 4, 12, 3, 87.6, 4),
  (38, 'emma27', 1, 0, 1, 0, 99.2, 1),
  (39, 'william89', 5, 2, 7, 2, 91.4, 3),
  (40, 'isabella68', 2, 1, 3, 1, 97.2, 0),
  (41, 'liam32', 9, 4, 13, 3, 85.5, 4),
  (42, 'charlotte66', 3, 1, 4, 1, 93.2, 1),
  (43, 'jacob15', 6, 3, 9, 2, 89.5, 2),
  (44, 'oliver24', 0, 0, 0, 0, 100.0, 0);


---- Now to have more for SQL queries, Creating below seller_id with high number of total_claims, order_cancellations, policy_violation_count and low percentage of feedback_percentage 

INSERT INTO claims (seller_id, seller_username, item_not_as_described_claims, item_not_delivered_claims, total_claims, order_cancellations, feedback_percentage, policy_violation_count)
VALUES
  (1, 'sam145', 15, 18, 30, 20, 25, 16),
  (2, 'ben123', 17, 14, 28, 24, 28, 19),
  (3, 'jude33', 19, 22, 35, 22, 22, 17),
  (4, 'lisa78', 13, 16, 40, 21, 23, 15),
  (5, 'chris92', 18, 15, 24, 26, 20, 22),
  (6, 'mia55', 21, 25, 50, 30, 30, 26),
  (7, 'jacob13', 24, 20, 45, 45, 25, 29),
  (8, 'emma24', 22, 23, 55, 22, 28, 28),
  (9, 'olivia47', 26, 27, 65, 20, 27, 27),
  (45, 'mia86', 23, 19, 20, 40, 24, 24),
  (46, 'ava55', 28, 21, 30, 35, 23, 20),
  (47, 'henry26', 20, 26, 40, 20, 22, 30),
  (48, 'mia36', 29, 28, 35, 29, 21, 28),
  (49, 'noah68', 30, 29, 55, 25, 20, 29),
  (50, 'lucas18', 25, 30, 50, 21, 30, 15),
  (51, 'emma73', 20, 28, 45, 28, 29, 30),
  (52, 'henry48', 27, 27, 60, 22, 25, 18),
  (53, 'oliver29', 29, 25, 70, 25, 27, 19),
  (54, 'elizabeth59', 30, 24, 25, 30, 26, 21),
  (55, 'henry55', 28, 20, 65, 24, 28, 25); 
 
---- SQL operations 
----Query 1) Creating Views> This is a view (SellerProductCount) to display the seller information and the total number of products they have listed, Table alias used and left Join selected as Seller_id the primary key is in that table. Result has been grouped by seller and user id and ordered based on count, this was done as data has very limited active sellers who have product listings. 
CREATE VIEW SellerProductCount AS
SELECT s.seller_id, s.seller_username, COUNT(p.product_id) AS product_count
FROM sellers s
LEFT JOIN products p ON s.seller_id = p.seller_id
GROUP BY s.seller_id, s.seller_username
ORDER BY product_count DESC;

--To run the "view" the below query can be shared. Usually this view can be shared with Business team to identify sellers who are inactive on the site, business can connect with inactive sellers and prob the reason. The relevent company POCs only get the view data, so no other critical information is shared about seller. 
SELECT * FROM sellerproductcount; 


----Query 2)Creating Views part 2> This is a much simpler view, where users with access to this view can check the "highest payment orders". This is particuarly helpful for business to see which sellers bring  high value transactions to website. 
CREATE VIEW HighPaymentOrders AS
SELECT *
FROM orders
ORDER BY payment_amount DESC;  

--- To run the "view" the below query can be shared. 
SELECT * FROM HighPaymentOrders;

----Query 3) SQL Operation SUM> This is an aritematic operation (SUM) where I tried to find out total numbers of claims opened for any seller. This is a good way to understand which sellers need attention, as higer claim number means things are not right with sellers transaction on site. There is a likelyhood of fraud or account suspension in future. 
SELECT seller_id, SUM(total_claims) AS total_claims
FROM claims
GROUP BY seller_id
ORDER BY total_claims DESC;

----Query 4) SQL Operation Greater than operators> Another operation where I identify sellers with feedback score of over 95% or 95. A higher feedback score denotes positive experience from buyers, which puts sellers in good standing. This is valuable information as company can identify and promote listings of those sellers on site over other sellers.
SELECT seller_id, seller_username, feedback_score
FROM sellers
WHERE feedback_score > 95
ORDER BY feedback_score DESC ;


----Query 5) SQL Operation AVG> I am comparing two important aspect, which is GMV (Gross merchandise Value/ Sales) contributed and the feedback score. This is a great way to identify seller who may have a very high sales contrubution, but may be at a risk of suspension for having a low "feedback score". My query results shows there are 15 sellers with over 500K contribution to sales but has less than 85% as feedback score. These sellers are at risk and should be evaluated seperately. 
SELECT s.seller_id, s.seller_username, AVG(s.feedback_score) AS avg_feedback_score, s.gmv
FROM sellers s
GROUP BY s.seller_id, s.seller_username, s.gmv
ORDER BY gmv DESC;

----Query 6) SQL Operation> This is an essential code to check risk (Fraudulent transaction) where I am checking the IP address of Seller and buyer both for a particualr transaction or order. Ideally the IP address should not match as these two are different users, however occassioanlly as a fraudulent transaction the buyer and seller may be the same user to just inflate sales or to do money laundaring. This query when run gives you 5 seller_id and its corresponding buyer_id where IP address is same. Risk team can further review this for action. 
SELECT a.seller_id, a.transaction_id, a.order_id, a.buyer_id
FROM aml_activity a
WHERE a.seller_system_ip_location = a.buyer_system_ip;

---Query 7) SQL Operation LIMIT> By using this query, I can identify out of my pool who are the top 5 contributors of GMV (Sales). Just to name it seller_id (henry55 is at top with a GMV of 690K)
SELECT seller_id, seller_username, gmv
FROM sellers
ORDER BY gmv DESC
LIMIT 5;

----Query 8) SQL Subquery and MAX function> This subquery can be used to find the buyer who made the highest payment for an order. It first calculates the maximum payment amount and then identifies the buyer associated with that amount. This is a good way to identify who are the user ids doing high value transactions on site. My query run shows buyer_username "RobertDavis" made the highest payment for 105 & it was using "PayPal"
SELECT o.buyer_id, o.buyer_username, o.payment_amount, o.payment_mode
FROM orders o
WHERE o.payment_amount = (SELECT MAX(payment_amount) FROM orders);

----Query 9) SQL Foreign Key relationship usage> Below I have taken advantage of foreign key seller_id to connect two tables 'sellers' & 'product' and fetch data from both tables to derive results. 
SELECT p.product_id, p.product_name, p.price, s.seller_username
FROM products p
INNER JOIN sellers s ON p.seller_id = s.seller_id
WHERE p.product_id = 33; 

---Query 10) LEFT JOIN> This query gives me bird-eye view on sellers standard which is important (Excellent/Good/Bad) and compare that with policy violation counts to see if there is any correlation. 
SELECT s.seller_id, s.seller_standards, c.policy_violation_count, s.gmv
FROM sellers s
LEFT JOIN claims c ON s.seller_id = c.seller_id
ORDER BY c.policy_violation_count DESC;

----Query 11) CASE WHILE> Here I though of classify sellers based on their GMV contribution (Very high, High, Low) 
SELECT seller_id, seller_username, gmv,
  CASE
    WHEN gmv >= 350000 THEN 'High GMV'
    WHEN gmv BETWEEN 120000 AND 349999 THEN 'Medium GMV'
    ELSE 'Low GMV'
  END AS gmv_category
FROM sellers;

---- Query 12) CASE WHILE with ORDER BY Part 2> Here I ran the above function, but with additional complexity of adding order by to scheme. This query helps us to identify sellers whos single products are sold at higher value. Attention can be given to those sellers and product first as they brings more revenue to the site. 
SELECT seller_id, seller_username, average_selling_price,
  CASE
    WHEN average_selling_price >= 150 THEN 'High'
    WHEN average_selling_price BETWEEN 30 AND 150 THEN 'Medium'
    ELSE 'Low'
  END AS average_selling_price_category
FROM sellers
ORDER BY average_selling_price DESC;

----- Query 13) Aggregate functions> Basically, I decided to fund out which category of sellers brings the highest revenue to the site. So I used available functions (Max, Sum, Average). Here category_whitelisted is where all my categories are listed, my query runs and shows "jewelry" category brings the highest revenue. This category specific information is very helpful as it helps the business team to see which category needs help.  
SELECT
  category_whitelisted,
  MAX(gmv) AS max_revenue,
  SUM(gmv) AS total_revenue,
  AVG(gmv) AS average_revenue
FROM sellers
GROUP BY category_whitelisted
ORDER BY max_revenue DESC;

-------Query 14) Continuation to above, I just liked the above query, so ended by creating a view which can be shared with individual category managers for work ane evaluation. The view of the name is "max_revenue_by_category"
CREATE  VIEW max_revenue_by_category AS
SELECT
  category_whitelisted,
  MAX(gmv) AS max_revenue,
  SUM(gmv) AS total_revenue,
  AVG(gmv) AS average_revenue
FROM sellers
GROUP BY category_whitelisted
ORDER BY max_revenue DESC;

--------Query 15) Distinct> This is my last query, which gives a quick snapshot on total categories for which sellers are on site. 
SELECT DISTINCT category_whitelisted
FROM max_revenue_by_category;


