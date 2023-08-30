# renegade.bio

- [renegade.bio](#renegadebio)
  - [Deployed Environments](#deployed-environments)
  - [Development Environment](#development-environment)
    - [Requirements](#requirements)
    - [Setup](#setup)

## Deployed Environments

Production runs at www.renegade.bio and Staging runs at https://renegadebio-staging.herokuapp.com

## Development Environment

### Requirements

1. [homebrew](https://brew.sh/)
2. [node](https://nodejs.org/en/download/)
3. [git](https://git-scm.com/download/mac)
4. [heroku-cli](https://devcenter.heroku.com/articles/heroku-cli#install-the-heroku-cli)
5. [github-cli](https://cli.github.com/)
6. [Postgress](https://postgresapp.com/)
7. [rvm](https://rvm.io/rvm/install)

- OR:
  - [rbenv](https://github.com/rbenv/rbenv#homebrew-on-macos)
  - [ruby-build](https://github.com/rbenv/ruby-build#installation)

8. [Ruby 3.1.2](https://www.ruby-lang.org/en/news/2022/04/12/ruby-3-1-2-released/)
9. [Rails 7.0.3.1](https://rubygems.org/gems/rails/versions/7.0.3.1)

### Setup

The instructions below outline setting up the project to run locally on your Mac. These instructions assume a fresh install of `macOS 10.15 Catalina` or, `macOS 12 Monterey`. If you're using another operating system, ask or find an install tutorial online, such as: . If you already have an OS setup, make sure to check if the package has already been installed at each step. Steps 1-6 assume no pre-established setup or development environment, some steps may not be applicable.

1. If using `zsh` & this is a clean install or you haven't established a `.zshrc` file yet, do that first:

- $ `touch ~/.zshrc`

2. Install Homebrew (if not already installed)

- $ `which brew` – If installed should print something like: `/usr/local/bin/brew`
- Otherwise follow the instructions here:
  - [homebrew](https://brew.sh/)

3. Install & setup `node` (if not already installed)

- [node](https://nodejs.org/en/download/)
- Install `v16` or later

4. Install & setup `git` (if not already installed)

- [git](https://git-scm.com/download/mac)

5. Install & setup `github-cli` (if not already installed)

- [github-cli](https://cli.github.com/)
- Link your GitHub account `gh auth login`

6. Install & setup `heroku-cli` (if not already installed)

- [heroku-cli](https://devcenter.heroku.com/articles/heroku-cli#install-the-heroku-cli)
- Follow the post-install instructions
- Create a Heroku.com account if you do not already have one

7.  - If you're using `macOS 12` or later, Download and install the "_Postgres.app with all currently supported versions (Universal/Intel)_" version
    - Otherwise, we are using `PostgreSQL 12` or later, so check the available downloads for your OS.

- Add the necessary [CLI integration](https://postgresapp.com/documentation/cli-tools.html)
  - $ `sudo mkdir -p /etc/paths.d && echo /Applications/Postgres.app/Contents/Versions/latest/bin | sudo tee /etc/paths.d/postgresapp`
- Once installed, open the app and setup a new `PostgreSQL 12` server
- Initialize the server by clicking "_Initialize_"
- Click the "_Server Settings_" button and check the "_Automatically start server_" option

8. Install & setup gem/environment manager.

- If using `bash` install:
  - [rvm](https://rvm.io/rvm/install):
- If using `zsh` install:
  - [rbenv](https://github.com/rbenv/rbenv#homebrew-on-macos) and
  - [ruby-build](https://github.com/rbenv/ruby-build#installation) together

9. Install Redis

- $ `brew update`
- $ `brew install redis`
- $ `brew tap homebrew/services`
- $ `brew services start redis`

10. Setup gem/environment manager

- If using `rvm`:
  - $ `rvm gemset create renegadebio`
  - $ `rvm use ruby-3.1.2@renegadebio`
  - Create a new file in the root director of the project named `.rvmrc`. Add this line to the file and save:
    - `rvm use ruby-3.1.2@renegadebio`
- If using `rbenv`
  - $ `rbenv init`
  - Follow the instructions and add `eval "$(rbenv init - sudo)"` to your profile
    - $ `echo 'eval "$(rbenv init -)"' >> ~/.zshrc`
    - $ `source ~/.zshrc`
    - $ `curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash`
  - $ `rbenv local 3.1.2`
  - $ `rbenv install 3.1.2`

11. Install Gems (note you may need to `sudo` install some or all of these)

- Foreman – Foreman should be installed globally and **SHOULD NOT BE INCLUDED IN THE GEM FILE**
  - $ `gem install foreman`
- Install Bundler
  - $ `gem install bundler` <!-- https://stackoverflow.com/a/25068058/1522214 -->

12. Install Rails

- $ `gem install rails -v 7.0.3.1 --no-document`

13. Clone the renegade.bio repo (if you have not already done so)

- $ `git clone https://github.com/renegadebio/renegade.bio.git`
- $ `bundle install`

14. Create your local `.env` file from the `.env-example` file provided

- $ `cp .env-example .env`
- Contact [eric@renegadebio.com](eric@renegadebio.com) for .env settings

15. Setup Database & Seed

- Create a database user:
  - $ `psql`
  - \# `CREATE USER` _your_user_name_ `WITH PASSWORD '`_create_new_secure_password_`';`
    - e.g.: `CREATE USER renegadebio WITH PASSWORD 'abc123';`
  - \# `ALTER ROLE` _your_user_name_ `SUPERUSER;`
  - \# `\q` to exit
  - Add your username and password to the `.env` file
  - Setup the DB
    - $ `mkdir _dumps`
    - Request a copy of the current DB dump from [eric@renegadebio.com](eric@renegadebio.com) and add it to the `_dumps` directory
    - $ `rails db:create:all`
    - Follow the instructions provided with the dump for populating the DB
    - $ `rails db:migrate`

16. Install Yarn & node modules

- $ `sudo npm install --location=global yarn` (if not already installed)
- $ `yarn install`

17. Generate & install Self-Signed SSL Certificate

- See [SSL for local development](#sslforlocaldevelopment) below
- Restart your computer and then move on to step 18

18. Run Development Server from the repository root (with `foreman`)

- $ `foreman start -f Procfile.dev`

19. Run Tests _(TBD - Skip)_

- `rake spec`

20. Open a browser and navigate to `localhost:8080` and you should be greeted with the renegade.bio homepage

- If you installed the SSL Certificate, use `https://localhost:8080`

## SSL for local development

1. Install [`mkcert`](https://medium.com/@matayoshi.mariano/how-to-add-ssl-to-your-localhost-with-puma-37a66a649f29)
2. Generate a new Self-Signed Certificate:

- Follow the instructions in the `README.md` file in the `config/certs/` directory of this repo

3. Open the `Keychain` app, search for `localhost` open it, expand the "Trust" section and change all drop downs to "Always Trust"
4. Restart your computer and resume at step "_18. Run Development Server (with `foreman`)_" above
