require 'fastlane/action'
require_relative '../helper/appbox_uploadipa_helper'

module Fastlane
  module Actions
    module SharedValues
      IPA_OUTPUT_PATH = :path
    end
    class AppboxUploadipaAction < Action
      def self.run(params)
        # UI.message("The appbox_uploadipa plugin is working!")
        if params[:path]
          path = params[:path]
          Actions.lane_context[SharedValues::IPA_OUTPUT_PATH] = path
          UI.message("Path - #{path}")
        end
      end

      def self.description
        "Uploading ipa file to Appbox"
      end

      def self.authors
        ["eskaseptian"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Uploading specified IPA file to Appbox"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "APPBOX_UPLOADIPA_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)

          FastlaneCore::ConfigItem.new(key: :path,
                                       env_name: "IPA_OUTPUT_PATH",
                                       description: "If you've setup AppBox in the different directory then you need to mention that here. Default is '/Applications/AppBox.app'",
                                       optional: false),
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        [:ios].include? platform
      end
    end
  end
end
