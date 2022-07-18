# Conway's Game of Life

Conway's Game of Life implementation in Ruby. Check out the [Wikipedia article](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) for full details about GOL.

## Rules

Extracted from the [Wikipedia article](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life):

> 1. Any live cell with fewer than two live neighbours dies, as if by underpopulation.
> 2. Any live cell with two or three live neighbours lives on to the next generation.
> 3. Any live cell with more than three live neighbours dies, as if by overpopulation.
> 4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

> These rules, which compare the behavior of the automaton to real life, can be condensed into the following:

> 1. Any live cell with two or three live neighbours survives.
> 2. Any dead cell with three live neighbours becomes a live cell.
> 3. All other live cells die in the next generation. Similarly, all other dead cells stay dead.

## Pre-requisites

You will need to have Ruby installed on your system. I recommended you to follow the [GoRails Setup Ruby on Rails Guide](https://gorails.com/setup) for install Ruby language in your system.

## Getting Started

Once you have Ruby properly installed and configured you can make:
```
git clone https://github.com/tolesco/conway-gol.git
cd conway-gol
bundle install
ruby run.rb
```
The Conway's Game of Life simulation should start on your terminal.

## License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.

## Contact

Francisco Rodríguez - [@tolesco](https://github.com/tolesco/) - tolesco@gmail.com
