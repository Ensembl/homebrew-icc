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
      avx_args = ['-f', 'Makefile.AVX.gcc']
      system 'make', *avx_args
      bin.install 'examl-AVX'
      system 'make', *avx_args, 'clean'
      
      sse3_args = ['-f', 'Makefile.SSE3.gcc']
      system 'make', *sse3_args
      bin.install 'examl'
    end
  end
end
