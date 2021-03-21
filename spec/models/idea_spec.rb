require 'rails_helper'

RSpec.describe Idea, type: :model do
  before do
    @idea = FactoryBot.build(:idea)
  end

 
    it 'title,purpose,description,categoryが存在すれば投稿できる' do
      expect(@idea).to be_valid
    end

    it 'titleが空では投稿できない' do
      @idea.title = ''
      @idea.valid?
      expect(@idea.errors.full_messages).to include("Title can't be blank")
    end

    it 'purposeが空では投稿できない' do
      @idea.purpose = ''
      @idea.valid?
      expect(@idea.errors.full_messages).to include("Purpose can't be blank")
    end

    it 'descriptionが空では投稿できない' do
      @idea.description = ''
      @idea.valid?
      expect(@idea.errors.full_messages).to include("Description can't be blank")
    end

    it 'categoryが空では投稿できない' do
      @idea.category_id = 1
      @idea.valid?
      expect(@idea.errors.full_messages).to include("Category must be other than 1")
    end
end