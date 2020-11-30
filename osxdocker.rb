class Osxdocker < Formula
  include Language::Python::Virtualenv

  desc "A CLI for working with docker on OSX"
  homepage "https://github.com/ConorSheehan1/osxdocker"
  url "https://files.pythonhosted.org/packages/97/40/4793a93bf53da7d396b5dc096fe7aa360759907a7e44cbad5d76af73c4d8/osxdocker-0.1.3.tar.gz"
  sha256 "22494190cb8053c806ae19b02c6ec998a59b2a959076f4bd84bc7d0b2fad81c3"

  depends_on "python3"
  depends_on "docker" => :recommended
  depends_on "screen" => :recommended

  resource "fire" do
    url "https://files.pythonhosted.org/packages/34/a7/0e22e70778aca01a52b9c899d9c145c6396d7b613719cd63db97ffa13f2f/fire-0.3.1.tar.gz"
    sha256 "9736a16227c3d469e5d2d296bce5b4d8fa8d7851e953bda327a455fc2994307f"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426/six-1.15.0.tar.gz"
    sha256 "30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259"
  end

  resource "termcolor" do
    url "https://files.pythonhosted.org/packages/8a/48/a76be51647d0eb9f10e2a4511bf3ffb8cc1e6b14e9e4fab46173aa79f981/termcolor-1.1.0.tar.gz"
    sha256 "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
  end

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/osxdocker", "version"
  end
end
