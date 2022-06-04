clc;
clear;
close all;

load DIRTYDATA

dirty_size = dirty_size.* 0.0040469;
max( dirty_size)

temp1 = [];
size1 = [];
hum1 = [];

for i = 1:55367
    if (dirty_temp(i) > 0) && (dirty_temp(i) < 100) && (dirty_size(i)<= 200 ) && (dirty_size(i) > 20 ) 
        temp1 = [temp1;dirty_temp(i)];
        size1 = [size1;dirty_size(i)];
        hum1 = [hum1;dirty_hum(i)];
    end
end
% 
% figure(2)
% % subplot(2,2,1)
% plot(temp1,size1,'k.')    
% % subplot(2,2,2)
% % plot(hum1,size1,'k.')
% figure(3)
% plot(temp1./sqrt(hum1),size1,'k.')

save ANADATA temp1 size1
