require 'spec_helper'

describe Book do

  it { should have_many(:recipes) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:cuisine) }
  it { should validate_presence_of(:publication_date) }


end
