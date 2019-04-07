require 'tempfile'
require 'config'

RSpec.describe Config, "#read" do
  context "With existing config file" do

    it "reads file correctly" do
      test_file = Tempfile.new(['config','.yml'])

      test_file.tap do |f|
        content = <<~HEREDOC.strip
        key: value
        another_key: another value
        number: 1
        array: 
          - a
          - b
          - c
        hash:
          key: foo
        HEREDOC
        f << content
        f.close
      end
      config = Config.new(test_file.path)

      expect(config.key).to eq "value"
      expect(config.another_key).to eq "another value"
      expect(config.number).to eq 1
      expect(config.array).to eq ["a", "b", "c"]
      expect(config.hash["key"]).to eq "foo"

      test_file.unlink
    end

  end
end
