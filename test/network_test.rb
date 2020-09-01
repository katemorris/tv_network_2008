require 'minitest/autorun'
require 'minitest/pride'
require './lib/network'
require './lib/show'
require './lib/character'

class NetworkTest < Minitest::Test

  def setup
    @nbc = Network.new("NBC")

    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])

    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
  end

  def test_it_exists
    assert_instance_of Network, @nbc
  end

  def test_it_has_attributes
    assert_equal "NBC", @nbc.name
    assert_equal [], @nbc.shows
  end

  def test_the_network_can_have_shows
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    assert_equal [@knight_rider, @parks_and_rec], @nbc.shows
  end

  def test_can_return_main_characters

    assert_equal [@kitt], @nbc.main_characters

  end

  def test_can_return_actors_by_show
    expected = {@knight_rider => [@kitt.actor, @knight_rider.actor], @parks_and_rec => [@leslie_knope.actor, @ron_swanson.actor]}
    assert_equal expected, @nbc.actors_by_show
  end

end
