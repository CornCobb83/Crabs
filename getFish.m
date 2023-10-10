function fish = getFish (s)

%main body
fishPt1 = [s; 0 ;1 ];
fishPt2 = [(s*3)/4; -s/2 ;1 ];
fishPt3 = [(-s*3)/4 ;-s/2 ;1 ];
fishPt4 = [-s ;0 ;1 ];
fishPt5 = [(-s*3)/4 ;s/2 ;1 ];
fishPt6 = [(s*3)/4 ;s/2 ;1 ];
fishPt7 = [-s*2 ;s/2 ;1 ];
fishPt8 = [-s*2 ;-s/2 ;1 ];

fish = [fishPt1, fishPt2, fishPt3, fishPt4, fishPt5, fishPt6, fishPt7, fishPt8];

endfunction
