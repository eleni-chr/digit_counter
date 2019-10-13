function digits = digit_counter(filename)

% The function takes the name of a text file as input and returns the number
% of digits (i.e., any of the characters 0 to 9) that the file contains.
% If there is a problem opening the file, the function returns -1.

fid=fopen(filename, 'rt');
if fid < 0
   digits=-1;
   return;
end
oneline = fgets(fid);
cumsum=0;
while ischar(oneline)
    logicals=isstrprop(oneline,'digit');
    cumsum=cumsum+sum(logicals);
    oneline = fgets(fid);
end
digits=cumsum;
fclose(fid);