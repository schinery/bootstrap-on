require 'helper'

describe "BootstrapOn" do

  describe "the generator" do
    it "should have default generators" do
      %w{controller mailer migration model app plugin bs_admin bs_admin_page}.each do |gen|
        assert Padrino::Generators.mappings.has_key?(gen.to_sym)
        assert_equal "Padrino::Generators::#{gen.camelize}", Padrino::Generators.mappings[gen.to_sym].name
        assert Padrino::Generators.mappings[gen.to_sym].respond_to?(:start)
      end
    end
  end

end
