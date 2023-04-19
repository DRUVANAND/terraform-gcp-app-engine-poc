resource "google_app_engine_application" "app" {
  project     = "engineer-cloud-nprod"
  location_id = "us-central1"

  # The following settings are required for the Hello World app
  database_type = "CLOUD_DATASTORE_COMPATIBILITY"
  feature_settings {
    split_health_checks = false
  }
}

resource "google_app_engine_standard_app_version" "version" {
  project = "engineer-cloud-nprod"
  service = "default"
  runtime = "nodejs14"

  # The following settings are required for the Hello World app
  entrypoint = "node app.js"
  deployment {
    files {
      "app.yaml" = <<-YAML
        runtime: nodejs14
        handlers:
          - url: /.*
            script: auto
        YAML
      "app.js" = <<-JS
        const http = require('http');
        const port = process.env.PORT || 8080;
        const server = http.createServer((req, res) => {
          res.statusCode = 200;
          res.setHeader('Content-Type', 'text/plain');
          res.end('Hello, World!');
        });
        server.listen(port, () => {
          console.log(`Server running on port ${port}`);
        });
        JS
    }
  }
}
