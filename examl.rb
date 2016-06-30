class Examl < Formula
  homepage 'https://github.com/stamatak/ExaML'
  desc 'Exascale Maximum Likelihood (ExaML) code for phylogenetic inference using MPI'
  url 'https://github.com/stamatak/ExaML/archive/v3.0.17.tar.gz'
  sha256 ''
  version '3.0.17'
  
  def install
    if `mpicc` !~ /Intel/
      odie 'Expect the Intel mpicc to be available for this'
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
