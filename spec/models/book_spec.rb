require 'spec_helper'

describe Book do
  context "valid_book" do
    let(:book1) {Book.create(title: 'T', author: 'T', published_at: '2014-06-12', description: 'this is a very interesting', rating: 'good')}
    let(:book2) {Book.create(title: '', author: 'T', published_at: '06-12', description: 'this is a very interesting', rating: 'good')}
    let(:book3) {Book.create(title: 'T', author: '', published_at: '2014-06-12', description: 'this is a very interesting', rating: 'good')}
    let(:book4) {Book.create(title: 'T', author: 'T', published_at: '', description: 'this is a very interesting', rating: 'good')}
    let(:book5) {Book.create(title: 'T', author: 'T', published_at: '2014-06-12', description: '', rating: 'good')}
    let(:book6) {Book.create(title: 'T', author: 'T', published_at: '2014-06-12', description: 'resting', rating: 'good')}
    
    
        
    it 'should require a title' do
      expect(book1).to be_valid
      expect(book2).not_to be_valid
    end

    it 'should require a author' do
      expect(book1).to be_valid
      expect(book3).not_to be_valid
    end

    it 'should require a published_at' do
      expect(book1).to be_valid
      expect(book4).not_to be_valid
      expect(book2).not_to be_valid
    end

    it 'Availability and description length' do
      expect(book1).to be_valid
      expect(book6).not_to be_valid
      expect(book5).not_to be_valid
    end
  end 
end
