require 'rails_helper'

describe Manifest, type: :model do
  it { should belong_to(:github_repository) }
  it { should have_many(:repository_dependencies) }
end
