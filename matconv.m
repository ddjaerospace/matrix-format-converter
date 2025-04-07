% ti nspire matrix to pearson matrix
% or vice versa
convdir = input("\n1) ti -> pear\n2) pear -> ti\n3) pear copy to ti\n4) ti -> matlab\n5) matlab -> ti\n\nYou can string conversions with commas.","s");
convdirmat = split(convdir,",");
cdml = length(convdirmat);
SirIteratorOfTheKingdomOfMATLAB = 1;
while SirIteratorOfTheKingdomOfMATLAB <= cdml
convdir = str2double(convdirmat(SirIteratorOfTheKingdomOfMATLAB));
if convdir == 1
    if SirIteratorOfTheKingdomOfMATLAB == 1
        matrix = input ("matrix text", "s");
    end
    matrix = string(matrix);
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
    clipboard("copy",matrix);
elseif convdir == 2
    if SirIteratorOfTheKingdomOfMATLAB == 1
        matrix = input ("matrix text", "s");
    end
    matrix = string(matrix);
    matrix = replace(matrix,"-@DIV{","@DIV{-");
    mar = split(matrix,"@DIV{");
    msz = size(mar,1);
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
    clipboard("copy",matrix);
elseif convdir == 3
    if SirIteratorOfTheKingdomOfMATLAB == 1
        matrix = input ("matrix text", "s");
    end
    matrix = string(matrix);
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
    clipboard("copy",matrix);
elseif convdir == 4
    if SirIteratorOfTheKingdomOfMATLAB == 1
        matrix = input ("matrix text", "s");
    end
    matrix = string(matrix);
    matrix = replace(matrix,"][",";");
    matrix = replace(matrix,"]]","]");
    matrix = replace(matrix,"[[","[");
    matrix = eval(matrix)
elseif convdir == 5
    if SirIteratorOfTheKingdomOfMATLAB == 1
        matrix = input ("matrix variable");
    end
    matrix = string(matrix);
    tmat = matrix';
    mszf = size(matrix,1)*size(matrix,2);
    i=0;
    nmat="[[";
    while i<mszf
        i=i+1;
        nmat = nmat+tmat(i);
        if i ~= mszf
            if round(i/size(matrix,2)) == i/size(matrix,2)
                nmat = nmat + "][";
            else
                nmat =nmat + ",";
            end
        end
    end
    nmat = nmat + "]]";
    matrix = nmat;
    disp(matrix)
    clipboard("copy",matrix);
else
    disp("i said 1, 2, 3, 4, or 5 dummy")
end
    SirIteratorOfTheKingdomOfMATLAB=SirIteratorOfTheKingdomOfMATLAB+1;
end
