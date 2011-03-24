require 'fileutils'

module Miso
  module Commands
    class UsageError < RuntimeError; end
      
    class New
      def initialize(path, options = {})
        path.nil? && (raise UsageError.new('path not specified'))
        fail("#{path} already exists") if File.exist?(path)
        @path = path
        @options = options
      end

      def template_root
        File.expand_path('../../template', File.dirname(__FILE__))
      end

      def copy_template(src, dest)
        FileUtils.cp(File.join(template_root, src), dest)
      end

      def copy_templates(templates)
        templates.each { |src, dest| copy_template(src, dest) }
      end

      def make_directories
        %w[_app/miso _site].each do |dir|
          FileUtils.mkdir_p(File.join(@path, dir))
        end
      end

      def execute
        make_directories
        templates = {
          'config.ru' => "#{@path}/config.ru",
          'Gemfile' => "#{@path}/Gemfile",
          '_app/miso/config.ru' => "#{@path}/_app/miso/config.ru",
          '_app/miso/miso.erb' => "#{@path}/_app/miso/miso.erb",
          '_site/index.html' => "#{@path}/_site/index.html"
        }
        copy_templates(templates)
      end
    end
  end
end