class osxdocker < Formula
  include Language::Python::Virtualenv

  desc "A CLI for working with docker on OSX"
  homepage ""
  url "https://github.com/ConorSheehan1/osxdocker/archive/v0.1.3.tar.gz"
  sha256 "6b66d04c218e7116e4c3ef2458bdb637b0461a0e9f08d241355da3d1a62db726"
  head "https://github.com/ConorSheehan1/osxdocker"

  # TODO: If you're submitting an existing package, make sure you include your
  #       bottle block here.

  depends_on :python3

  resource "six" do
    url "https://files.pythonhosted.org/packages/73/fb/00a976f728d0d1fecfe898238ce23f502a721c0ac0ecfedb80e0d88c64e9/six-1.12.0-py2.py3-none-any.whl#sha256=3350809f0555b11f552448330d0b52d5f24c91a322ea4a15ef22629740f3761c"
    sha256 "3350809f0555b11f552448330d0b52d5f24c91a322ea4a15ef22629740f3761c"
  end

  resource "termcolor" do
    url "https://files.pythonhosted.org/packages/8a/48/a76be51647d0eb9f10e2a4511bf3ffb8cc1e6b14e9e4fab46173aa79f981/termcolor-1.1.0.tar.gz#sha256=1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
    sha256 "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
  end

  def install
    virtualenv_install_with_resources
  end

  # TODO: Add your package's tests here
end