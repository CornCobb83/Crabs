function shark = getShark(s)

if (iscell(s))
  s = cell2mat(s);
endif

sharkPt1 = [-2 * s; -s; 1];
sharkPt2 = [-3.75 * s; -s; 1];
sharkPt3 = [-2.5 * s; 0; 1];
sharkPt4 = [-3.75 * s; s; 1];
sharkPt5 = [-2 * s; s; 1];

sharkPt6 = [0; 0.75 * s; 1];
sharkPt7 = [0; -0.75 * s; 1];
sharkPt8 = [-0.25 * s; -0.8 * s; 1];
sharkPt9 = [-0.65 * s; -1.75 * s; 1];
sharkPt10 = [-1.25 * s; -0.85 * s; 1];
sharkPt11 = [-2 * s; -0.5 * s; 1];
sharkPt12 = [-2 * s; 0.5 * s; 1];
sharkPt13 = [-1.8 * s; 0.5 * s; 1];
sharkPt14 = [-1.8 * s; -0.5 * s; 1];
sharkPt15 = [-1.6 * s; -0.5 * s; 1];
sharkPt16 = [-1.6 * s; 0.5 * s; 1];
sharkPt17 = [-s; 0.5 * s; 1];
sharkPt18 = [-0.5 * s; 0; 1];
sharkPt19 = [-s ; -0.5 * s; 1];

%Added these three for other fin
sharkPt25 = [-0.25 * s; 0.8 * s; 1];
sharkPt26 = [-0.65 * s; 1.75 * s; 1];
sharkPt27 = [-1.25 * s; 0.85 * s; 1];

sharkPt20 = [1.5 * s; 0.5 * s; 1];
sharkPt21 = [1.5 * s; -0.5 * s; 1];

sharkPt22 = [2.5 * s; -1.5 * s; 1];
sharkPt23 = [2 * s; 0; 1];
sharkPt24 = [2.5 * s; 1.5 * s; 1];

shark = [sharkPt1, sharkPt2, sharkPt3, sharkPt4, sharkPt5, sharkPt6, sharkPt7, sharkPt8, sharkPt9, sharkPt10, sharkPt11, sharkPt12, sharkPt13, sharkPt14, sharkPt15, sharkPt16, sharkPt17, sharkPt18, sharkPt19, sharkPt20, sharkPt21, sharkPt22, sharkPt23, sharkPt24, sharkPt25, sharkPt26, sharkPt27];

endfunction
