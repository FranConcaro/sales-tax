require "spec_helper"
require "file_parser"
require_relative "../support/file_fixtures"

RSpec.describe FileParser do
  let(:input_file_path) { file_fixture("third_input.txt") }
  let(:file_parser) { described_class.new(input_file_path) }
  let(:products_data_output) do
    [{ quantity: 1.0, price: 27.99, name: "imported bottle of perfume" },
     { quantity: 1.0, price: 18.99, name: "bottle of perfume" },
     { quantity: 1.0, price: 9.75, name: "packet of headache pills" },
     { quantity: 3.0, price: 11.25, name: "imported boxes of chocolates" }]
  end
  context "when file data is valid" do
    it "parses the products data" do
      expect(file_parser.products_data).to eq(products_data_output)
    end
  end
end
