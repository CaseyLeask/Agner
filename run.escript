#!/usr/bin/env escript

main("") ->
    make:all(),
    read_instructions_from_command_line:start();
main(File) ->
    make:all(),
    read_instructions_from_file:start(File).

