
# Dev
### Tagging convention
major version tbd
minor version when adding new tool
patch version when fixing tool / installation

### generate readme table
```bash
bundle exec ruby scripts/generate_readme_table.rb
```

### python install
Formula scaffold using [poet](https://github.com/tdsmith/homebrew-pypi-poet)
```bash
poetry install
poetry run poet -f $package
# e.g. poetry run poet -f osxdocker
# note $package doesn't need to be on pypi, just installed in current python environment.
```

### ruby install
Tests and linting
```bash
bundle install
bundle exec rubocop # --safe-auto-correct
bundle exec rspec
# note: can't use parallel_tests.
# Error: Another active Homebrew update process is already in progress.
```

### debugging formula locally
1. [edit the formula](https://github.com/Homebrew/brew/issues/1505#issuecomment-260575386)
    ```bash
    brew edit $formula
    # e.g. brew edit shot
    ```

2. [install and run byebug](https://discourse.brew.sh/t/debugging-homebrew-using-pry-byebug/3234/4) at the point causing issues
    ```ruby
    def install
        Homebrew.install_gem_setup_path! "byebug"
        require 'byebug'
        byebug
        venv = virtualenv_create(libexec)
        venv.pip_install resources
    end
    ```

3. reinstall
    ```bash
    brew reinstall $formula
    # e.g. brew reinstall shot
    ``` 

Additional info at https://docs.brew.sh/Python-for-Formula-Authors

