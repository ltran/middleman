require "kemal"
require "pg"
require "pool/connection"
require "dotenv"

# Load deafult ".env" file
Dotenv.load

pg = ConnectionPool.new(capacity: 25, timeout: 0.01) do
  PG.connect(ENV["PG_URL"])
end

before_all do |env|
  env.response.content_type = "application/json"
end

# Matches GET "http://host:port/"
get "/urls" do |env|
  #env.response.content_type = "application/json"
  result =
    pg.connection do |conn|
      conn.exec({Int64, String, String}, "SELECT * from urls limit 100")
    end

  {
    data: result.to_hash
  }.to_json
end

def generate_lookup
  Time.now
end

post "/urls" do |env|
  url = env.params.json["url"].as String
  lookup = generate_lookup
  begin
  result = pg.connection do |conn|
    conn.exec({Int64, String, String}, "INSERT INTO urls (destination_url, lookup) VALUES ('#{url}', '#{lookup}') RETURNING *;")
  end

  {
    data: result.to_hash.first
  }.to_json

  rescue e
    env.response.status_code = 403
    {
      error: {
        message: "Could not create. #{e}"
      }
    }.to_json
  end
end

get "/:lookup" do |env|
  lookup = env.params.url["lookup"].as String

  begin
    result =
      pg.connection do |conn|
        conn.exec({Int64, String, String}, "SELECT * from urls WHERE lookup = '#{lookup}' limit 1;")
      end

    env.redirect result.to_hash.first["destination_url"].to_s
  rescue
    env.response.status_code = 403

    {
      error: {
        message: "Url not found."
      }
    }.to_json
  end
end

Kemal.run
