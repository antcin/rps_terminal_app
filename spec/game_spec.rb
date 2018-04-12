require "game"

describe Game do

  subject { Game.new(stdout_mock, stdin_mock)}
  let(:stdout_mock) { double() }
  let(:stdin_mock) { double() }

  context "#prompt" do
    it "It prompts the user to select a weapon" do
      # arrange/assert
      allow(stdout_mock).to receive(:write) { "Choose your weapon: r/p/s\n" }

      # act
      subject.prompt
    end
  end

  context "#select" do
    it "It takes input from the user" do
      # arrange
      allow(stdin_mock).to receive(:read).and_return "r"

      # act
      expect(subject.select).to eq("r")
    end
  end

end
