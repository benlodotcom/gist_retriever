#!/usr/bin/env rake
require "bundler/gem_tasks"

task :default => :test

# ==========================================================
# Testing
# ==========================================================

require 'rake/testtask'
Rake::TestTask.new 'test' do |t|
  t.test_files = FileList['test/test_*.rb']
  t.ruby_opts = ['-rubygems']
end