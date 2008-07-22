#
#--
# ScanDB - A library for importing and analyzing information generated by
# various network scanning utilities.
#
# Copyright (c) 2008 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#++
#

require 'scandb/database'
require 'scandb/nmap'

require 'ostruct'
require 'optparse'

module ScanDB
  module Runner
    #
    # The command-line runner.
    #
    def Runner.command_line(args)
      options = OpenStruct.new

      opts = OptionParser.new do |opts|
        opts.banner = 'usage: scandb [options] [FILE]'

        opts.on('-d','--database','URI',"The URI for the Database. Defaults to #{Database::DEFAULT_CONFIG}") do |uri|
          options.database = uri
        end

        opts.on('--import-nmap','FILE','Import a Nmap XML scan file') do |file|
          options.nmap_file = file
        end
      end

      opts.parse!(args)

      return true
    end
  end
end
