file = 'kissme_whos';
load([file '.mat']);
name = file;
CMC = [];
nData = size(rank,2);
for i=1:nData
    CMC(i) = rank(i)/100;
end

ER = CMC(1) * nData;
for i=2:nData
    ER = ER + ((CMC(i) - CMC(i-1)) * nData*i);
end
ER = ER/nData;
ER = round(ER,1);
nAUC=trapz(1:nData, CMC)./nData;
nAUC = round(nAUC,2);
save(['Result ' name '.mat'],'ER','nAUC');