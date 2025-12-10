
data "azurerm_resource_group" "rg" {
  name = "cicd-aks-rg"
}

resource "azurerm_service_plan" "plan" {
  name                = "appservice-plan"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "frontend" {
  name                = "frontend-app16"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    application_stack {
      docker_image_name = "kveni16/react-frontend:v1"
      docker_registry_url         = "https://index.docker.io"
      docker_registry_username    = var.dockerhub_user
      docker_registry_password    = var.dockerhub_pass
    }
  }

  app_settings = {
    WEBSITES_PORT = "80"
    DB_HOST       = var.db_host
    DB_USER       = var.db_user
    DB_PASSWORD   = var.db_password
    DB_NAME       = var.db_name
  }
}

resource "azurerm_linux_web_app_slot" "frontend_staging" {
  name           = "staging"
  app_service_id = azurerm_linux_web_app.frontend.id
  

  site_config {
    application_stack {
      docker_image_name = "kveni16/react-frontend:v1"
      docker_registry_url         = "https://index.docker.io"
      docker_registry_username    = var.dockerhub_user
      docker_registry_password    = var.dockerhub_pass
    }
  }

  app_settings = {
    WEBSITES_PORT = "80"
    DB_HOST       = var.db_host
    DB_USER       = var.db_user
    DB_PASSWORD   = var.db_password
    DB_NAME       = var.db_name
  }
}

resource "azurerm_linux_web_app" "backend" {
  name                = "backend-app16"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    application_stack {
      docker_image_name = "kveni16/flask-backend:v1"
      docker_registry_url         = "https://index.docker.io"
      docker_registry_username    = var.dockerhub_user
      docker_registry_password    = var.dockerhub_pass
    }
  }

  app_settings = {
    WEBSITES_PORT = "5000"
    DB_HOST       = var.db_host
    DB_USER       = var.db_user
    DB_PASSWORD   = var.db_password
    DB_NAME       = var.db_name
  }
}


resource "azurerm_linux_web_app_slot" "backend_staging" {
  name           = "staging"
  app_service_id = azurerm_linux_web_app.backend.id
  

  site_config {
    application_stack {
      docker_image_name = "kveni16/flask-backend:v1"
      docker_registry_url         = "https://index.docker.io"
      docker_registry_username    = var.dockerhub_user
      docker_registry_password    = var.dockerhub_pass
    }
  }

  app_settings = {
    WEBSITES_PORT = "5000"
    DB_HOST       = var.db_host
    DB_USER       = var.db_user
    DB_PASSWORD   = var.db_password
    DB_NAME       = var.db_name
  }
}
