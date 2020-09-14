require_relative 'chooser.rb'

class Catalog

  @@movie = {action: [], comedy: [], drama: [], romance: [], horror: []}
  @@serie = {action: [], comedy: [], drama: [], romance: [], horror: []}
  @@type = {movie: @@movie, serie: @@serie}

  attr_reader :type
  attr_reader :genre
  attr_reader :title
  attr_reader :url

  def initialize(type, genre, title, url)
    @type = type
    @genre = genre
    @title = title
    @url = url
    add_to_catalog
  end

  def add_to_catalog
    @@type[type][genre].push(title => url)
  end

  def self.selection
    @@type
  end
end
