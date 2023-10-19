function crab = getCrab (s)

if (iscell(s))
  s = cell2mat(s);
endif

%main body
crabPt1 = [s / 2 ;s ;1 ];
crabPt2 = [s / 2 ;-s ;1 ];
crabPt3 = [-s / 2 ;-s ;1 ];
crabPt4 = [-s / 2 ;s ;1 ];

%left legs
crabPt5 = [s/2 ;s*2 ;1 ];
crabPt6 = [0 ;s ;1 ];
crabPt7 = [0 ;s*2 ;1 ];
crabPt8 = [-s ;s*2 ;1 ];

%right legs
crabPt9 = [s/2 ;-s*2 ;1 ];
crabPt10 = [0 ;-s ;1 ];
crabPt11 = [0 ;-s*2 ;1 ];
crabPt12 = [-s ;-s*2 ;1 ];

crab = [crabPt1, crabPt2, crabPt3, crabPt4, crabPt5, crabPt6, crabPt7, crabPt8, crabPt9, crabPt10, crabPt11, crabPt12];

endfunction
