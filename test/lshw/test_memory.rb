require_relative './../minitest_helper'

class TestCPU < Minitest::Test
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

  def test_size
    @systems.each do |s|
      refute_nil s.memory.size
      assert_kind_of Integer, s.memory.size
    end
  end

  def test_banks
    @systems.each do |s|
      refute_nil s.memory.banks
    end
  end
end
