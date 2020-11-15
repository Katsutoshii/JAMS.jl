using JAMS
using Test

function test_contact(;
        filename::String="data/contact.jams",
        contact=JAMS.Contact("Josiah Putman", "joshikatsu@gmail.com"))
    loaded_contact = JAMS.load(filename, JAMS.Contact)
    @test contact == loaded_contact
end

function load_annotation(;
        filename::String="data/annotation.jams")
    loaded_annotation::JAMS.Annotation = JAMS.load(filename, JAMS.Annotation)
    @test loaded_annotation.namespace == "pitch_contour"
end

function load_annotations(;
    filename::String="data/annotations.jams")
    loaded_annotations::JAMS.Annotations = JAMS.load(filename)
    @test loaded_annotation.file_metadata.title == "00_BN1-129-Eb_comp"
end

@testset "Test save/load" begin
    @testset "Test Contact" begin
        test_contact()
    end
    @testset "Test Annotation" begin
        load_annotation()
    end
end
