# Mastering RobotCode and robot.toml: Best Practices in Real-Life Robot Framework Projects

[![Pipeline Status](https://github.com/robotcodedev/rbcn25-mastering-robotcode/actions/workflows/run_tests.yml/badge.svg)](https://github.com/robotcodedev/rbcn25-mastering-robotcode/actions/workflows/run_tests.yml)
[![Robotframework Report](https://img.shields.io/badge/Robotframework%20Report-00C0B5)](https://robotcodedev.github.io/rbcn25-mastering-robotcode/public/reports/report.html)
[![Robotframework Log](https://img.shields.io/badge/Robotframework%20Log-00C0B5)](https://robotcodedev.github.io/rbcn25-mastering-robotcode/public/reports/log.html)

How to master **RobotCode Extension** and Command Line Tools in real-life Robot Framework projects.

![Robotcode Logo](robotcode-logo.svg)

This workshop covers installation, setup, project structuring, python project managers, `robot.toml` configuration, key features, utilizing CLI tools, integrating CI/CD processes, and collaborating with distributed teams.

## Workshop Overview

This workshop offers an in-depth introduction to the RobotCode Extension and Command Line Tools, focusing on their practical application in real-life Robot Framework projects.

Participants will gain hands-on experience and learn best practices to enhance their test automation workflows.

## Key Topics

1. **Installation of RobotCode:**
   - Step-by-step guide to installing the RobotCode Extension and CLI tools.
   - Install the VSCode extension and create your python `.venv`.

2. **Project Setup with RobotCode:**
   - Creating a new example project.
     - Create virtual python environments to separate system interpreter and development venv.
       - This helps with different projects regarding different dependencies.
       - Separation of projects.
     - Creating a `requirements.txt` with all project dependencies.
       - Put the project's dependencies into it.
     - `robotframework-tidy` helps with linting your project.
     - `Developer: Reload Window` after installing `.venv` for RobotCode to get the new environment.
     - `Log` vs. `Log To Console`
       - Log is preferred as you have everything in one place (Debug Console).
   - Configuring the project environment and RobotCode settings.
     - Debug Settings:
       - `Debug: Group Output` helps with more debug information
         - `"robotcode.debug.groupOutput": true,`
       - `Debug: Output Timestamps` shows you the execution timestamps
         - `"robotcode.debug.outputTimestamps": true`
       - Put the Debug Settings in the `.vscode/settings.json` for local settings.
         - Comment in the settings for overwriting them quickly.
       - `"robotcode.run.openOutputAfterRun": "log"` if you want to auto open the log/report after each run.
       - Debug Python Code:
         - `"robotcode.debug.attachPython": true`
   - Devcontainer:
     - Helps with creating a standardized environment with fixed versions for testers/developers to have the same environment.
     - Make ports public if you want to display `log.html` and it does not work out of the box.
   - Debugging Tips:
     - Use Variable Scopes.
     - Change Variable Values in the debug menu by overwriting them.
     - In the Debug Console, you can use Robot Framework Keywords from Commandline.
     - In Debug watches, you can add expressions.
     - `#exprmode` enables/disables python expression mode (toggle).
     - Use the breakpoint toggles to enable different breakpoint modes.
   - Features:
     - Find Library Keywords by typing `LibraryName` + `.` and scroll the keywords.
     - Variables are sorted by the distance in autocompletion.
       - Local scope is closest, then Suite scope, then global scope.
     - Explorer View:
       - Select `Keywords` Dropdown.
       - View Keyword-Documentation.
       - Insert Keywords or Drag & Drop them.
       - Search within Library-Keywords (F3).
     - Debug Logs:
       - RobotCode Log: Logging of RobotCode Details.
       - RobotCode Language Server Log: Logging of Language Server Details.
         - Helps with your own debugging or reporting issues with detailed information.
   - Structuring the project for scalability and maintainability.
     - Simple Projects:
       - Create a `/resources` directory with `*.resource` files for Robot Framework Keywords.
         - This will add `/resources` to the PYTHON_PATH.
       - Create a `/lib` directory with `*.py` files for python keywords.
         - This will add `/lib` to the PYTHON_PATH.
       - This way you can add `.resource` and `.py` keyword files **without** using the absolute file path.
       - When using different folder names/structures for your project, you need to add the folder paths to your PYTHON_PATH for usage without the full directory path.
       - TIP: Use `settings.json` for your personal local changes and do not commit to your Git-Repo!
         - These settings are for your personal preference.
       - Enable/Disable "RobotCode Play Buttons" -> Settings-RobotCode-Test Explorer-Enable/Disable.
   - Using Python project managers for efficient dependency management.
     - Project managers help you with:
       - Managing dependencies.
       - Managing execution and development environments.
       - Creating virtual environments.
       - EXAMPLE: [hatch](https://hatch.pypa.io/latest/)
         - Follows the PEP standard.
         - Gives you the opportunity to create test matrices to e.g. run multiple virtual environments in parallel.
   - Best practices in project setup and organization.
     - Use a python package manager to organize your project and set it up in a standardized way.
     - Integrate [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) for versioning your project and automatically create a `Changelog.md`.

3. **Exploring RobotCode Features:**
   - Overview of general features that enhance productivity.
     - RobotFramework Notebook:
       - File -> New File -> RobotFramework Notebook.
       - First Version included in VSCode supporting `*.robot` Files and Markdown.
       - Uses the REPL, so there are no `*** Settings ***` or `*** Variables ***` sections.
       - Helping with Business Analyst Files such as RPA procedures.
     - Robotcode REPL (Read-Evaluate-Print-Loop):
       - Install (if not yet): `pip install robotcode-repl`.
       - In CLI: use `robotcode repl`.
       - Type Keywords and Expressions that are directly evaluated.
   - Introduction to new and advanced features.

4. **Using `robot.toml` Configuration:**
   - Understanding general configuration settings.
     - `robot.toml` supports all possible configurations from [toml.io](https://toml.io/en/).
     - Helps with interaction towards Robot Framework through its CLI API.
     - **Every** CLI argument from Robot Framework has a configuration analog in `robot.toml`.
     - There are different ways of defining values in the toml file.
   - Creating configuration profiles for different environments.
     - `robotcode config files` shows you all the `robot.toml` configuration files.
     - `robot.toml` files exist for the user space and project space.
       - Settings in the project space overwrite user space and local space overwrites project space.
     - All configurations for Python = `pyproject.toml`.
     - All configurations for Robot Framework = `robot.toml`.
     - Local Configuration for overwriting `robot.toml` = `.robot.toml`.
       - This file is not meant to be pushed to Git.
     - Hierarchy of the files:
       - Default user space.
       - Project space.
       - Local space.
     - `robotcode config root` gives you the root directory, which is dependent on the position of the `robot.toml` file.
     - `robotcode config info` gives you information on the config files.
     - `robotcode profiles show` shows you the configuration with your selected profiles.
     - Run Robot Framework files with specific profiles: `robotcode -p profile_a -p profile_b robot`.
     - `[variables]` at the root level of the `robot.toml` file are used by all profiles.
       - EXCEPT: using profiles with `[profiles.profile_a.variables]`.
         - All variables in here are specific to the profile and ignore the root-level `[variables]`.
       - When using `[profiles.profile_a.extend-variables]` the root-level variables are extended, meaning:
         - Root-level existing variables are replaced, if specified again.
         - Root-level existing variables are taken into the profile, if not again specified.
         - Profile-specific variables are included as well.
   - `robotcode debug`.
   - `robotcode analyze` is a static code analyzer for your project.
     - Analyzer Errors, Warnings, and Hints can be ignored by commenting `# robotcode: ignore[KeywordNotFound]`.
       - This ignoring is indentation dependent!!
     - Resetting the settings can be done by `robotcode: reset[KeywordNotFound]`.
     - Configure within `robot.toml`:

       ```toml
       [tool.robotcode-analyze.modifiers]
       ignore=[KeywordNotFound]
       ```

   - Splitting configuration into multiple files for modularity.

5. **Command Line Interface (CLI) Tools:**
   - Retrieving valuable information about your project.
     - `robotcode` will give you all commands with descriptions.
     - `robotcode discover` will give information about Suites, Test Cases.
       - `robotcode discover all .` to look for whole project information.
       - Filter test cases with robot options.
         - e.g `include/exclude` tags etc.
       - `--format` Option for printing results in a wanted format e.g. json for reuse in different projects.
       - Excludes all files that are ignored within [.gitignore](http://_vscodecontentref_/0).
       - Alternative: create `.robotignore` for excluding it from `robotcode discover` and speed up the discovery process or exclude local files for personal usage.
   - Analyzing your project to identify improvements.
     - `robotcode analyze`.
   - Running tests directly from the command line.
   - Implementing git hooks to streamline your development workflow.
   - Best practices for effective CLI usage.

6. **Integrating CI/CD Processes:**
   - Executing tests within a CI/CD pipeline.
     - Use `robot.toml` profiles to run CI settings on a local machine.
     - Ensure the CI process is low in complexity and mimics the steps done on the local machine as closely as possible.
   - Debugging test runs in CI/CD environments.
   - Best practices for continuous integration and deployment.
     - Keep the CI pipeline simple and maintainable.
     - Use the same `robot.toml` profiles for both local and CI environments to ensure consistency.
     - Automate as much as possible to reduce manual intervention and errors.

7. **Collaborating with Distributed Teams:**
   - Structuring and packaging Robot Framework projects for team collaboration.
   - Sharing and utilizing resources and libraries across multiple teams and projects.
   - Best practices for working in distributed development environments.
     - Step-by-step guide on building your resource files from `src/demo` via Hatch to create a `.wheel` file:
       1. Ensure you have Hatch installed:

          ```sh
          pip install hatch
          ```

       2. Navigate to your project directory:

          ```sh
          cd /path/to/your/project
          ```

       3. Create a `pyproject.toml` file in the root of your project with the following content:

          ```toml
          [build-system]
          requires = ["hatchling"]
          build-backend = "hatchling.build"

          [project]
          name = "your_project_name"
          version = "0.1.0"
          description = "Your project description"
          readme = "README.md"
          requires-python = ">=3.7"
          license = {text = "MIT"}

          [tool.hatch.build.targets.wheel]
          packages = ["src/demo"]
          ```

       4. Build the `.wheel` file:

          ```sh
          hatch build
          ```

       5. The `.wheel` file will be created in the `dist` directory. This file can then be uploaded to any package registry or distributed to other teams in different ways.
     - Integrate this process into the CI pipeline, e.g., with every new release:
       - Add the following steps to your CI configuration:

         ```yaml
         jobs:
           build:
             runs-on: ubuntu-latest
             steps:
               - uses: actions/checkout@v2
               - name: Set up Python
                 uses: actions/setup-python@v2
                 with:
                   python-version: '3.x'
               - name: Install Hatch
                 run: pip install hatch
               - name: Build wheel
                 run: hatch build
               - name: Upload wheel to registry
                 run: |
                   twine upload dist/*.whl
         ```

     - Commands for participants to try the distribution with Hatch themselves:

       1. Navigate to your project directory:

          ```sh
          cd /path/to/your/project
          ```

       2. Create a `pyproject.toml` file as described above.
       3. Build the `.wheel` file:

          ```sh
          hatch build
          ```

       4. Distribute the `.wheel` file as needed.

## Who Should Attend

- Developers, QA engineers, and test automation professionals using Robot Framework.
- Individuals seeking to enhance their skills with RobotCode.
- Teams interested in improving collaboration and efficiency in test automation.

## Methodology

The workshop combines lectures, live demonstrations, and hands-on exercises.

## Prerequisites

- Basic understanding of Robot Framework.
- Familiarity with Python is beneficial but not mandatory.
- A Notebook with internet connection and Visual Studio Code (or PyCharm) installed.

## Lessons Learned

- Install and configure RobotCode and its CLI tools.
- Set up and structure Robot Framework projects effectively.
- Manage projects and dependencies using Python project managers.
- Leverage RobotCode features to optimize workflows.
- Integrate RobotCode tools into CI/CD pipelines.
- Collaborate efficiently within distributed teams.
- Apply best practices throughout test automation projects.

## Authors

- [Daniel Biehl](https://github.com/d-biehl)
- [Fabian Tsirogiannis](https://github.com/febb0e)

## Links

- [RobotCode](https://github.com/robotcodedev/robotcode)
- [Hatch](https://hatch.pypa.io/latest/)
