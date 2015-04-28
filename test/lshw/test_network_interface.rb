require_relative './../minitest_helper'

class TestNetworkInterface < Minitest::Test
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

  def test_description
    @systems.each do |s|
      s.network_interfaces.each { |i| refute_empty i.description }
    end
  end

  def test_product
    @systems.each do |s|
      s.network_interfaces.each { |i| refute_empty i.product }
    end
  end

  def test_mac
    @systems.each do |s|
      s.network_interfaces.each { |i| refute_empty i.mac }
    end
  end

  def test_speed
    @systems.each do |s|
      s.network_interfaces.each do |i|
        assert_operator i.speed, :>, 0
        assert_kind_of Integer, i.speed
      end
    end
  end
end
