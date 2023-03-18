require 'rails_helper'

describe ResultsData do
  context 'validations' do
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:marks) }
    it { should validate_presence_of(:timestamp) }
  end
end
