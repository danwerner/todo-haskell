# Haskell TODO list manager

A small, very simple TODO list manager in Haskell. It is based on the assignment given in [Learn You A Haskell, Chapter 9](http://learnyouahaskell.com/input-and-output) to demonstrate monadic I/O.

## Prerequisites

A Haskell compiler. Tested with GHC.

## Usage

    $ runhaskell todo.hs add mytodos.txt "Wash the dishes"
    $ runhaskell todo.hs view mytodos.txt
    $ runhaskell todo.hs remove mytodos.txt 1   # removes first todo item on your list

## License

Copyright (C) 2011  Daniel D. Werner

Distributed under the 2-clause BSD License. See the file COPYING.

Based on an excercise in an awesome book by [Miran Lipovača](http://learnyouahaskell.com/).
