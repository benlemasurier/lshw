module Lshw
  class CPU
    def initialize(node)
      @node = node
    end

    def id
      @node['id']
    end

    def bits
      @node.search("./width[@units='bits']").text.to_i
    end

    def product
      @node.search('./product').text
    end

    def slot
      @node.search('./slot').text
    end

    def vendor
      @node.search('./vendor').text
    end

    def version
      @node.search('./version').text
    end

    def flags
      @node.search('.//capability').collect { |f| f.attr('id') }
    end
  end
end
