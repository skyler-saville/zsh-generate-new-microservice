# zsh-generate-new-microservice

## New Microservice Project Script

This script automates the process of generating a new microservice project structure. It helps you quickly set up the directory layout and essential files for your microservices-based project.

## Usage

1. Clone this repository to your local machine:

  ```bash
  git clone <https://github.com/your-username/your-repo.git>
  ```

2. Navigate to the scripts/new-microservice-project/ directory:

  ```bash
  cd your-repo/scripts/new-microservice-project
  ```

3. Run the script:

  ```bash
  bash generate_project_structure.sh
  ```

4. Follow the prompts to enter the project-root directory name, microservice names, and other required information.

### Directory Structure of Generated Projects

```bash
.
├── main-project-root/
│   ├── microservices/
│   │   ├── microservice1/
│   │   │   ├── src/
│   │   │   │   ├── controllers/
│   │   │   │   ├── db/
│   │   │   │   ├── models/
│   │   │   │   ├── routes/
│   │   │   │   ├── schemas/
│   │   │   │   ├── utils/
│   │   │   │   ├── tests/
│   │   │   ├── .gitignore
│   │   │   ├── Dockerfile
│   │   │   ├── LICENSE.md
│   │   │   ├── Makefile
│   │   │   ├── README.md
│   │   │   ├── example.env
│   │   │   ├── requirements.txt
│   │   │   └── bin/
│   │   │       └── setup_venv.sh
│   │   ├── microservice2/
│   │   │   └── ...
│   ├── Dockerfile
│   ├── LICENSE.md
│   ├── Makefile
│   ├── README.md
│   ├── example.env
│   ├── requirements.txt
│   ├── bin/
│   │   └── setup_venv.sh
│   └── version.txt
```

## Setting Up in $HOME/scripts (Optional)

To make it more convenient to run the `generate_project_structure.sh` script from anywhere on your system, you can consider placing the entire project in the `$HOME/scripts` directory and creating an alias.

1. Move the project to the `$HOME/scripts` directory:

    ```bash
    mv path/to/repo-directory $HOME/scripts
    ```

2. Create an alias in your shell configuration file (e.g., `~/.zshrc` for zsh):

    ```bash
    echo 'alias new-microservice="$HOME/scripts/<repo directory name>/bin/generate_project_structure.sh"' >> ~/.zshrc
    ```

    Replace `your-repo` with the actual name of the cloned repository.

3. Restart your terminal or run `source ~/.zshrc` to apply the changes.

Now, you can use the `new-microservice` alias to run the script from any location:

```bash
new-microservice
```

### Notes

- The script allows you to create a main project with multiple microservices, each with its own directory structure.

- Customize the templates in the templates/ directory to fit your project's specific needs.

- Feel free to modify the script to add more features or adapt it to your workflow.

### License

This script is licensed under the MIT License - see the LICENSE.md file for details.

> __You can customize this README template further based on additional details you want to provide or specific instructions for your users.__
