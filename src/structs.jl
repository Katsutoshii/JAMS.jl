@with_kw struct Contact
    name::String = ""
    email::String = ""
end
JSON2.@format Contact keywordargs

@with_kw struct AnnotationMetadata
    corpus::String = ""
    curator::Contact = Contact()
    annotator::Contact = Contact()
    version::String = ""
    annotation_tools::String = ""
    annotation_rules::String = ""
    validation::String = ""
    data_source::String = ""
end
JSON2.@format AnnotationMetadata keywordargs

@with_kw struct AnnotationValue
    voiced::Bool = false
    index::Int64 = 0
    frequency::Float64 = 0
end
JSON2.@format AnnotationValue keywordargs

@with_kw struct AnnotationData
    time::Array{Float64}
    duration::Array{Float64}
    value::Array{AnnotationValue}
    confidence::Array{Union{Float64,Nothing}}
end
JSON2.@format AnnotationData keywordargs

@with_kw struct Annotation
    annotation_metadata::AnnotationMetadata = AnnotationMetadata()
    namespace::String = ""
    data::AnnotationData = AnnotationData()
    sandbox::Dict = Dict()
    time::Float64 = 0
    duration::Float64 = 0
end
JSON2.@format Annotation keywordargs

@with_kw struct FileMetadata
    title::String = ""
    artist::String = ""
    release::String = ""
    duration::Float64 = 0
    identifiers::Dict = Dict()
    jams_version::String = ""
end
JSON2.@format FileMetadata keywordargs

@with_kw struct Annotations
    annotations::Array{Annotation}
    file_metadata::FileMetadata
    sandbox::Dict = Dict()
end
JSON2.@format Annotations keywordargs
