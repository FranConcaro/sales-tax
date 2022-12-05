require_relative "../spec_helper"
require_relative "../../lib/sales_tax"
require_relative "../support/file_fixtures"

include FileFixtures
RSpec.describe SalesTax do
  context "when input file is valid" do
    let(:first_input_path) { file_fixture("first_input.txt") }
    let(:first_output_path) { file_fixture("first_output.txt") }
    let(:second_input_path) { file_fixture("second_input.txt") }
    let(:second_output_path) { file_fixture("second_output.txt") }
    let(:third_input_path) { file_fixture("third_input.txt") }
    let(:third_output_path) { file_fixture("third_output.txt") }
    it "prints a valid receipt" do
      first_output = File.read(first_output_path)

      expect(described_class.new(first_input_path).generate_receipt).to eq(first_output)
    end

    it "prints a valid receipt" do
      second_output = File.read(second_output_path)

      expect(described_class.new(second_input_path).generate_receipt).to eq(second_output)
    end
    it "prints a valid receipt" do
      third_output = File.read(third_output_path)

      expect(described_class.new(third_input_path).generate_receipt).to eq(third_output)
    end
  end
end
