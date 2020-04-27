function headercell = getheader()
% get the header line as strings

fileid = fopen('time_series_covid19_confirmed_global.csv','r');
content = fscanf(fileid,"%s");
fclose(fileid);
[content2,matches] = split(content,',');
headercell = cell2table(content2);




