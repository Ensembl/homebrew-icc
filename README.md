
## All icc compiled code is moved to ensembl/ensembl

After investigating compiles and linked libraries it turns out icc was
not being used and homebrew does not allow the linking of external
compilers into its space. So we are abandoning this method.
