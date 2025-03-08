% ti nspire matrix to pearson matrix
% or vice versa
convdir = input("ti -> pear (1), pear -> ti (2), pear copy to ti, (3) or ti -> matlab? (4) ");
matrix = input ("matrix text", "s");
matrix = string(matrix);
if convdir == 1
    matrix = append("@MATX",matrix);
    matrix = replace(matrix,"][","};{");
    matrix = replace(matrix,"[","{");
    matrix = replace(matrix,"]","}");
    matrix = replace(matrix,",",";");
    matrix = replace(matrix,"((−","-@DIV{");
    matrix = replace(matrix,"((","@DIV{");
    matrix = replace(matrix,"))","}");
    matrix = replace(matrix,")/(",";");
    disp(matrix)
elseif convdir == 2
    matrix = replace(matrix,"-@DIV{","@DIV{-");
    mar = split(matrix,"@DIV{");
    msz = size(mar,1)
    i=0;
    while i < msz
        i=i+1;
        splitlog1 = strfind(mar(i),"}};");
        splitlog2 = isempty(splitlog1);
        if splitlog2 
        else
            splout = split(mar(i),"}};");
            splout(1) = replace(splout(1),";","/");
            splout(1) = "(("+splout(1)+"))};";
            mar(i) = splout(1)+splout(2);
        end
    end
    i=0;
    matx = "";
    while i < msz
        i=i+1;
        matx=matx+mar(i);
    end
    matrix = matx;
    matrix = replace(matrix,"@MATX","");
    matrix = replace(matrix,"};{","][");
    matrix = replace(matrix,"{","[");
    matrix = replace(matrix,"}","]");
    matrix = replace(matrix,";",",");
    disp(matrix)
elseif convdir == 3
    matrix = replace(matrix,"left bracket","");
    matrix = replace(matrix,"right bracket","");
    matrix = strip(matrix);
    matrix = split(matrix,["Table ","Matrix "]);
    mdim = matrix(1);
    mdim = replace(mdim,"Start ","");
    mdim = replace(mdim,"by ","");
    mdim = split(mdim," ");
    matrix = matrix(2);
    matrix = replace(matrix,"negative ","-");
    matrix = replace(matrix," Row ","Row");
    matrix = split(matrix," ");
    msz = length(matrix);
    mszf = floor(msz/3);
    i=0;
    nmat="[[";
    while i<mszf
        i=i+1;
        nmat = nmat +matrix(i*3);
        if i ~= mszf
            if round(i/str2double(mdim(3))) == i/str2double(mdim(3))
                nmat = nmat + "][";
            else
                nmat =nmat + ",";
            end
        end
    end
    nmat = nmat + "]]";
    matrix = nmat;
    disp(matrix)
elseif convdir == 4
    matrix = replace(matrix,"][",";");
    matrix = replace(matrix,"]]","]");
    matrix = replace(matrix,"[[","[");
    eval(matrix)
else
    disp("i said 1, 2, 3, or 4 dummy")
end
