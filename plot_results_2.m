close all
clear all
% 
data=load(['cu_v1_end.mat']);

cu=squeeze((data.data.Val));
x_ave=squeeze((data.data.X));
y_ave=squeeze((data.data.Y));

x1=x_ave(2,606);
x2=x_ave(581,606);
x_df=x_ave(3,605)-x_ave(2,605);

y1=y_ave(547,2);
y2=y_ave(456,931);

y_df=x_df-0.01;
Xout=[NaN, [x1:x_df:x2], NaN];
Yout=[NaN, [7.129105360030040e+06:x_df-0.05:7.218546590331079e+06], NaN];

mean_cu=cu./nanmax(max(cu));

figure (1)
h=pcolor(mean_cu');
set(h,'edgecolor','none')
c=colorbar;
c.Label.String = 'Ave. Seds';

arcgridwrite('cu_v1.asc',Xout(1:581)',Yout(1:931)',flipud(mean_cu'))

%%
data=load(['cu_v2_188.mat']);

cu=squeeze((data.data.Val));
x_ave=squeeze((data.data.X));
y_ave=squeeze((data.data.Y));

x1=x_ave(2,606);
x2=x_ave(581,606);
x_df=x_ave(3,605)-x_ave(2,605);

y1=y_ave(547,2);
y2=y_ave(456,931);

y_df=x_df-0.01;
Xout=[NaN, [x1:x_df:x2], NaN];
Yout=[NaN, [7.129105360030040e+06:x_df-0.05:7.218546590331079e+06], NaN];

[ind, m]=find(cu<0);

cu(cu < 0) = 0;

mean_cu=cu./nanmax(max(cu));

figure (2)
h=pcolor(mean_cu');
set(h,'edgecolor','none')
c=colorbar;
c.Label.String = 'Ave. Seds';

arcgridwrite('cu_v2.asc',Xout(1:581)',Yout(1:931)',flipud(mean_cu'))

%%
cu_v1_HEV=load(['cu_v1_HEV.mat']);
cu_v1_RAMSAR=load(['cu_v1_RAMSAR.mat']);
cu_v1_UJ=load(['cu_v1_UJ.mat']);

cu_v2_HEV=load(['cu_v2_HEV.mat']);
cu_v2_RAMSAR=load(['cu_v2_RAMSAR.mat']);
cu_v2_UJ=load(['cu_v2_UJ.mat']);

wl_v1_HEV=load(['wl_v1_HEV.mat']);
wl_v1_RAMSAR=load(['wl_v1_RAMSAR.mat']);
wl_v1_UJ=load(['wl_v1_UJ.mat']);

wl_v2_HEV=load(['wl_v2_HEV.mat']);
wl_v2_RAMSAR=load(['wl_v2_RAMSAR.mat']);
wl_v2_UJ=load(['wl_v2_UJ.mat']);

cu_v1_HEV_x=cu_v1_HEV.data.Time;
cu_v1_HEV_y=cu_v1_HEV.data.Val;

cu_v1_RAMSAR_x=cu_v1_RAMSAR.data.Time;
cu_v1_RAMSAR_y=cu_v1_RAMSAR.data.Val;

cu_v1_UJ_x=cu_v1_UJ.data.Time;
cu_v1_UJ_y=cu_v1_UJ.data.Val;

cu_v2_HEV_x=cu_v2_HEV.data.Time;
cu_v2_HEV_y=cu_v2_HEV.data.Val;

cu_v2_RAMSAR_x=cu_v2_RAMSAR.data.Time;
cu_v2_RAMSAR_y=cu_v2_RAMSAR.data.Val;

cu_v2_UJ_x=cu_v2_UJ.data.Time;
cu_v2_UJ_y=cu_v2_UJ.data.Val;

wl_v1_HEV_x=wl_v1_HEV.data.Time;
wl_v1_HEV_y=wl_v1_HEV.data.Val;

wl_v1_RAMSAR_x=wl_v1_RAMSAR.data.Time;
wl_v1_RAMSAR_y=wl_v1_RAMSAR.data.Val;

wl_v1_UJ_x=wl_v1_UJ.data.Time;
wl_v1_UJ_y=wl_v1_UJ.data.Val;

wl_v2_HEV_x=wl_v2_HEV.data.Time;
wl_v2_HEV_y=wl_v2_HEV.data.Val;

wl_v2_RAMSAR_x=wl_v2_RAMSAR.data.Time;
wl_v2_RAMSAR_y=wl_v2_RAMSAR.data.Val;

wl_v2_UJ_x=wl_v2_UJ.data.Time;
wl_v2_UJ_y=wl_v2_UJ.data.Val;


figure(3)
subplot(4,1,1)
plot(wl_v1_HEV_x-datenum(2019,08,11,00,00,00),wl_v1_HEV_y,'k-')
hold on
plot(wl_v1_RAMSAR_x-datenum(2019,08,11,00,00,00),wl_v1_RAMSAR_y,'r-')
plot(wl_v1_UJ_x-datenum(2019,08,11,00,00,00),wl_v1_UJ_y,'b-')
ylabel('Water Level (m)')
subplot(4,1,2)
plot(cu_v1_HEV_x-datenum(2019,08,11,00,00,00),cu_v1_HEV_y./max(cu_v1_HEV_y),'k-')
hold on
plot(cu_v1_RAMSAR_x-datenum(2019,08,11,00,00,00),cu_v1_RAMSAR_y./max(cu_v1_HEV_y),'r-')
plot(cu_v1_UJ_x-datenum(2019,08,11,00,00,00),cu_v1_UJ_y./max(cu_v1_HEV_y),'b-')
axis([-inf inf 0 inf])
%xlabel('Time (Days)')
ylabel('Discharge (-)')




subplot(4,1,3)
plot(wl_v2_HEV_x-datenum(2019,08,11,00,00,00),wl_v2_HEV_y,'k-')
hold on
plot(wl_v2_RAMSAR_x-datenum(2019,08,11,00,00,00),wl_v2_RAMSAR_y,'r-')
plot(wl_v2_UJ_x-datenum(2019,08,11,00,00,00),wl_v2_UJ_y,'b-')
ylabel('Water Level (m)')
subplot(4,1,4)
plot(cu_v2_HEV_x-datenum(2019,08,11,00,00,00),cu_v2_HEV_y./max(cu_v2_HEV_y),'k-')
hold on
plot(cu_v2_RAMSAR_x-datenum(2019,08,11,00,00,00),cu_v2_RAMSAR_y./max(cu_v2_HEV_y),'r-')
plot(cu_v2_UJ_x-datenum(2019,08,11,00,00,00),cu_v2_UJ_y./max(cu_v2_HEV_y),'b-')
axis([-inf inf 0 inf])
xlabel('Time (Days)')
ylabel('Discharge (-)')
legend('HEV','RAMSAR','Urangan Jetty','location','northeast')

exportfig(gcf,'fig_v1','format','jpeg','width',20,'height',30,'resolution',300,'color','cmyk')

%%
% [LAT,LON]=utm2ll(x_ave,y_ave,56);
% %%
% figure(6)
% m_proj('Mercator','lat',[-26.01 -24.4],'long',[152.65 153.6]);
% h2=m_pcolor(LON(1:511,1)',LAT(1,1:1031)',bss_ave');
%set(h, 'EdgeColor', 'none');
% hold on
% m_gshhs_f('patch','k');
%   m_grid('tickdir','out','yaxislocation','right',...
% % 	   'xaxislocation','top','xlabeldir','end','ticklength',.02);
% c=colorbar('location','westoutside','fontsize',12);
% c.Label.String = 'Bss. Ave';