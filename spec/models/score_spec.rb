# frozen_string_literal: true

describe Score do
  it { is_expected.to belong_to :player }
  it { is_expected.to validate_presence_of :start_time }
  it { is_expected.to validate_presence_of :playing_time }
end
