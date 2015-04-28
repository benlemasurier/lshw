require_relative './../minitest_helper'

class TestSystem < Minitest::Test
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

  def test_system
    @systems.each { |s| assert_instance_of ::Lshw::System, s }
  end

  def test_cpus_not_empty
    @systems.each { |s| refute_empty s.cpus }
  end

  def test_product_exists
    @systems.each { |s| refute_nil s.product }
  end

  def test_description_exists
    @systems.each { |s| refute_nil s.description }
  end

  def test_disks_not_empty
    @systems.each { |s| refute_empty s.disks }
  end

  def test_memory_exists
    @systems.each { |s| refute_nil s.memory }
  end

  def test_memory_has_size
    @systems.each { |s| refute_nil s.memory[:size] }
  end

  def test_memory_has_banks
    @systems.each { |s| refute_nil s.memory[:banks] }
  end

  def test_memory_size_is_integer
    @systems.each { |s| assert_kind_of Integer, s.memory[:size] }
  end

  def test_network_interfaces_exist
    @systems.each { |s| refute_empty s.network_interfaces }
  end
end
