file = {'ELF-KISSME';'gbiCov-KISSME';'LOMO-KISSME';'WHOS-KISSME'};


for i=1:size(file,1)
    load([file{i} '.mat']);
    CMC = [];
    nData = size(rank,2);
    
    nAUC=trapz(1:nData, rank)./nData;
    file{i} = [file{i}, ' ', num2str(round(nAUC,2)), '%'];
    
    for i=1:nData
        CMC(i) = rank(i)/100;
    end
    
    hold on;
    plot(CMC);
    hold off;
end
legend(file,'Location','SouthEast');