module GeoConcerns
  module VectorBehavior
    extend ActiveSupport::Concern
    include ::CurationConcerns::GenericWorkBehavior
    include ::CurationConcerns::BasicMetadata
    include ::GeoConcerns::BasicGeoMetadata

    included do
      aggregates :metadata_files, predicate: RDF::Vocab::ORE.aggregates,
                                  class_name: 'GeoConcerns::VectorMetadataFile',
                                  type_validator: type_validator
      filters_association :members, as: :vector_files, condition: :concerns_vector_file?
    end

    def concerns_vector?
      true
    end

    def concerns_vector_file?
      false
    end

    def rasters
      aggregated_by.select { |parent| parent.class.included_modules.include?(GeoConcerns::RasterBehavior) }
    end
  end
end
