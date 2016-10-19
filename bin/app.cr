require "option_parser"
require "../src/middleman"

bind = "0.0.0.0"
port = 3000

OptionParser.parse! do |opts|
  opts.on("-p PORT", "--port PORT", "define port to run server") do |opt|
    port = opt.to_i
  end
end

Kemal.config.port = port
Kemal.run
