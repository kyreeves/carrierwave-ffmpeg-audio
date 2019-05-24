require "carrierwave"
require 'carrierwave/ffmpeg/audio/processor'

module CarrierWave
  module Ffmpeg
    module Audio
      extend ActiveSupport::Concern
      
      module ClassMethods
        def convert options={}
          process convert: [ options ]
        end
  
        def watermark options={}
          process watermark: [ options ]
        end
      end

      def convert options={}
        cache_stored_file! if !cached?
  
        audio_filename = Processor.convert(current_path, options)
        File.rename audio_filename, current_path
        self.file.instance_variable_set(:@content_type, "audio/mpeg3")
      end
  
      def watermark options={}
        cache_stored_file! if !cached?
        
        audio_filename = Processor.watermark(current_path, options)
        File.rename audio_filename, current_path
        self.file.instance_variable_set(:@content_type, "audio/mpeg3")
      end
    end
  end
end
