module Lshw
  class NetworkInterface
    def initialize(node)
      @node = node
    end

    def description
      @node.search('./description').text
    end

    def logical_name
      @node.search('./logicalname').text
    end

    def mac
      @node.search('./serial').text
    end

    def product
      @node.search('./product').text
    end

    def speed
      @node.search("./size[@units='bit/s']|./capacity").text.to_i
    end
  end
end
