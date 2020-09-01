class Network

  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def all_characters
    @shows.map { |show| show.characters }.flatten
  end

  def main_characters
    all_characters.select do |character|
      character.salary > 500000 && character.name == character.name.upcase
    end
  end

  def actors_by_show
    grouping = Hash.new
    @shows.each do |show|
      grouping[show] = show.characters.map { |character| character.actor }
    end
    grouping
  end

  def shows_by_actor
    grouping = Hash.new
    all_characters.each do |character|
      grouping[character.actor] = @shows.select { |show| show.actors.include?(character.actor)}
    end
    grouping
  end

  def prolific_actors
    require "pry"; binding.pry
    list = shows_by_actor.values.max_by { |shows| shows.count > 1 }
    list.keys
  end

end
