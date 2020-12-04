# frozen_string_literal: true

describe "shot" do
  it "should brew install successfully" do
    expect(
      system(%(brew install conorsheehan1/conorsheehan1/shot))
    ).to be(true)
  end
end
