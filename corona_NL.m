clear all;
close all;
clc;

the_markersize = 20;
the_linewidth = 3;

zones = getzones('Netherlands');
y = getdata2('Netherlands', 'Netherlands');
y = y(40:end); % only march

t = 1:length(y);

fh = figure;

skip = 5;
t = t(skip:end);
y = y(skip:end);

X = [t',ones(size(t'))];
Y = log10(y');

beta = inv(X'*X)*X'*Y;

mylim = 20;
tfar = [(1:mylim)',ones(mylim,1)];
ypred = tfar*beta;
ypred2 = 10.^ypred;

hold on;
plot(1:mylim,ypred2,':','DisplayName','Netherlands Fit');

plot(t,y,'.','MarkerSize',the_markersize,'DisplayName','Netherlands');

numbers = get(gca,'XTick');

max_x = max(numbers);
setnumbers = 1:5:max_x;
%setnumbers = [1,4,7,9,13,16];
setnumbers = 1:2:19;

dates = datetime(2020,3,setnumbers);

mylabels = datestr(dates,'dd mmmm');

set(gca,'XTick',setnumbers)

xlabels_dates = cell(size(mylabels,1));
for i = 1:length(xlabels_dates)
    %xlabels_dates{i} = mylabels(i,:);
    xlabels_dates{i} = sprintf('%d',setnumbers(i));
end

xlabel('March')

set(gca,'XTickLabel',xlabels_dates)


the_exponent = 10.^beta(1);
the_factor = 10.^beta(2);
the_function = the_exponent.^tfar(:,1) * 10.^beta(2);

double_time = 1/beta(1);
fprintf('every %.1f days the amount of infections grows by a factor 10\n',log(10)/log(the_exponent))
fprintf('every %.1f days the amount of infections grows by a factor 2\n',log(2)/log(the_exponent))

grid on

title('Corona in Netherlands')

y_italy = getdata2('Italy','');
timeshift = 12;
plot(y_italy((40-12):45),'.','DisplayName','Italy','MarkerSize',the_markersize,'DisplayName',sprintf('Italy %d days earlier',timeshift));

legend();