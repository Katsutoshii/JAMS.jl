load(filename::String, T::Type=Annotations) = open(filename, "r") do io 
    return JSON2.read(io, T)
end

save(filename::String, obj::Any) = open(filename, "w") do io 
    JSON2.write(io, obj);
end
