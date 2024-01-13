#!/bin/bash

# Function to generate directory tree files
generate_directory_tree() {
  local service_dir="$1"
  
  # Create main.py file
  touch "${service_dir}/src/main.py"
  
  # Create models directory with models.py file
  mkdir -p "${service_dir}/src/models"
  touch "${service_dir}/src/models/models.py"
  
  # Create controllers directory with main_controller.py file
  mkdir -p "${service_dir}/src/controllers"
  touch "${service_dir}/src/controllers/main_controller.py"
  
  # Add other files and directories as needed
  
  echo "Directory tree generated for ${service_dir}"
}

# Main project root directory
main_project_dir="project-root"

# Microservices directory
microservices_dir="${main_project_dir}/microservices"

# Prompt user for microservices names (comma-separated)
microservices_input="microservice1,microservice2"
IFS=',' read -ra microservices <<< "$microservices_input"

# Generate directory tree for each microservice
for service in "${microservices[@]}"; do
  service_dir="${microservices_dir}/${service}"
  generate_directory_tree "${service_dir}"
done

echo "Directory tree generation completed."
