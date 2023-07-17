# forzen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do 
    describe 'relation' do 
        it do 
            is_expected.to have_many(:comments)
            is_expected.to have_one_attached(:photo)
        end
    end
end
