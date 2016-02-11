% Loads gene data from mat file
load('gene_data.mat');
 
gene_data_transactions = cell(length(genedatatransaction(:,1)),1);

% Places gene data into cell format
for i = 1 : length(genedatatransaction(:,1));
    gene_data_transactions(i,1)={genedatatransaction(i,:)};
end

% Performs apriori algorithm on gene data and returns unique items,
% candidate itemsets, and frequent itemsets
[unique_items,candidate_itemsets,frequent_itemsets] = apriori_algorithm(gene_data_transactions,.5);

% Displays candidate and frequent itemsets from gene data
disp('Candidate Itemsets C2 and C3');
C2 = [];
for j = 1 : length(candidate_itemsets(2).candSets(:,1));
    C2 = [ C2; unique_items(candidate_itemsets(2).candSets(j,1:2))' ];
end   
disp(C2);

C3 = [];
for j = 1 : length(candidate_itemsets(3).candSets(:,1));
    C3 = [ C3; unique_items(candidate_itemsets(3).candSets(j,1:3))' ];
end   
disp(C3);

disp('Frequency Itemsets L1 L2 and L3');
L1 = [];
for j = 1 : length(frequent_itemsets(1).freqSets(:,1));
    L1 = [ L1; unique_items(frequent_itemsets(1).freqSets(j,1))' ];
end   
disp(L1);

L2 = [];
for j = 1 : length(frequent_itemsets(2).freqSets(:,1));
    L2 = [ L2; unique_items(frequent_itemsets(2).freqSets(j,1:2))' ];
end   
disp(L2);

L3 = [];
for j = 1 : length(frequent_itemsets(3).freqSets(:,1));
    L3 = [ L3; unique_items(frequent_itemsets(3).freqSets(j,1:3))' ];
end   
disp(L3);
