require 'pry'
class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def buy_cat(name)
    owner = self
    new_cat = Cat.new(name, owner)
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_dog(name)
    owner = self
    new_dog = Dog.new(name, owner)
  end
  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end


  def sell_pets
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end