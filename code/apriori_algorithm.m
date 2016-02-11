function [unique_items,candidate_itemsets,frequent_itemsets] = apriori_algorithm(transactions,min_sup_threshold)
    
transactions = table(num2cell(1:length(transactions))',transactions,'VariableNames',{'Key','Value'});


unique_items = transactions.Value;
[uniqItems,~,idx] = unique([unique_items{:}]');
single_items = table(uniqItems,num2cell(accumarray(idx,1)),'VariableNames',{'Key','Value'});

num_transactions = height(transactions);
single_items(1,:) = [];

%index = find([single_items.Key{:}], '');
 
     
[unique_items,frequent_itemsets] = get_frequent_single_items(single_items,num_transactions,min_sup_threshold);

k = 2;

candidate_itemsets(k).candSets = [];

while true

    new_candidate_itemsets = candidate_generation(frequent_itemsets(k-1).freqSets, k);
 
    [new_frequency_itemsets] = prune_candidates(transactions,new_candidate_itemsets,num_transactions,unique_items,min_sup_threshold);

    if ~isempty(new_frequency_itemsets)
        candidate_itemsets(k).candSets = new_candidate_itemsets;
        frequent_itemsets(k).freqSets = new_frequency_itemsets;
        k = k + 1;
    else
        break;
    end
    
end




end

