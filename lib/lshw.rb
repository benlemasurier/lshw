require 'lshw/version'
require 'lshw/system'
require 'lshw/cpu'
require 'lshw/disk'
require 'lshw/memory'
require 'lshw/memory_bank'
require 'lshw/network_interface'
require 'nokogiri'

module Lshw
  def self.XML(xml)
    hw = Nokogiri::XML(xml)
    Lshw::System.new(hw)
  end
end
