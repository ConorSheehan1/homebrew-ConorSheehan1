# frozen_string_literal: true

# TODO: find a way to test local files rather than only files pushed to github
describe "osxdocker" do
  # # TODO: find a way to test current commit, not latest master.
  # # https://discourse.brew.sh/t/has-brew-install-force-formula-raw-path-been-taken-out/8793
  # # `brew install url` doesn't work anymore
  # # https://apple.stackexchange.com/questions/282780/how-do-i-install-a-specific-release-of-a-homebrew-formula-on-github
  # before do
  #   @commit = `git log -1 --format=%H`
  #   @raw_url = "https://raw.githubusercontent.com/conorsheehan1/" \
  #     "homebrew-conorsheehan1/#{@commit}/osxdocker.rb"
  #   puts(@raw_url)
  # end
  it "should brew install successfully" do
    expect(
      system(%(brew install conorsheehan1/conorsheehan1/osxdocker))
    ).to be(true)
  end
end
