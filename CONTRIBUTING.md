# contributing to mocha
- make a pull request!
- if your pull request is accepted, you will be added to the mocha plugin credits

## 0. prerequisites
- you need [pesde](https://pesde.dev/) and [rokit](https://github.com/rojo-rbx/rokit) (for packages and tools respectively!)
- you need a github account!

## 1. getting started
- clone the mocha repository
- install rokit tools by running `rokit install` in a terminal
- install pesde packages by running `lune run repkg` in a terminal
- install the rojo plugin by running `rojo plugin install` in a terminal
- serve the mocha plugin via rojo by running `lune run serve` in a terminal

## 2. making changes
- i recommend using these extensions:
  - luau language server
  - selene
  - stylua
- if you're editing a script, feel free to add yourself to the credits.
- if you make a new script, please add the script info (name, class, authors, etc) to the top!

## 2.1. notices
- pull requests may be rejected for:
  - too many critical changes
  - introducing breaking changes for elsewhere in mocha (without addressing them first)