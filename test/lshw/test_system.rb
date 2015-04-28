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

  def test_cpus
    @systems.each { |s| refute_empty s.cpus }
  end

  def test_product
    @systems.each { |s| refute_nil s.product }
  end

  def test_description
    @systems.each do |s|
      refute_nil s.description
      assert_kind_of String, s.description
    end
  end

  def test_disks
    @systems.each { |s| refute_empty s.disks }
  end

  def test_memory
    @systems.each { |s| refute_nil s.memory }
  end

  def test_network_interfaces
    @systems.each { |s| refute_empty s.network_interfaces }
  end
end
