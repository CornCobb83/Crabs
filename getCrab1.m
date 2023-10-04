function crab1 = getCrab1 (crabSize)

crabPt1 = [crabSize; crabSize; 1];
crabPt2 = [-crabSize; crabSize; 1];
crabPt3 = [-3 * crabSize; crabSize; 1];

crabPt4 = [-3 * crabSize; -crabSize; 1];
crabPt5 = [-crabSize; -crabSize; 1];
crabPt6 = [crabSize; -crabSize; 1];

crabPt7 = [ crabSize; -crabSize; 1];
crabPt8 = [ 2 *crabSize; -crabSize; 1];
crabPt9 = [ 2*crabSize; crabSize; 1];
crabPt10 = [ crabSize; crabSize; 1];

%captain matrix
crab1 = [crabPt1, crabPt2, crabPt3, crabPt4, crabPt5, crabPt6, crabPt7, crabPt8, crabPt9, crabPt10];

endfunction
