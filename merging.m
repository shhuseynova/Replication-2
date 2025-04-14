share2 = readtable('merged_va_gdl_with_share2.xlsx');
lgexpv = readtable('groupedimp_with_logexport_variety.xlsx');
dst = readtable('filtered_distanced_bycc.xlsx');
share2_subset = share2(:, {'Country_Name', 'Country_Code', 'GDPDeflator', 'Labor', 'Share'});
merged_shev = outerjoin(lgexpv, share2_subset, ...
    'Keys', 'Country_Name', ...
    'MergeKeys', true, ...
    'Type', 'left');  
writetable(merged_shev, 'merged_shares_and_ev.xlsx');
fm_sevd = outerjoin(merged_shev, dst(:, {'Country_Code', 'dist'}), ...
    'Keys', 'Country_Code', ...
    'MergeKeys', true, ...
    'Type', 'left');  
writetable(fm_sevd, 'shev_with_distance.xlsx');
