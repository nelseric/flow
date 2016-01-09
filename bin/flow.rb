#!/usr/bin/env ruby

require 'pathname'

$bin_dir = Pathname.new(__FILE__).dirname.expand_path
$root = $bin_dir.parent
$lib = $root + 'lib'
$media = $root + 'media'
$maps = $root + 'maps'

$LOAD_PATH.unshift $lib.to_s unless $LOAD_PATH.include? $lib.to_s

def main
  require 'flow_game'
  FlowGame.new.show
end

main if $0 == __FILE__
