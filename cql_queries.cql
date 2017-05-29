CREATE TABLE IF NOT EXISTS business(
  business_id text PRIMARY KEY,
  address text,
  hours list<text>,
  is_open int,
  categories list<text>,
  city text,
  review_count int,
  name text,
  neighborhood text,
  postal_code text,
  longitude double,
  latitude double,
  state text,
  stars double,
  attributes list<text>,
  type text
);

CREATE TABLE IF NOT EXISTS review(
  review_id text PRIMARY KEY,
  user_id text,
  business_id text,
  funny int,
  useful int,
  cool int,
  stars double,
  date text,
  text text,
  type text
);

CREATE TABLE IF NOT EXISTS user(
  user_id text PRIMARY KEY,
  name text,
  yelping_since text,
  review_count int,
  friends set<text>,
  fans int,
  average_stars double,
  type text,
  useful int,
  funny int,
  cool int,
  compliment_photos int,
  compliment_list int,
  compliment_funny int,
  compliment_plain int,
  compliment_note int,
  compliment_writer int,
  compliment_cute int,
  compliment_more int,
  compliment_hot int,
  compliment_profile int,
  compliment_cool int,
  elite list<text>
);

CREATE TABLE IF NOT EXISTS tip(
  tip_id uuid PRIMARY KEY,
  user_id text,
  text text,
  business_id text,
  likes int,
  date text,
  type text
);

CREATE TABLE IF NOT EXISTS checkin(
  checkin_id uuid PRIMARY KEY,
  time list<text>,
  business_id text,
  type text
);
