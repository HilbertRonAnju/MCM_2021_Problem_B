clc;
clear;
close all;

figure('Name','map of Puerto Rico');
fnshp_L='Download_Boundary.shx';
infoL = shapeinfo(fnshp_L);
readL = shaperead(fnshp_L);

hold on
mapshow(readL);
plot(Hospital_coord(:,2),Hospital_coord(:,1),'r*');
hold off
title('PolyLine of Puerto Rico');
xlabel('longitude(\circ)');
ylabel('latitude(\circ)');
axis([-67.5,-65.5,-inf,inf]);
legend('hospital location')
set(gca,'FontName','Times New Roman');
grid on
box on

number_hospital = size(Hospital_coord,1);
distance_hospital = zeros(5,5);
for i = 1:number_hospital
    for j = 1:number_hospital
        distance_hospital(i,j) = distance(Hospital_coord(i,1),Hospital_coord(i,2),Hospital_coord(j,1),Hospital_coord(j,2))/180*pi*6371;
    end
end
disp('Distance between each hospital is')
disp(distance_hospital)
save Distance distance_hospital
