# frozen_string_literal: true

describe Player do
  it { is_expected.to have_many :scores }
  it { is_expected.to validate_presence_of :name }
end
