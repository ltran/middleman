-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE TABLE urls(id BIGSERIAL PRIMARY KEY, destination_url VARCHAR(2083) NOT NULL, lookup VARCHAR NOT NULL UNIQUE);
CREATE UNIQUE INDEX urls_destination_url_index ON urls (destination_url);
CREATE UNIQUE INDEX urls_lookup_index ON urls (lookup);

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE urls;
