#import sorting_methods
#class names start with capital letter
import random


class Animal:
	#constructor 
	def __init__(self, species = 'crab', weight = 20, gender = 'null', is_cool = False):
		self.species = species
		self.weight = weight
		self.gender = gender
		self.is_cool = is_cool

	def __str__(self):
		return f'Animal {self.species}'

	def __eq__(self, other):
		return self.species == other.species and self.weight == other.weight and self.gender == other.\
			gender and self.is_ool == other.is_cool

	def __lt__(self, other):
		return self.weight < other.weight

	def __add__(self, other):
		new_species = self.species[:len(self.species) // 2] + other.species[len(other.species) // 2:]
		new_weight = (self.weight + other.weight) // 2
		new_gender = 'M' if random.randint(1,2) == 1 else 'F'
		new_is_cool = self.is_cool and other.is_cool

		return Animal(new_species, new_weight, new_gender, new_is_cool)

	#instance methods
	def move(self):
		print('The animal is moving around.')

	def sleep(self):
		print('The animal is sleeping.')

	def eat(self, food, how_much):
		print(f'The animal is eating {food}.')
		self.weight += how_much

	def fight(self, opponent):
		print(f'The {self.species} is fighting vs. {opponent.species}')

slothington = Animal('Pygmy Sloth', 120, 'X', True)
slothington2 = Animal('Pygmy Sloth', 120, 'X', True)
slothington3 = slothington2

if __name__ == '__main__':
	print('Species -',slothington.species)
	print('Weight -',slothington.weight,'lb')
	print('Gender -',slothington.gender)
	print('Is it cool? -',slothington.is_cool)

	print(slothington == slothington2)
	slothington.move()
	slothington.sleep()
	slothington.eat('Peanuts', 1)

	print('Weight -',slothington.weight,'lb')
	print()

	Hamza = Animal('Bulgarian Tiger', 600, 'NB', True)
	Hamza.sleep()

	unicorn = Animal('unicorn')
	unicorn.sleep()
	unicorn.fight(Hamza)

	print(slothington + unicorn)