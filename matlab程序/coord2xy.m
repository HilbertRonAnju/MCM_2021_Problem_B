clc;
clear;
close all;
axesm utm

filename = 'F:\桌面\数据\fire_archive_V1_96617.xlsx';
data = xlsread(filename);

latlon20 = [data(:,1),data(:,2)];
Z = utmzone(latlon20);
setm(gca,'zone',Z)
h = getm(gca);
R = zeros(size(latlon20));

for i=1:length(latlon20)
    [x,y]= mfwdtran(h,latlon20(i,1),latlon20(i,2));    
    R(i,:)=[x;y];    
end

Rs = (R - repmat(min(R),length(R),1))./1000;

figure(1)
plot(Rs(:,1),Rs(:,2),'r.') %在直角坐标下画出这些台站
xlabel('axis x');
ylabel('axis y');

data = data(:,12:13);

save DATA data
save COORD Rs