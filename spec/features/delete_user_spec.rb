require 'rails_helper'

RSpec.feature 'Category index' do
  let(:category){ create(:category) }
  let(:user){ create(:user) }
  let!(:prohibition){ create(:title_prohibition, word: 'entry', user: user) }

  before do
    login_as(user)
  end

  scenario 'delete account' do
    visit category_entries_path(category)

    click_link('アカウント削除')

    expect(User.count).to eq(0)
    expect(Prohibition.count).to eq(0)
  end
end

