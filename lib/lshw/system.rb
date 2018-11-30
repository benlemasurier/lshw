module Lshw
  class System
    ALL_NETWORKS_PATH = "//node[@class='network']"
    CPU_PATH = "//node[@class='processor']"
    DESCRIPTION_PATH = '/list/node/description'
    DISKS_PATH = "//node[@id='disk']"
    FIRMWARE_PATH = "//node[@id='firmware']"
    MEMORY_PATH = "//node[@id='memory']"
    MEMORY_NODES_PATH = "//node[@class='memory']"
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

    def firmware
      @hw.search(FIRMWARE_PATH).collect { |firm| ::Lshw::Firmware.new firm }
    end

    # depreciated in this version
    def memory
      ::Lshw::Memory.new @hw.search(MEMORY_PATH)
    end

    def memory_nodes
      @hw.search(MEMORY_NODES_PATH).collect { |memory| ::Lshw::Memory.new memory }
    end

    def all_network_interfaces
      @hw.search(ALL_NETWORKS_PATH).collect { |i| ::Lshw::NetworkInterface.new i }
    end

    # depreciated in this version
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
