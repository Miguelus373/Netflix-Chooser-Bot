class Catalog

  @@movies = {action: [], comedy: [], drama: [], romance: [], horror: []}
  @@series = {action: [], comedy: [], drama: [], romance: [], horror: []}
  @@type = {movies: @@movies, series: @@series}

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
