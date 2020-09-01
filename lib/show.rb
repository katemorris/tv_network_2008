class Show

  attr_reader :name, :creator, :characters

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary

    @characters.reduce(0) { |total, character| total += character.salary }

  end

  def highest_paid_actor

    highest_character = @characters.find { |character| character.salary }
    highest_character.actor

  end

  def actors

    @characters.map { |character| character.actor }

  end
end
