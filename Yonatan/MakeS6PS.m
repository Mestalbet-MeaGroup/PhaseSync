close all;clear all;
%% First PS Matrix 1 by 1
% h=subplot(1,3,1);
% importfig('KO2PSpre26by26.fig',h);

ha=open('KO2PSpre26by26.fig');
title('Atm -/- 2 Pre NCS 1 by 1 Order');
set(get(gca,'Title'),'FontSize',20,'FontWeight','bold');
set(gca,'FontSize',16,'FontWeight','bold');
set(gca,'YTickLabel',['8 ';'30';'21';'31';'13';'28';'3 ';'4 ';'14';'22';'19';'6 ';'7 ';'5 ';'1 ';'16';'23';'20';'24';'12';'9 ';'10';'29';'25';'18';'26';'2 ';'11';'17';'27';'15']);
set(gca,'XTickLabel',['8 ';'30';'21';'31';'13';'28';' 3';' 4';'14';'22';'19';' 6';'7 ';'5 ';'1 ';'16';'23';'20';'24';'12';'9 ';'10';'29';'25';'18';'26';'2 ';'11';'17';'27';'15']);
set(gca,'PlotBoxAspectRatio',[1 1 1])
%maximize(ha);
% saveas(ha,'S6PS1.tif')
% close all; clear all;
%% Second PS Matrix 2 by 1
% h=subplot(1,3,2);
% importfig('KO2PSpre36by26.fig',h);
hb=open('KO2PSpre36by26.fig');
title('Atm -/- 2 Pre NCS 2 by 1 Order');
set(get(gca,'Title'),'FontSize',20,'FontWeight','bold')
set(gca,'FontSize',16,'FontWeight','bold');
set(gca,'YTickLabel',['8 ';'30';'21';'31';'13';'28';'3 ';'4 ';'14';'22';'19';'6 ';'7 ';'5 ';'1 ';'16';'23';'20';'24';'12';'9 ';'10';'29';'25';'18';'26';'2 ';'11';'17';'27';'15']);
set(gca,'XTickLabel',['8 ';'30';'21';'31';'13';'28';' 3';' 4';'14';'22';'19';' 6';'7 ';'5 ';'1 ';'16';'23';'20';'24';'12';'9 ';'10';'29';'25';'18';'26';'2 ';'11';'17';'27';'15']);
set(gca,'PlotBoxAspectRatio',[1 1 1])
% maximize(hb);
% saveas(hb,'S6PS2.tif')
% close all; clear all;
%% Third PS Matrix 2 by 2
% h=subplot(1,3,3);
% importfig('KO2PSpre36by36.fig',h);
hc=open('KO2PSpre36by36.fig');
title('Atm -/- 2 Pre NCS 2 by 2 Order');
set(get(gca,'Title'),'FontSize',20,'FontWeight','bold')
set(gca,'FontSize',16,'FontWeight','bold');
set(gca,'YTickLabel',['8 ';'30';'21';'31';'13';'28';'3 ';'4 ';'14';'22';'19';'6 ';'7 ';'5 ';'1 ';'16';'23';'20';'24';'12';'9 ';'10';'29';'25';'18';'26';'2 ';'11';'17';'27';'15']);
set(gca,'XTickLabel',['8 ';'30';'21';'31';'13';'28';' 3';'4 ';'14';'22';'19';' 6';'7 ';'5 ';'1 ';'16';'23';'20';'24';'12';'9 ';'10';'29';'25';'18';'26';'2 ';'11';'17';'27';'15']);
set(gca,'PlotBoxAspectRatio',[1 1 1])
colorbar;
cbar = colorbar('Yticklabel', 0.2:0.1:1,'FontSize',20,'FontWeight','bold');
% maximize(hc);
% saveas(hc,'S6PS3.tif')
% close all; clear all;

%% Fourth PS Matrix 3 by 3
% h=subplot(1,3,1);
% importfig('KO2PSpre26by26.fig',h);
hd=open('KO2PSpost23by23.fig');
title('Atm -/- 2 Post NCS 1 by 1 Order');
set(get(gca,'Title'),'FontSize',20,'FontWeight','bold')
set(gca,'FontSize',16,'FontWeight','bold');
set(gca,'YTickLabel',['8 ';'30';'21';'31';'13';'28';'3 ';'4 ';'14';'22';'19';'6 ';'7 ';'5 ';'1 ';'16';'23';'20';'24';'12';'9 ';'10';'29';'25';'18';'26';'2 ';'11';'17';'27';'15']);
set(gca,'XTickLabel',['8 ';'30';'21';'31';'13';'28';' 3';' 4';'14';'22';'19';' 6';' 7';' 5';' 1';'16';'23';'20';'24';'12';' 9';'10';'29';'25';'18';'26';' 2';'11';'17';'27';'15']);
set(gca,'PlotBoxAspectRatio',[1 1 1])
%maximize(hd);
% saveas(hd,'S6PS4.tif')
% close all; clear all;

%% Fourth PS Matrix 4 by 3
% h=subplot(1,3,1);
% importfig('KO2PSpre26by26.fig',h);
he=open('KO2PSpost33by23.fig');
title('Atm -/- 2 Post NCS 2 by 1 Order');
set(get(gca,'Title'),'FontSize',20,'FontWeight','bold')
set(gca,'FontSize',16,'FontWeight','bold');
set(gca,'YTickLabel',['8 ';'30';'21';'31';'13';'28';'3 ';'4 ';'14';'22';'19';'6 ';'7 ';'5 ';'1 ';'16';'23';'20';'24';'12';'9 ';'10';'29';'25';'18';'26';'2 ';'11';'17';'27';'15']);
set(gca,'XTickLabel',['8 ';'30';'21';'31';'13';'28';' 3';' 4';'14';'22';'19';' 6';' 7';' 5';' 1';'16';'23';'20';'24';'12';' 9';'10';'29';'25';'18';'26';' 2';'11';'17';'27';'15']);
set(gca,'PlotBoxAspectRatio',[1 1 1])
%maximize(he);
% saveas(he,'S6PS5.tif')
% close all; clear all;
%% Fourth PS Matrix 4 by 4
% h=subplot(1,3,1);
% importfig('KO2PSpre26by26.fig',h);
hf=open('KO2PSpost33by33.fig');
title('Atm -/- 2 Post NCS 2 by 2 Order');
set(get(gca,'Title'),'FontSize',20,'FontWeight','bold')
set(gca,'FontSize',16,'FontWeight','bold');
set(gca,'YTickLabel',['8 ';'30';'21';'31';'13';'28';'3 ';'4 ';'14';'22';'19';'6 ';'7 ';'5 ';'1 ';'16';'23';'20';'24';'12';'9 ';'10';'29';'25';'18';'26';'2 ';'11';'17';'27';'15']);
set(gca,'XTickLabel',['8 ';'30';'21';'31';'13';'28';' 3';' 4';'14';'22';'19';' 6';' 7';' 5';' 1';'16';'23';'20';'24';'12';' 9';'10';'29';'25';'18';'26';' 2';'11';'17';'27';'15']);
set(gca,'PlotBoxAspectRatio',[1 1 1])
%maximize(hf);
% saveas(hf,'S6PS6.tif')
% close all; clear all;
