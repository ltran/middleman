require "kemal"
require "pg"
require "pool/connection"
require "dotenv"

# Load deafult ".env" file
Dotenv.load

pg = ConnectionPool.new(capacity: 25, timeout: 0.01) do
  PG.connect(ENV["DATABASE_URL"])
end

# Matches GET "http://host:port/"
get "/" do
  result =
    pg.connection do |conn|
      conn.exec({Int32}, "SELECT auto_id from products limit 1")
    end

  result.to_hash
end

# Creates a WebSocket handler.
# Matches "ws://host:port/socket"
ws "/socket" do |socket|
  socket.send "Hello from Kemal!"
end

Kemal.run
