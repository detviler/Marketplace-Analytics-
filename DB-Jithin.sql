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

CREATE TABLE "claims" (
  "seller_id" int,
  "seller_username" int,
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
