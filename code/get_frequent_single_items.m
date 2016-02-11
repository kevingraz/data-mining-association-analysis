function [unique_items,frequent_itemsets] = get_frequent_single_items(single_items,num_transactions,min_sup_threshold)

    unique_items = single_items.Key;
    count = cell2mat(single_items.Value);
    support = count ./ num_transactions;
    freqSet = find(support >= min_sup_threshold); 
    frequent_itemsets = struct('freqSets',freqSet);
    
end

