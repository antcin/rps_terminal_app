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
      expect(subject.select).to eq('r')
    end
  end

  context "#computer_choice" do
    it "Computer selects a random weapon" do
      #arrange
      srand(0)
      allow(subject).to receive(:computer_choice).and_return 'r'

      #assert
      expect(subject.computer_choice).to eq('r')
      # expect(['r', 'p', 's']).to include(subject.computer_choice)
    end

    it "Raises an error if input is not 'r', 'p' or 's'" do
      allow(subject).to receive(:select).and_return 'strawberry'

      expect(subject.select).to raise_error "Not a valid choice"
    end
  end


  context "#outcome" do

    it "returns draw" do
      expect(subject.outcome('p', 'p')).to eq 'Draw'
    end

    it 'returns player wins' do
      expect(subject.outcome('r', 'p')).to eq 'Player wins'
    end
  end

end
