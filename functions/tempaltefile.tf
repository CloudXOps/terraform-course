variable "app_config" {
  type = object({
    app_name     = string
    domain       = string
    port         = number
    environment  = string
    app_upstream = string
  })
  default = {
    app_name     = "myapp"
    domain       = "example.com"
    port         = 80
    environment  = "production"
    app_upstream = "http://localhost:3000"
  }
}

# Generate the Nginx config
resource "local_file" "nginx_config" {
  content = templatefile("${path.module}/nginx-app.tpl", {
    port         = var.app_config.port
    domain       = var.app_config.domain
    app_upstream = var.app_config.app_upstream
    environment  = var.app_config.environment
    app_name     = var.app_config.app_name
  })
  filename = "/etc/nginx/sites-available/${var.app_config.app_name}.conf"
}

# Create symlink to enable the site
resource "null_resource" "enable_site" {
  triggers = {
    config_file = local_file.nginx_config.content
  }

  provisioner "local-exec" {
    command = "ln -sf /etc/nginx/sites-available/${var.app_config.app_name}.conf /etc/nginx/sites-enabled/"
  }
}