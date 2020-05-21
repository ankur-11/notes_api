include Swagger::Docs::ImpotentMethods

class Swagger::Docs::Config
  def self.transform_path(path, api_version)
    # Make a distinction between the APIs and API documentation paths.
    "docs/#{path}"
  end
end

Swagger::Docs::Config.register_apis({
  '1.0' => {
    controller_base_path: '',
    api_file_path: 'public/docs',
    base_path: ENV['HOST'],
    clean_directory: true
  }
})
