class Raxml < Formula
  homepage 'https://github.com/stamatak/standard-RAxML'
  desc 'Phylogenetic Analysis and Post-Analysis of Large Phylogenies'
  url 'https://github.com/stamatak/standard-RAxML/archive/v8.2.8.tar.gz'
  sha256 'a99bd3c5fcd640eecd6efa3023f5009c13c04a9b1cea6598c53daa5349f496b6'
  version '8.2.8'
  
  def install
    if `which icc` =~ /no icc/
      odie 'Please make sure we have icc available for compliation'
    end
    system 'make', '-f', 'Makefile.AVX.gcc', 'CC=icc'
    rm Dir['*.o']
    system 'make', '-f', 'Makefile.AVX.PTHREADS.gcc', 'CC=icc'
    rm Dir['*.o']
    system 'make', '-f', 'Makefile.SSE3.gcc', 'CC=icc'
    rm Dir['*.o']
    system 'make', '-f', 'Makefile.SSE3.PTHREADS.gcc', 'CC=icc'

    %w(AVX PTHREADS-AVX SSE3 PTHREADS-SSE3).each do | ext |
      bin.install "raxmlHPC-#{ext}"
    end
  end
end
