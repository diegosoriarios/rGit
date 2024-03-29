#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path("../../lib", __FILE__)
require "digest"
require "zlib"
require "rgit/object"

RGIT_DIRECTORY = ".rgit".freeze
INDEX_PATH = "#{RGIT_DIRECTORY}/index"

if !Dir.exists? RGIT_DIRECTORY
    $stderr.puts "Not a RGit project"
    exit 1
end

path = ARGV.first

if path.nil?
    $stderr.puts "No path specified"
    exit 1
end

file_contents = File.read(path)
sha = Digest::SHA1.hexdigest file_contents
blob = Zlib::Deflate.deflate file_contents
object = Rgit::Object.new(sha)

object.write do |file|
    file.print blob
end

File.open(INDEX_PATH, "a") do |file|
    file.puts "#{sha} blob #{path}"
end