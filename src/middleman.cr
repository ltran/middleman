require "dotenv"
require "kemal"
require "./middleman/version"
require "./middleman/server"

require "option_parser"

# Load deafult ".env" file
Dotenv.load

module Middleman
end

Kemal.run
