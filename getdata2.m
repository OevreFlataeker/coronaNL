function y = getdata2(countryname, zonename)

thetable = readtable('time_series_19-covid-Confirmed.csv','HeaderLines',1);
countries = thetable(:,2);

countriecell = table2cell(countries);
zonecell = table2cell(thetable(:,1));
myzones = {};
for i = 1:length(countriecell)
    country = countriecell{i};
    zone = zonecell{i};
    if strcmp(string(country),countryname) && strcmp(string(zone),zonename)
        NL = i;
    end
end

%%

dataNL = thetable(NL,5:end);
dataNL = table2array(dataNL);
dataNL = dataNL(1:end); % only get march
y = dataNL;