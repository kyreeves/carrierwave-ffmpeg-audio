require "carrierwave"
require 'carrierwave/ffmpeg/audio/processor'

module Carrierwave
  module Ffmpeg
    module Audio
      module ClassMethods
        extend ActiveSupport::Concern
  
        def convert
          process :convert
        end
  
        def watermark
          process :watermark
        end
      end

      def convert
        cache_stored_file! if !cached?
  
        audio_filename = Processor.convert(current_path)
        File.rename audio_filename, current_path
        self.file.instance_variable_set(:@content_type, "audio/mpeg3")
      end
  
      def watermark
        cache_stored_file! if !cached?
        
        audio_filename = Processor.watermark(current_path)
        File.rename audio_filename, current_path
        self.file.instance_variable_set(:@content_type, "audio/mpeg3")
      end
    end
  end
end
