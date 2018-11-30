module Lshw
  class Firmware
    def initialize(node)
      @node = node
    end

    def version
      @node.search('./version').text
    end
  end
end
