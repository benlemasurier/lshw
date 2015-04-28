require_relative './minitest_helper'

class TestLshw < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Lshw::VERSION
  end

  def test_xml_parses
    f = File.open('./test/lshw-vb-vm.xml')
    refute_nil ::Lshw::XML(f)
    f.close
  end
end
