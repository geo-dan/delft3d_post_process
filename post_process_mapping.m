close all
clear all
%% load files
load dye_nowind_mn.mat
dye=data;

%% Post Processing

x=length(dye.Val(1,:,1));
y=length(dye.Val(1,1,:));

% time_start=zeros(time,1);
% time_end=zeros(time,1);
% res=zeros(time,1);

mean_dye=squeeze(max(dye.Val));

for j=1:x
for k=1:y

data_1=dye.Val(:,j,k);

int=find(dye.Val(:,j,k)>1e-4);

if int>0

time_start(j,k)=min(int);

time_end(j,k)=max(int);

res(j,k)=time_end(j,k)-time_start(j,k);

else
time_start(j,k)=NaN;

time_end(j,k)=NaN;

res(j,k)=NaN;

end
end
end



%% plotting
% close all
figure(1)
subplot(2,2,1)
colormap(jet)
h=pcolor((res/48)');
set(h, 'EdgeColor', 'none');
colorbar
title('res time')
subplot(2,2,2)
h=pcolor((time_start/48)');
set(h, 'EdgeColor', 'none');
colorbar 
title('time start')
subplot(2,2,3)
h=pcolor((time_end/48)');
set(h, 'EdgeColor', 'none');
colorbar
title('time end')
subplot(2,2,4)
h=pcolor((mean_dye/48)');
set(h, 'EdgeColor', 'none');
colorbar
title('mean dye')
%% mapping
close all
x=data.X;
x=squeeze(x);
x=x(:,:,1);
min_x=min(min(x));
max_x=max(max(x));

y=data.Y;
y=squeeze(y);
y=y(:,:,1);
min_y=min(min(y));
max_y=max(max(y));

%% loop test
[m,n]=size(x);

kk=0;
for j=1:m-1
    for k=1:n-1
        x_out(kk+1,:)=x(j,k);
        y_out(kk+1,:)=y(j,k);
        z_out(kk+1,:)=res(j,k);
        kk=kk+1;
    end
end


%% convert back to XY
xp=x_out;
yp=y_out;
zp=z_out;
xp(isnan(zp))=[];
yp(isnan(zp))=[];
zp(isnan(zp))=[];
% yv=min(yp):100:max(yp);
% xv=min(xp):100:max(xp);
xv = linspace(min(xp), max(xp), 1000);
yv = linspace(min(yp), max(yp), 1000);
[X,Y] = meshgrid(xv, yv);
Z = griddata(xp,yp,zp,X,Y);



%% plot Map


%close all
figure(4)
m_proj('utm','lat',[-26 -24.8],'lon',[152.5 153.5],'zon',56)
%[lon,lat]=m_xy2ll(X(1,:),Y(:,1));
[lon,lat]=m_xy2ll(x_out,y_out);
colormap(jet)
%h=m_pcolor(lon,lat,Z/48);
m_scatter(lon,lat,[],z_out/38,'.')
hold on
m_gshhs_h('patch','k');
colorbar
axis([-inf inf -inf inf])


% imrotate
%rotate(h,direction,25)