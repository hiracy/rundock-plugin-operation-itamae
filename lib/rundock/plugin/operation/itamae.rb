require 'itamae'

module Rundock
  module Operation

    # You can use this sample as following scenario.yml for example.
    #
    # - node: anyhost-01
    #     itamae:
    #     - nginx.rb
    #     - /tmp/mysql.rb
    #     - node_json: /tmp/attr.js
    #     - log_level: info
    # ---
    # anyhost-01:
    #   host: 192.168.1.11
    #   ssh_opts:
    #     port: 22
    #     user: anyuser
    #     key:  ~/.ssh/id_rsa
    # ---
    class Itamae < Base
      def run(backend, attributes)
        recipe_files = []
        options = {}
        attributes[:itamae].each do |arg|
          recipe_files << arg if arg.is_a?(String)
          arg.each { |k, v| options[k] = v } if arg.is_a?(Hash)
        end

        unless recipe_files.empty?
          options.merge!(filter_itamae_ssh_opts(attributes[:nodeinfo])) if attributes[:nodeinfo]
          options[:log_level] = 'info' unless options[:log_level]
          options[:color] = true unless options[:color]

          ::Itamae.logger.level = ::Logger.const_get(options[:log_level].upcase)
          ::Itamae.logger.formatter.colored = options[:color]

          if options[:host] == 'localhost' || options[:host] == '127.0.1'
            type = :local
          else
            type = :ssh
          end

          ::Itamae::Runner.run(recipe_files, type, options)
        end
      end

      private

      def filter_itamae_ssh_opts(options)
        opts = {}
        [:host, :user, :key, :port].each { |o| opts[o] = options[o] }
        opts
      end
    end
  end
end
