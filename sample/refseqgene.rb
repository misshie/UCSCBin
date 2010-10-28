#!/usr/local/bin/ruby
#
# = refseqgene.rb, an UCSCBin sample
# Author:: Hiroyuki Mishima ( missy at be.to / hmishima at nagasaki-u.ac.jp )
# Copyright:: Hiroyuki Mishima, 2010
# Licence:: the MIT/X11 licence. See the LICENCE file.
# Usage:: refseqgene chr1:12345-23456
# 

DB_URL = "mysql://genome:@genome-mysql.cse.ucsc.edu/hg18"

require 'rubygems'
require 'UCSCBin'
require 'sequel'

chr, one_start, one_end = ARGV[0].chomp.split(/:|-/)

zero_start, zero_end = 
  UCSCBin::Utils.one_to_zero(one_start.to_i, one_end.to_i)
bins = UCSCBin::BinRange.bin_all(zero_start, zero_end)

db = Sequel.connect(DB_URL)
dset = db[:refGene].select(:name2)
dset = dset.filter(:chrom => chr)
dset = dset.filter(:bin => bins)
dset = dset.exclude do |o|
  ((o.txStart < zero_start) & (o.txEnd < zero_start)) |
  ((o.txStart > zero_end) & (o.txEnd > zero_end))
end

genes = dset.all.map{|hit| hit[:name2]}.uniq
genes = ["no hit"] if genes.empty?

puts "#{chr}:#{one_start}-#{one_end}\t#{genes.join("; ")}"

