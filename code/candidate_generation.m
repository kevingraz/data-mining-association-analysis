function candidate_itemsets = candidate_generation(frequent_itemsets, k)

    if k == 2
        candidate_itemsets = combnk(frequent_itemsets,2);
    else  
        candidate_itemsets = [];
        num_frequent_itemsets = size(frequent_itemsets,1);
        for i = 1:num_frequent_itemsets
            for j = i+1:num_frequent_itemsets
                check_i = sort(frequent_itemsets(i,1:k-2));
                check_j = sort(frequent_itemsets(j,1:k-2));
                if isequal(check_i,check_j)
                    candidate_itemsets = [candidate_itemsets; union(frequent_itemsets(i,:),frequent_itemsets(j,:))];
                end
            end
        end
    end
end

