class Examl < Formula
  homepage 'https://github.com/stamatak/ExaML'
  desc 'Exascale Maximum Likelihood (ExaML) code for phylogenetic inference using MPI'
  url 'https://github.com/stamatak/ExaML/archive/v3.0.17.tar.gz'
  sha256 '90a859e0b8fff697722352253e748f03c57b78ec5fbc1ae72f7e702d299dac67'
  version '3.0.17'
  
  def install
    if `which mpicc` ~= /no mpicc/
      odie 'Please make sure we have a mpicc available for compliation'
    end
    if `mpicc` !~ /Intel/
      odie 'Expect the Intel mpicc to be available for this buil'
    end

    cd 'examl' do
      system 'make', '-f', 'Makefile.AVX.gcc'
      bin.install 'examl-AVX'
      system 'make','-f', 'Makefile.AVX.gcc', 'clean'

      system 'make', '-f', 'Makefile.SSE3.gcc'
      bin.install 'examl'
    end
  end
end
