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

  def test_size
    @systems.each do |s|
      s.disks.each do |disk|
        refute_nil disk.size
        assert_kind_of Integer, disk.size
        assert_operator disk.size, :>, 0
      end
    end
  end

  def test_description
    @systems.each do |s|
      s.disks.each do |d|
        refute_nil d.description
        assert_kind_of String, d.description
      end
    end
  end

  def test_product
    @systems.each do |s|
      s.disks.each do |d|
        refute_nil d.product
        assert_kind_of String, d.product
      end
    end
  end

  def test_serial
    @systems.each do |s|
      s.disks.each do |d|
        refute_nil d.serial
        assert_kind_of String, d.serial
      end
    end
  end

  def test_vendor
    @systems.each do |s|
      s.disks.each do |d|
        refute_nil d.vendor
        assert_kind_of String, d.vendor
      end
    end
  end
end
