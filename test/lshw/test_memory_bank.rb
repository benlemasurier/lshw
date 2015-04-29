require_relative './../minitest_helper'

class TestMemoryBank < Minitest::Test
  def setup
    @systems = {
      vm: { path: './test/lshw-vb-vm.xml' },
      bm: { path: './test/lshw-r620.xml' }
    }

    @systems.each do |which, data|
      f = File.open(data[:path])
      data[:lshw] = Lshw.XML(f)
      f.close
    end
  end

  def test_id
    @systems.each do |k,v|
      v[:lshw].memory.banks.each { |b| refute_nil b.id }
    end
  end

  def test_number_of_banks
    @systems.each do |k,v|
      case k
      when :vm
        assert_equal 0, v[:lshw].memory.banks.length
      when :bm
        assert_equal 24, v[:lshw].memory.banks.length
      end
    end
  end

  def test_size
    @systems.each do |k,v|
      v[:lshw].memory.banks.each do |b|
        refute_nil b.size
        assert_kind_of Integer, b.size
      end
    end
  end

  def test_product
    @systems.each do |k,v|
      v[:lshw].memory.banks.each { |b| refute_nil b.product }
    end
  end

  def test_description
    @systems.each do |k,v|
      v[:lshw].memory.banks.each { |b| refute_nil b.description }
    end
  end

  def test_slot
    @systems.each do |k,v|
      v[:lshw].memory.banks.each { |b| refute_nil b.slot }
    end
  end
end
