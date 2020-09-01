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

end
