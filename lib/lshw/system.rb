module Lshw
  class System
    CPU_PATH = "//node[@class='processor']"
    DESCRIPTION_PATH = '/list/node/description'
    DISKS_PATH = "//node[@id='disk']"
    MEMORY_PATH = "//node[@id='memory']"
    NETWORK_PATH = "//node[@class='network' and @handle!='']"
    PRODUCT_PATH = '/list/node/product'
    SERIAL_PATH = '/list/node/serial'

    @hw = nil

    def initialize(hw)
      @hw = hw
    end

    def cpus
      @hw.search(CPU_PATH).collect { |cpu| ::Lshw::CPU.new cpu }
    end

    def description
      @hw.search(DESCRIPTION_PATH).text
    end

    def disks
      @hw.search(DISKS_PATH).collect { |disk| ::Lshw::Disk.new disk }
    end

    def memory
      ::Lshw::Memory.new @hw.search(MEMORY_PATH)
    end

    def network_interfaces
      @hw.search(NETWORK_PATH).collect { |i| ::Lshw::NetworkInterface.new i }
    end

    def product
      @hw.search(PRODUCT_PATH).text
    end

    def serial
        @hw.search(SERIAL_PATH).text
    end
  end
end
