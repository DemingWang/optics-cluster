% Brief Demo to Visualise Optics Results
clc;
clear;
close all;
datasetNum = 2;
%% Init
if datasetNum == 1
    datasetName = 'julei1';
    downsamplerate = 1;
else
    datasetName = 'julei2';
    downsamplerate = 5;
end
%% 
data = get_variable_via_load(strcat(datasetName,'.mat'));
datanumber = length(data);
data = downsample(data,downsamplerate);
% set minpts and epsilon
minpts = round(datanumber/160/downsamplerate);
epsilon = 20;

plot(data(:,1),data(:,2),'.');
[ SetOfClusters, RD, CD, order ] = cluster_optics(data, minpts, epsilon);

RD_order = RD(order);
CD_order = CD(order);
figure;
bar(RD_order);
hold on;


save('RD_order.mat','RD_order');
save('order.mat','order');
save('CD_order.mat','CD_order');

run('findClustersFromRD.m');

