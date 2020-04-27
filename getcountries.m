function countriecell = getcountries()
% get all available countries

thetable = readtable('time_series_covid19_confirmed_global.csv','HeaderLines',1);
countries = thetable(:,2);

countriecell = table2cell(countries);
countriecell = unique(countriecell); 



