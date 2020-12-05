[![Build Status](https://github.com/ConorSheehan1/homebrew-ConorSheehan1/workflows/ci/badge.svg)](https://github.com/ConorSheehan1/homebrew-ConorSheehan1/actions/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Code style](https://img.shields.io/badge/code_style-rubocop-black.svg)](https://github.com/rubocop-hq/rubocop)

A [homebrew](https://docs.brew.sh/) [tap](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap) for things I've made.

# Example
```bash
brew install conorsheehan1/conorsheehan1/osxdocker
brew install conorsheehan1/conorsheehan1/shot
```

# Dev
### python
Formula scaffold using [poet](https://github.com/tdsmith/homebrew-pypi-poet)
```bash
poetry install
poetry run poet -f osxdocker
```

### ruby
Tests and linting
```bash
bundle install
bundle exec rubocop # --safe-auto-correct
bundle exec rspec
```
