# matrix-format-converter
Converts matrices between different formats. 
Currently supports:
1. TI-Nspire formatted matrices -> Pearson MyLab formatted matrices
2. Pearson MyLab formatted matrices -> TI-Nspire formatted matrices
3. aria-label/ctrl+c'd from Pearson -> TI-Nspire formatted matrices
4. TI-Nspire formatted matrices -> MATLAB formatted double matrices 
5. MATLAB double formatted matrices -> TI-Nspire formatted matrices

if you chain conversion commands together you can do multiple conversions in one execution- i.e. 3,4 to convert from Pearson copy directly to matlab. it will still display the intermediate steps though because its just going through a while loop.
