
# Dev
### python
Formula scaffold using [poet](https://github.com/tdsmith/homebrew-pypi-poet)
```bash
poetry install
poetry run poet -f osxdocker
```

### debugging formula locally
1. [edit the formula](https://github.com/Homebrew/brew/issues/1505#issuecomment-260575386)
    ```bash
    brew edit $formula
    # e.g. brew edit shot
    ```

2. install and run byebug at the point causing issues
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

### ruby
Tests and linting
```bash
bundle install
bundle exec rubocop # --safe-auto-correct
bundle exec rspec
```
