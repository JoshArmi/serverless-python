project = "serverless-python"

app "api" {
    build {
        use "docker" {}

        registry {
            use "docker" {
                image = "gcr.io/josharmi-waypoint/serverless-python"
                tag   = "latest"
            }
        }
    }

    deploy {
        use "google-cloud-run" {
            project  = "josharmi-waypoint"
            location = "europe-west2"

            port = 8080

            capacity {
                memory                     = 128
                cpu_count                  = 1
                max_requests_per_container = 10
                request_timeout            = 300
            }

            auto_scaling {
                max = 1
            }
        }
    }

    release {
        use "google-cloud-run" {}
    }
}
