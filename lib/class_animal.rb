require 'securerandom'

class Animal
  #constructor 
  def initialize(species = 'crab', weight = 20, gender = 'null', is_cool = false)
    @species = species
    @weight = weight
    @gender = gender
    @is_cool = is_cool
  end

  def to_s
    "Animal #{@species}"
  end

  def ==(other)
    @species == other.species && @weight == other.weight && @gender == other.gender && @is_cool == other.is_cool
  end

  def <(other)
    @weight < other.weight
  end

  def +(other)
    new_species = @species[0, @species.length / 2] + other.species[other.species.length / 2, other.species.length]
    new_weight = (@weight + other.weight) / 2
    new_gender = SecureRandom.random_number(2) == 1 ? 'M' : 'F'
    new_is_cool = @is_cool && other.is_cool

    Animal.new(new_species, new_weight, new_gender, new_is_cool)
  end

  #instance methods
  def move
    puts 'The animal is moving around.'
  end

  def sleep
    puts 'The animal is sleeping.'
  end

  def eat(food, how_much)
    puts "The animal is eating #{food}."
    @weight += how_much
  end

  def fight(opponent)
    puts "The #{@species} is fighting vs. #{opponent.species}"
  end

  attr_accessor :species, :weight, :gender, :is_cool
end

slothington = Animal.new('Pygmy Sloth', 120, 'X', true)
slothington2 = Animal.new('Pygmy Sloth', 120, 'X', true)
slothington3 = slothington2

if __FILE__ == $0
  puts "Species - #{slothington.species}"
  puts "Weight - #{slothington.weight} lb"
  puts "Gender - #{slothington.gender}"
  puts "Is it cool? - #{slothington.is_cool}"

  puts slothington == slothington2
  slothington.move
  slothington.sleep
  slothington.eat('Peanuts', 1)

  puts "Weight - #{slothington.weight} lb"
  puts

  Hamza = Animal.new('Bulgarian Tiger', 600, 'NB', true)
  Hamza.sleep

  unicorn = Animal.new('unicorn')
  unicorn.sleep
  unicorn.fight(Hamza)

  puts slothington + unicorn
end

