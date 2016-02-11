 function [new_frequent_itemsets] = prune_candidates(transactions,candidate_itemsets,num_transactions,unique_items,min_sup_threshold)

    support = zeros(size(candidate_itemsets,1),1);

    for l = 1 : num_transactions
        indices = find(ismember(unique_items, transactions.Value{l}));
        support(all(ismember(candidate_itemsets,indices),2)) = support(all(ismember(candidate_itemsets,indices),2)) + 1;
    end
    
    support = support./num_transactions;
    new_frequent_itemsets = candidate_itemsets(support >= min_sup_threshold,:);
end
