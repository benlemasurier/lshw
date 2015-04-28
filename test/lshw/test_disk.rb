require_relative './../minitest_helper'

class TestDisk < Minitest::Test
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

  def test_disks_have_size
    @systems.each do |s|
      s.disks.each do |disk|
        assert_kind_of Integer, disk.bytes
        assert_operator disk.bytes, :>, 0
      end
    end
  end

  def test_disks_have_description
    @systems.each do |s|
      s.disks.each { |d| refute_nil d.description }
    end
  end

  def test_disks_have_product
    @systems.each do |s|
      s.disks.each { |d| refute_nil d.product }
    end
  end

  def test_disks_have_serial
    @systems.each do |s|
      s.disks.each { |d| refute_nil d.serial }
    end
  end
end
