require_relative '../lib/catalog.rb'
# rubocop:disable Lint/UselessAssignment

describe Catalog do
  action_serie = Catalog.new(:series, :action, 'Action serie', 'netflix.com')

  describe '#add_to_catalog' do
    it 'adds a new hash into the selected type and genre' do
      expect(Catalog.selection[:series][:action][0]).to be_a Hash
    end
  end

  describe '#selection' do
    it 'returns the hash of the type class variable' do
      expect(Catalog.selection).to be_a Hash
    end
  end
end
# rubocop:enable Lint/UselessAssignment
