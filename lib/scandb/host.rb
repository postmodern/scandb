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

require 'scandb/model'
require 'scandb/host_name'
require 'scandb/os_guess'
require 'scandb/scanned_port'

module ScanDB
  class Host

    include Model

    property :ip, String

    has n, :names, :class_name => 'HostName'

    has n, :os_guesses, :order => [:accuracy.desc], :class_name => 'OSGuess'

    has n, :scanned_ports

    #
    # Returns the primary host name.
    #
    def host_name
      names.first
    end

    def os_guess(attribs)
      unless os_guesses.first(attribs)
        return (os_guesses << OSGuess.new(attribs))
      end

      return false
    end

    def scanned_port(attribs)
      unless scanned_ports.first(attribs)
        return (scanned_ports << ScannedPort.new(attribs))
      end

      return false
    end

    def to_s
      ip
    end

  end
end
