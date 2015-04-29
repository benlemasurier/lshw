module Lshw
  class MemoryBank
    def initialize(node)
      @node = node
    end

    def id
      @node.search('./physid').text.to_i
    end

    def size
      @node.search("./size[@units='bytes']").text.to_i
    end

    def description
      @node.search('./description').text
    end

    def product
      @node.search('./product').text
    end

    def slot
      @node.search('./slot').text
    end
  end
end
