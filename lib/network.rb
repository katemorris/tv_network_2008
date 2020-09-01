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
    grouping[@shows[0]] = @shows[0].characters.map { |character| character.actor }
    grouping[@shows[1]] = @shows[1].characters.map { |character| character.actor }
    grouping
  end

end
