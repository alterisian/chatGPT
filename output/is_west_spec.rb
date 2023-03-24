require_relative "./is_west.rb"

describe '#is_west?' do
  it 'returns true if Mexico is west of Spain' do
    expect(is_west?('Mexico', 'Spain')).to be true
  end
end
