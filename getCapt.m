function capt = getCapt (captSize, xCapt, yCapt, thetaCapt)

%regular

%left side
captPt1 = [captSize; captSize; 1];
captPt2 = [-captSize; captSize; 1];
captPt3 = [-3 * captSize; captSize; 1];

%right side
captPt4 = [-3 * captSize; -captSize; 1];
captPt5 = [-captSize; -captSize; 1];
captPt6 = [captSize; -captSize; 1];

%head
captPt7 = [ captSize; -captSize/2; 1]; %right neck
captPt8 = [ 2 *captSize; -captSize/2; 1]; %right top of head
captPt9 = [ 2*captSize; captSize/2; 1]; %left top of head
captPt10 = [ captSize; captSize/2; 1]; %left neck

%hands
captPt11 = [ 0; 2*captSize; 1]; %left
captPt12 = [ 0; -2*captSize; 1]; %right

%spear
captPt13=[ 2*captSize;-2 * captSize; 1]; % spear point
captPt14=[ -captSize; -2*captSize; 1]; % spear end

%net
captPt15=[ 2*captSize; -captSize; 1 ];
captPt16=[ 2*captSize; -3*captSize; 1 ];
captPt17=[ 4*captSize; -captSize; 1 ];
captPt18=[ 4*captSize; -3*captSize; 1 ];

%middle of net
captPt19=[ 3*captSize; -2*captSize; 1 ];
captPt20=[ 3*captSize + 1; -2*captSize + 1; 1 ];

%captain matrix
capt = [ captPt1, captPt2, captPt3, captPt4, captPt5, captPt6, captPt7, captPt8, captPt9, captPt10, captPt11, captPt12, captPt13, captPt14,  captPt15, captPt16, captPt17, captPt18, captPt19, captPt20];

endfunction
