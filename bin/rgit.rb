#!/usr/bin/env ruby

command, *args = ARGV

if command.nil?
    $stderr.puts "Usage: rgit <command> [<args>]"
    exit 1
end

path_to_command = File.expand_path("../rgit-#{command}", __FILE__)
if !File.exist? path_to_command
    $stderr.puts "No such command"
    exit 1
end

exec path_to_command, *args