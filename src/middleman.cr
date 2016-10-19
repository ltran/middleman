require "pg"

require "kemal"
require "./middleman/version"
require "./middleman/server"

require "option_parser"

bind = "0.0.0.0"
port = 3000

OptionParser.parse! do |opts|
  opts.on("-p PORT", "--port PORT", "define port to run server") do |opt|
    port = opt.to_i
  end
end

Kemal.config.port = port
Kemal.run


