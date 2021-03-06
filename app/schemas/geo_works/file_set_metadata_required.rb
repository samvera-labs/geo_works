module GeoWorks
  class FileSetMetadataRequired < ActiveTriples::Schema
    property :geo_mime_type, predicate: RDF::Vocab::EBUCore.hasMimeType, multiple: false
    property :geometry_type, predicate: RDF::Vocab::GEOJSON.type, multiple: false
  end
end
