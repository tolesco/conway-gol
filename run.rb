require_relative 'boot'
require 'curses'

ALIVE_CHAR  = '█'
DEAD_CHAR   = ' '
FRAME_DELAY = 0.08

Curses.init_screen
Curses.start_color
Curses.noecho
Curses.cbreak
Curses.curs_set(0)
Curses.init_pair(1, Curses::COLOR_GREEN, Curses::COLOR_BLACK)

begin
  rows = Curses.lines - 1
  cols = Curses.cols
  grid = Grid.new(width: cols, height: rows)
  win  = Curses.stdscr
  win.nodelay = true
  generation = 0

  loop do
    rows.times do |y|
      cols.times do |x|
        win.setpos(y, x)
        if grid.cell_at(x, y).live?
          win.attron(Curses.color_pair(1) | Curses::A_BOLD)
          win.addstr(ALIVE_CHAR)
          win.attroff(Curses.color_pair(1) | Curses::A_BOLD)
        else
          win.addstr(DEAD_CHAR)
        end
      end
    end

    status = " Conway's Game of Life  |  Generation: #{generation}  |  Press 'q' to quit "
    win.setpos(rows, 0)
    win.attron(Curses::A_REVERSE)
    win.addstr(status.ljust(cols)[0, cols])
    win.attroff(Curses::A_REVERSE)
    win.refresh

    grid.next_step!
    generation += 1

    sleep FRAME_DELAY
    ch = win.getch
    break if ch == 'q' || ch == 'Q'
  end
rescue Interrupt
ensure
  Curses.close_screen
end
