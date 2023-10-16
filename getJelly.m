function jelly = getJelly (s)

pt1=[-7*s;s;1];
pt2=[-5*s;s;1];
pt3=[-3*s;-2*s;1];
pt4=[-s;s;1];
pt5=[s;s;1];

pt6=[-9*s;-2*s;1];
pt7=[-5*s;0;1];
pt8=[-3*s;-s;1];
pt9=[-s;0;1];

pt10=[-5*s;-s;1];
pt11=[-3*s;-2*s;1];
pt12=[-s;-s;1];
pt13=[s;-s;1];

jelly = [pt1, pt2, pt3, pt4, pt5, pt6, pt7, pt8, pt9, pt10, pt11, pt12, pt13];

endfunction
