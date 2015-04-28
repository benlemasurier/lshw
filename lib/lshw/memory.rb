module Lshw
  class Memory
    def initialize(node)
      @node = node
    end

    def size
      @node.search('./size').text.to_i
    end

    def banks
      @node.search("./node[@class='memory']").collect do |b|
        ::Lshw::MemoryBank.new b
      end
    end
  end
end
