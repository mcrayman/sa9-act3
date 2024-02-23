require_relative 'class_animal'

RSpec.describe Animal do
  describe '#initialize' do
    it 'creates a new Animal object with default values' do
      animal = Animal.new
      expect(animal.species).to eq('crab')
      expect(animal.weight).to eq(20)
      expect(animal.gender).to eq('null')
      expect(animal.is_cool).to eq(false)
    end

    it 'creates a new Animal object with specified values' do
      animal = Animal.new('lion', 200, 'male', true)
      expect(animal.species).to eq('lion')
      expect(animal.weight).to eq(200)
      expect(animal.gender).to eq('male')
      expect(animal.is_cool).to eq(true)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the Animal object' do
      animal = Animal.new('tiger', 150, 'female', true)
      expect(animal.to_s).to eq('Animal tiger')
    end
  end

  describe '#==' do
    it 'returns true if two Animal objects are equal' do
      animal1 = Animal.new('elephant', 5000, 'male', true)
      animal2 = Animal.new('elephant', 5000, 'male', true)
      expect(animal1 == animal2).to eq(true)
    end

    it 'returns false if two Animal objects are not equal' do
      animal1 = Animal.new('elephant', 5000, 'male', true)
      animal2 = Animal.new('lion', 200, 'male', true)
      expect(animal1 == animal2).to eq(false)
    end
  end

  describe '#<' do
    it 'returns true if the weight of the current Animal object is less than the weight of the other Animal object' do
      animal1 = Animal.new('elephant', 5000, 'male', true)
      animal2 = Animal.new('lion', 200, 'male', true)
      expect(animal2 < animal1).to eq(true)
    end

    it 'returns false if the weight of the current Animal object is greater than or equal to the weight of the other Animal object' do
      animal1 = Animal.new('elephant', 5000, 'male', true)
      animal2 = Animal.new('lion', 200, 'male', true)
      expect(animal1 < animal2).to eq(false)
      expect(animal1 < animal1).to eq(false)
    end
  end

  describe '#+' do
    it 'returns a new Animal object with combined species, average weight, random gender, and coolness status' do
      animal1 = Animal.new('tiger', 150, 'female', true)
      animal2 = Animal.new('lion', 200, 'male', true)
      new_animal = animal1 + animal2
      expect(new_animal.species).to eq('tiglion')
      expect(new_animal.weight).to eq(175)
      expect(['M', 'F']).to include(new_animal.gender)
      expect(new_animal.is_cool).to eq(true)
    end
  end

  describe '#move' do
    it 'prints a message indicating that the animal is moving around' do
      animal = Animal.new('tiger', 150, 'female', true)
      expect { animal.move }.to output("The animal is moving around.\n").to_stdout
    end
  end

  describe '#sleep' do
    it 'prints a message indicating that the animal is sleeping' do
      animal = Animal.new('tiger', 150, 'female', true)
      expect { animal.sleep }.to output("The animal is sleeping.\n").to_stdout
    end
  end

  describe '#eat' do
    it 'prints a message indicating that the animal is eating and updates its weight' do
      animal = Animal.new('tiger', 150, 'female', true)
      expect { animal.eat('meat', 10) }.to output("The animal is eating meat.\n").to_stdout
      expect(animal.weight).to eq(160)
    end
  end

  describe '#fight' do
    it 'prints a message indicating that the current animal is fighting against the opponent' do
      animal1 = Animal.new('tiger', 150, 'female', true)
      animal2 = Animal.new('lion', 200, 'male', true)
      expect { animal1.fight(animal2) }.to output("The tiger is fighting vs. lion\n").to_stdout
    end
  end

  describe 'accessors' do
    it 'allows getting and setting of species, weight, gender, and is_cool attributes' do
      animal = Animal.new('tiger', 150, 'female', true)
      animal.species = 'lion'
      animal.weight = 200
      animal.gender = 'male'
      animal.is_cool = false
      expect(animal.species).to eq('lion')
      expect(animal.weight).to eq(200)
      expect(animal.gender).to eq('male')
      expect(animal.is_cool).to eq(false)
    end
  end
end