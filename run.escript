#!/usr/bin/env escript

main("") ->
    compile:file("read_instructions_from_command_line.erl"),
    read_instructions_from_command_line:start();
main(File) ->
    compile:file("read_instructions_from_file.erl"),
    read_instructions_from_file:start(File).

