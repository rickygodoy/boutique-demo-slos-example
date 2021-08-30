###################################################
# Services definition
###################################################

# resource "google_monitoring_custom_service" "frontend" {
#   service_id = "frontend"
#   display_name = "frontend"
#   project = var.project_id
# }

# istio service
data "google_monitoring_cluster_istio_service" "frontend_external" {
    location = var.zone
    cluster_name = var.cluster_name
    service_namespace = var.boutique_namespace
    service_name = "frontend-external"
    project = var.project_id
}

###################################################
# CUJ: Load Home Page
###################################################
# SLI - Home page available
###################################################

resource "google_monitoring_slo" "home_page_available" {
    project = var.project_id
    service = data.google_monitoring_cluster_istio_service.frontend_external.service_id
    slo_id = "availability-slo"
    display_name = "Home Page Available"

    goal = 0.995
    rolling_period_days = 28

    #availability = true

    request_based_sli {
        good_total_ratio {
            # good_service_filter = join(" AND ", [
            #         "metric.type=\"istio.io/service/server/request_count\"",
            #         "resource.type=\"k8s_container\"",
            #         "metric.label.\"destination_service_name\"=\"frontend\"",
            #         "metric.label.\"response_code\"<\"500\"",
            #     ])

            # total_service_filter = join(" AND ", [
            #         "metric.type=\"istio.io/service/server/request_count\"",
            #         "resource.type=\"k8s_container\"",
            #         "metric.label.\"destination_service_name\"=\"frontend\""
            #     ])

            bad_service_filter = join(" AND ", [
                    "metric.type=\"custom.googleapis.com/opencensus/opencensus.io/http/server/response_count_by_status_code\"",
                    "metric.label.\"http_status\" = \"500\"",
                    "resource.type=\"global\"",
                ])

            total_service_filter = join(" AND ", [
                    "metric.type=\"custom.googleapis.com/opencensus/opencensus.io/http/server/response_count_by_status_code\"",
                    "resource.type=\"global\"",
                ])
        }


    }
}


###################################################
# SLI - Home page latency
###################################################


resource "google_monitoring_slo" "home_page_latency" {
    project = var.project_id
    service = data.google_monitoring_cluster_istio_service.frontend_external.service_id
    slo_id = "homepage-latency-slo"
    display_name = "Home Page Latency"

    goal = 0.99
    rolling_period_days = 28

    request_based_sli {
        distribution_cut {
            distribution_filter = join(" AND ", [
                    "metric.type=\"custom.googleapis.com/opencensus/grpc.io/client/roundtrip_latency\"",
                    "resource.type=\"global\"",
            ])
            range {
                max = 500
            }
        }
    }
}