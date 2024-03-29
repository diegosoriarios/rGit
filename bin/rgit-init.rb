#!/usr/bin/env ruby

RGIT_DIRECTORY=".rgit".freeze
OBJECTS_DIRECTORY = "#{RGIT_DIRECTORY}/objects".freeze
REFS_DIRECTORY = "#{RGIT_DIRECTORY}/refs".freeze

if Dir.exists? RGIT_DIRECTORY
  $stderr.puts "Existing RGit project"
  exit 1
end

def build_objects_directory
  Dir.mkdir OBJECTS_DIRECTORY
  Dir.mkdir "#{OBJECTS_DIRECTORY}/info"
  Dir.mkdir "#{OBJECTS_DIRECTORY}/pack"
end

def build_refs_directory
  Dir.mkdir REFS_DIRECTORY
  Dir.mkdir "#{REFS_DIRECTORY}/heads"
  Dir.mkdir "#{REFS_DIRECTORY}/tags"
end

def initialize_head
  File.open("#{RGIT_DIRECTORY}/HEAD", "w") do |file|
    file.puts "ref: refs/heads/master"
  end
end

Dir.mkdir RGIT_DIRECTORY
build_objects_directory
build_refs_directory
initialize_head

$stdout.puts "RGit initialized in #{RGIT_DIRECTORY}"