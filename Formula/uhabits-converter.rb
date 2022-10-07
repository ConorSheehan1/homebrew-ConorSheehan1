class UhabitsConverter < Formula
  include Language::Python::Virtualenv

  @name = "uhabits-converter"

  desc "Convert uhabits boolean habits to the new numeric habit type"
  homepage "https://github.com/ConorSheehan1/uhabits_converter"
  url "https://files.pythonhosted.org/packages/e2/f2/028572187cd2f644a2fb0e2bd3355f478e67c317f2027751ca395ac88dc4/uhabits_converter-0.2.2.tar.gz"
  sha256 "f8a37667620d588497edc06c5e4b3aa4def8879377374114a7e6bfdef7836fa6"
  version "0.2.2"

  depends_on "python3"

  resource "blessed" do
    url "https://files.pythonhosted.org/packages/e5/ad/97453480e7bdfce94f05a983cf7ad7f1d90239efee53d5af28e622f0367f/blessed-1.19.1.tar.gz"
    sha256 "9a0d099695bf621d4680dd6c73f6ad547f6a3442fbdbe80c4b1daa1edbc492fc"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/2b/65/24d033a9325ce42ccbfa3ca2d0866c7e89cc68e5b9d92ecaba9feef631df/colorama-0.4.5.tar.gz"
    sha256 "e6c6b4334fc50988a639d9b98aa429a0b57da6e17b9a44f0451f930b6967b7a4"
  end

  resource "commonmark" do
    url "https://files.pythonhosted.org/packages/60/48/a60f593447e8f0894ebb7f6e6c1f25dafc5e89c5879fdc9360ae93ff83f0/commonmark-0.9.1.tar.gz"
    sha256 "452f9dc859be7f06631ddcb328b6919c67984aca654e5fefb3914d54691aed60"
  end

  resource "fire" do
    url "https://files.pythonhosted.org/packages/11/07/a119a1aa04d37bc819940d95ed7e135a7dcca1c098123a3764a6dcace9e7/fire-0.4.0.tar.gz"
    sha256 "c5e2b8763699d1142393a46d0e3e790c5eb2f0706082df8f647878842c216a62"
  end

  resource "inquirer" do
    url "https://files.pythonhosted.org/packages/e5/e3/cd77784d0cca9ab8b5be5a6cd4f72ffec407486207ce4f6edec3fc4b8ece/inquirer-2.10.0.tar.gz"
    sha256 "d6bef9df4d0049fb93ed4e1c1df852e48287331d21e46ed6163b8b2290fc5cb5"
  end

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/e0/ef/5905cd3642f2337d44143529c941cc3a02e5af16f0f65f81cbef7af452bb/Pygments-2.13.0.tar.gz"
    sha256 "56a8508ae95f98e2b9bdf93a6be5ae3f7d8af858b43e02c5a2ff083726be40c1"
  end

  resource "python-editor" do
    url "https://files.pythonhosted.org/packages/0a/85/78f4a216d28343a67b7397c99825cff336330893f00601443f7c7b2f2234/python-editor-1.0.4.tar.gz"
    sha256 "51fda6bcc5ddbbb7063b2af7509e43bd84bfc32a4ff71349ec7847713882327b"
  end

  resource "readchar" do
    url "https://files.pythonhosted.org/packages/75/d1/eddb559d5911fd889f2ec0de052a88edd0fa8fc4746f29da0d384d29e10e/readchar-4.0.3.tar.gz"
    sha256 "1d920d0e9ab76ec5d42192a68d15af2562663b5dfbf4a67cf9eba520e1ca57e6"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/72/de/b3a53cf1dfdbdc124e8110a60d6c6da8e39d4610c82491fc862383960552/rich-11.2.0.tar.gz"
    sha256 "1a6266a5738115017bb64a66c59c717e7aa047b3ae49a011ede4abdeffc6536e"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e/six-1.16.0.tar.gz"
    sha256 "1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"
  end

  resource "termcolor" do
    url "https://files.pythonhosted.org/packages/c1/ee/ad1f448e360e4b662fbff9e75cd210b73ad79998ce6483086e9df5b8e7e2/termcolor-2.0.1.tar.gz"
    sha256 "6b2cf769e93364a2676e1de56a7c0cff2cf5bd07f37e9cc80b0dd6320ebfe388"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/89/38/459b727c381504f361832b9e5ace19966de1a235d73cdbdea91c771a1155/wcwidth-0.2.5.tar.gz"
    sha256 "c4d647b99872929fdb7bdcaa4fbe7f01413ed3d98077df798530e5b04f116c83"
  end

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/uhabits-converter", "--version"
  end
end
