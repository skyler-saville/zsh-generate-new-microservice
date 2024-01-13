#!/bin/bash

# Function to prompt user for input with a default value
prompt_user() {
  local prompt_message="$1"
  local default_value="$2"
  read -p "${prompt_message} (default: ${default_value}): " user_input
  echo "${user_input:-$default_value}"
}

# Function to copy template files to microservice directory
copy_template_files() {
  local service_dir="$1"
  cp -r "${templates_dir}/." "${service_dir}"
}

# Function to generate directory tree using generate_directory_tree.sh
generate_directory_tree() {
  local service_dir="$1"
  bash generate_directory_tree.sh "${service_dir}"
}

# Main project root directory
main_project_dir=$(prompt_user "Enter the project-root directory name" "project-root")

# Check if the user wants to create microservices
read -p "Do you want to create microservices? (y/n): " create_microservices
if [ "$create_microservices" = "y" ]; then
  # Microservices directory
  microservices_dir="${main_project_dir}/microservices"

  # Array to store microservices
  microservices=()

  # Loop to interactively ask if the user wants to add a new microservice
  while true; do
    read -p "Do you want to add a new microservice? (y/n): " add_microservice
    case $add_microservice in
      [Yy]* )
        # Ask for microservice name in kabob case
        microservice_name=$(prompt_user "Enter the microservice name in kabob case (e.g., my-service)" "new-microservice")
        microservices+=("$microservice_name")
        ;;
      [Nn]* )
        break
        ;;
      * )
        echo "Please answer 'y' or 'n'."
        ;;
    esac
  done

  # If there are existing microservices, prompt for their names
  if [ "${#microservices[@]}" -eq 0 ]; then
    # Prompt user for microservices names (comma-separated)
    microservices_input=$(prompt_user "Enter microservice names (comma-separated)" "microservice1,microservice2")
    IFS=',' read -ra microservices <<< "$microservices_input"
  fi

  # Create main project root directory
  mkdir -p "${main_project_dir}" || { echo "Error: Unable to create ${main_project_dir} directory."; exit 1; }

  # Create microservices directory
  mkdir -p "${microservices_dir}" || { echo "Error: Unable to create ${microservices_dir} directory."; exit 1; }

  # Create microservices subdirectories and copy template files
  for service in "${microservices[@]}"; do
    service_dir="${microservices_dir}/${service}"
    mkdir -p "${service_dir}/src/controllers" "${service_dir}/src/db" "${service_dir}/src/middlewares" \
      "${service_dir}/src/models" "${service_dir}/src/routes" "${service_dir}/src/schemas" "${service_dir}/src/utils" \
      "${service_dir}/tests" || { echo "Error: Unable to create ${service_dir} directory."; exit 1; }
    copy_template_files "${service_dir}"
    generate_directory_tree "${service_dir}"
  done
fi

# Create main project files
touch "${main_project_dir}/Dockerfile" "${main_project_dir}/LICENSE.md" "${main_project_dir}/Makefile" \
  "${main_project_dir}/README.md" "${main_project_dir}/example.env" "${main_project_dir}/requirements.txt" \
  "${main_project_dir}/bin/setup_venv.sh" "${main_project_dir}/version.txt" "${main_project_dir}/.gitignore"

echo "Project structure generated successfully."
