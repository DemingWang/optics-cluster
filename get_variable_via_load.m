function val = get_variable_via_load(filepath)
if(exist(filepath,'file') == 2)
    var_struct = load(filepath);
    namecell = fieldnames(var_struct);
    val = getfield(var_struct,char(namecell));
elseif(exist(filepath,'file') == 0)
    msgbox('File not exist!!','Error','Error');
end

end
