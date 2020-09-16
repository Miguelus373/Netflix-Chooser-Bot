require_relative '../lib/chooser.rb'
# rubocop:disable Lint/UselessAssignment

describe Chooser do
  horror_movie1 = Catalog.new(:movies, :horror, 'Horror movie', 'netflix.com')
  horror_movie2 = Catalog.new(:movies, :horror, 'Horror movie', 'netflix.com')
  horror_movie3 = Catalog.new(:movies, :horror, 'Horror movie', 'netflix.com')

  describe '#random' do
    it 'returns a number between 0 and 2' do
      expect(Chooser.random).not_to be > 2
    end
  end

  describe '#recomendation' do
    it 'returns the random selection title' do
      expect(Chooser.recomendation('movies', 'horror').keys[0]).to eql('Horror movie')
    end

    it 'returns the random selection url' do
      expect(Chooser.recomendation('movies', 'horror').values[0]).to eql('netflix.com')
    end
  end
end
# rubocop:enable Lint/UselessAssignment
