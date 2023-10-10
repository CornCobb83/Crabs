function pCrab = getPCrab (s)

%main body
pCrabPt1 = [s / 2 ;s ;1 ];
pCrabPt2 = [s / 2 ;-s ;1 ];
pCrabPt3 = [-s / 2 ;-s ;1 ];
pCrabPt4 = [-s / 2 ;s ;1 ];

%left legs
pCrabPt5 = [s/2 ;s*2 ;1 ];
pCrabPt6 = [0 ;s ;1 ];
pCrabPt7 = [0 ;s*2 ;1 ];
pCrabPt8 = [-s ;s*2 ;1 ];

%right legs
pCrabPt9 = [s/2 ;-s*2 ;1 ];
pCrabPt10 = [0 ;-s ;1 ];
pCrabPt11 = [0 ;-s*2 ;1 ];
pCrabPt12 = [-s ;-s*2 ;1 ];

%parachute
pCrabPt13 = [s / 2 ;0 ;1 ];
pCrabPt14 = [(s*3) / 2 ;-2 * s ;1 ];
pCrabPt15 = [s * 2 ;-s ;1 ];
pCrabPt16 = [s * 2 ;s ;1 ];
pCrabPt17 = [(s*3) / 2 ;2 * s ;1 ];

pCrab = [pCrabPt1, pCrabPt2, pCrabPt3, pCrabPt4, pCrabPt5, pCrabPt6, pCrabPt7, pCrabPt8, pCrabPt9, pCrabPt10, pCrabPt11, pCrabPt12, pCrabPt13, pCrabPt14, pCrabPt15, pCrabPt16, pCrabPt17];

endfunction
