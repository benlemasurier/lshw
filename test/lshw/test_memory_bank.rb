require_relative './../minitest_helper'

class TestMemoryBank < Minitest::Test
  def setup
    @systems = []
    tests = ['./test/lshw-vb-vm.xml',
             './test/lshw-r620.xml']

    tests.each do |t|
      f = File.open(t)
      @systems << Lshw.XML(f)
      f.close
    end
  end

  def test_memory_banks_have_id
    @systems.each do |s|
      s.memory[:banks].each { |b| refute_nil b.id }
    end
  end

  def test_memory_banks_have_size
    @systems.each do |s|
      s.memory[:banks].each do |b|
        refute_nil b.size
        assert_kind_of Integer, b.size
      end
    end
  end

  def test_memory_banks_have_product
    @systems.each do |s|
      s.memory[:banks].each { |b| refute_nil b.product }
    end
  end

  def test_memory_banks_have_description
    @systems.each do |s|
      s.memory[:banks].each { |b| refute_nil b.description }
    end
  end

  def test_memory_banks_have_slot
    @systems.each do |s|
      s.memory[:banks].each { |b| refute_nil b.slot }
    end
  end
end
