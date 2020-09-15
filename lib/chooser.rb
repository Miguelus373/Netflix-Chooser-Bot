require_relative 'catalog.rb'

class Chooser
  def self.random
    rand(3)
  end

  def self.recomendation(type, genre)
    Catalog.selection[type.downcase.to_sym][genre.downcase.to_sym][Chooser.random]
  end
end
