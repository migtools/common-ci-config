Common configs for Konveyor projects

Currently POC, you may try it by:

Within your project (e.g. Pelorus):

1. Clone common-ci-config repository
  $ git clone https://github.com/konveyor/common-ci-config.git

2. (This will override Makefile, so make sure to have clean project repo)
   Copy content of the entire repository to your project

  $ cp -r common-ci-config/makefile/* ./path-to-your-project

3. Copy configuration file to your project
  $ cp ./path-to-your-project/makefile/.konveyor/python/.pre-commit-config.yaml  ./path-to-your-project/

4. Use sample tests:
  $ make tests
