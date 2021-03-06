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
require 'scandb/host'
require 'scandb/service'

module ScanDB
  class Port

    include Model

    # The protocol that the port is runnin on
    # (<tt>:tcp</tt>, <tt>:udp</tt>)
    property :protocol, Enum[:tcp, :udp]

    # The port number
    property :number, Integer, :index => true

    # The scanned ports related to this port
    has n, :scanned, :class_name => 'ScannedPort'

    # The hosts which were scanned for this port
    has n, :hosts, :through => :scanned

    # The services that were found running on this port
    has n, :services, :through => :scanned

    #
    # Returns the String form of the port.
    #
    def to_s
      "#{number}/#{protocol}"
    end

  end
end
