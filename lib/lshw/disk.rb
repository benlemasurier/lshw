module Lshw
  class Disk
    def initialize(node)
      @node = node
    end

    def description
      @node.search('./description').text
    end

    def product
      @node.search('./product').text
    end

    def serial
      @node.search('./serial').text
    end

    def bytes
      @node.search("./size[@units='bytes']").text.to_i
    end
  end
end
