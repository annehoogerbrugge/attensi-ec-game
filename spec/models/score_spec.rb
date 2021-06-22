# frozen_string_literal: true

describe Score do
  it { is_expected.to belong_to :player }
  it { is_expected.to validate_presence_of :start_time }
  it { is_expected.to validate_presence_of :playing_time }
  it { is_expected.to validate_numericality_of(:points).only_integer }
  it { is_expected.to validate_numericality_of(:points).is_less_than_or_equal_to(100) }
end
