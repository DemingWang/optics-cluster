close all

datasetNum = 2;

%% clustering para init

if datasetNum == 1
    clusterNum = 2;
    datasetName = 'julei1';
    downsamplerate = 1;
else
    clusterNum = 9;
    datasetName = 'julei2';
    downsamplerate = 5;
end



%% data input 
data = get_variable_via_load(strcat(datasetName,'.mat'));
data = downsample(data,downsamplerate);

order = get_variable_via_load(strcat('order','_',datasetName,'.mat'));
RD_order = get_variable_via_load(strcat('RD_order','_',datasetName,'.mat'));

% order = get_variable_via_load(strcat('order','.mat'));
% RD_order = get_variable_via_load(strcat('RD_order','.mat'));
% RD_order = smooth(RD_order,1500);


%% find peaks to seperate the data
figure;
findpeaks(RD_order,'MinPeakProminence',30,'Annotate','extents')
figure;
bar(RD_order);
hold on;
[PKS,LOCS,widths,proms]= findpeaks(RD_order,'MinPeakProminence',30);
plot(LOCS,PKS,'ro');



if length(PKS) > clusterNum-1
    [PKS_sort,Inx_sort] = sort(proms,'descend');
    PKS_select = PKS(sort(Inx_sort(1:clusterNum-1)));
    LOCS_select = LOCS(sort(Inx_sort(1:clusterNum-1)));
else
    PKS_select = PKS;
    LOCS_select = LOCS;
    clusterNum = length(PKS)+1;
end
plot(LOCS_select,PKS_select,'bo');

if abs(LOCS_select(end)-length(order)) < 0.05*length(order)
    PKS_select(end) = [];
    LOCS_select(end) = [];
    clusterNum = clusterNum -1;
end;

%% label data according to the peaks
label = zeros(size(data,1),1);
label(order(1:LOCS_select(1))) = 1;
label(order(LOCS_select(end):end)) = clusterNum;


plot(LOCS_select,PKS_select,'bo');

if clusterNum > 2
    for i = 2:length(PKS_select)
       label(order(LOCS_select(i-1):LOCS_select(i))) = i;
    end
end

figure('Name','Result');
hold on;

col = rand(clusterNum,3);
for i = 1:clusterNum
   tempdata = data(label == i,:);
   disp(['cluster',num2str(i), ' points num: ',num2str(size(tempdata,1))]);
   plot(tempdata(:,2),tempdata(:,1),'.','color',col(i,:));
end


% function val = get_variable_via_load(filepath)
% if(exist(filepath,'file') == 2)
%     var_struct = load(filepath);
%     namecell = fieldnames(var_struct);
%     val = getfield(var_struct,char(namecell));
% elseif(exist(filepath,'file') == 0)
%     msgbox('File not exist!!','Error','Error');
% end
% 
% end