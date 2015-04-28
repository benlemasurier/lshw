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

  def test_cpus_have_product
    @systems.each do |s|
      s.cpus.each { |cpu| refute_empty cpu.product }
    end
  end

  def test_cpus_have_vendor
    @systems.each do |s|
      s.cpus.each { |cpu| refute_empty cpu.vendor }
    end
  end

  def test_cpus_have_flags
    @systems.each do |s|
      s.cpus.each { |cpu| assert_operator cpu.flags.length, :>, 0 }
    end
  end

  def test_cpus_have_bits
    @systems.each do |s|
      s.cpus.each do |cpu|
        refute_nil cpu.bits
        assert_kind_of Integer, cpu.bits
      end
    end
  end
end
