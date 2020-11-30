# frozen_string_literal: true

# TODO: find a way to test local files rather than only files pushed to github
# TODO: make generic test that loops over files ../*.rb, creates test per file?
describe "osxdocker" do
  # ensure fresh install
  before do
    system %(brew uninstall conorsheehan1/conorsheehan1/osxdocker)
  end
  it "should not throw an error when brew installing" do
    # TODO: use raw github url to install specific version
    # https://apple.stackexchange.com/questions/282780/how-do-i-install-a-specific-release-of-a-homebrew-formula-on-github
    expect do
      system %(brew install conorsheehan1/conorsheehan1/osxdocker)
    end.not_to(raise_error)
  end
end
