# Blogtalk: Ometman

<a name="readme-top"></a>

<div align="center">
  <img src="./ometman-logo.png" alt="logo" width="140"  height="auto" />
  <br/>
  <h3><b>Blogtalk: by Ometman</b></h3>
  <h5>"Blogtalk" is a beautiful and powerful Rails project for blog lovers. As a Ruby on Rails project it utilizes PostgreSql as the relational database management system for managing blog users and relative data. Blogtalk allows user log in and logout, creation of users, creation of blogs, posting of blogs and commenting on blogs.  The power of rails is employed to build models, controllers and views that allows easy CRUD funtionality to be performed on blogs. Built on a simple Entity Relational Diagram it has a simple UI for a rich UX. 
  What more? Enjoy it to discover!
</div>

# 📗 Table of Contents

- [Blogtalk: Ometman](#blogtalk-ometman)
- [📗 Table of Contents](#-table-of-contents)
- [📖 Blogtalk ](#-blogtalk-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install Packages and Run Tests ](#install-packages-and-run-tests-)
    - [Usage ](#usage-)
    - [Deployment](#deployment)
    - [Authors](#authors)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [❓ FAQ ](#-faq-)
  - [📝 License ](#-license-)

# 📖 Blogtalk <a name="about-project"></a>

**A Demo Video: Introduction to this Project**
--coming soon

> The project includes designs for two different screen sizes.

- Accessible on any screen.
- Better view on Ipads and Desktop systems

> Project Brief :
- It is a Ruby on Rails Project
- It is built on a real-life data structure by Microverse.
- It is a Relational Database system
- It uses Postgresql.
- It is ACID ( Atomicity, Consitency, Isolation, Durablity) compliant.
- It perform CRUD functionality in user-specific blogging.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li>Ruby on Rails</>
    <li>Postgresql</li>
    <li>Database Management Server funtionalities</li>
    <li>Real-life structure</li>
    <li>Styelint and Rubocop for best practices</li>
    <li>Rspec for testing</li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li>PostgreSql Server</li>
    <li>Github Servers</li>
    <li>Rails Server</li>
  </ul>
</details>

<details>
  <ul>
    <li>PostgreSql Database</li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **Conversion of a real wireframe using Rails***
- **Creating a User**
- **Creating, querying, updating and auditing blogs by database**
- **Schema development and application in migration**
- **Create blogs, likes and comments**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- Git (for running git related commands only)
- An IDE (e.g. VS Code) - For viewing and accessing the files only
- A system with a good OS like Mac Os, Linux or Windows etc
- PostgreSql (https://www.postgresql.org/download/)
- Ruby on Rails (https://gorails.com/setup/windows/10)

### Setup

- Depending on your OS, download and install PostgreSql:
  - You may watch this video (https://www.youtube.com/watch?v=KuQUNHCeKCk)
- Open your code editor (e.g. VS Code).
- At the terminal, clone this repository to your desired directory.
- Make sure the PostgreSql server is running
  - You may refer to https://www.postgresql.org/docs/current/tutorial-start.html
- Download and install Ruby on Rails
  - Following the instructions at https://gorails.com/setup/windows/10

- Use `git clone` to get your local copy of the project.
  >> At the prompt (bash) enter:
  ```
  git clone https://github.com/ometman/blogtalk.git
  ```

### Install Packages and Run Tests <a name="install"></a>

 Run `npm install` to set up the required packages.

```
bash > npm install
````
 Run Tests <a name="run-tests"></a>
  To run tests run the following command in your terminal
    ```
    Rspec
    ```

 Run Linters
  - You can also check linter errors
  - Make sure Rubocop and stylelint are installed
     Install Rubocop, run the following command:
    ```
    gem install --no-document rubocop -v '>= 1.0, < 2.0'
    ```
    Install Stylelint, run the following command:
    ```
    npm install --save-dev stylelint@13.x stylelint-scss@3.x stylelint-config-standard@21.x stylelint-csstree-validator@1.x
    ```
  - Now, run the following:
    ```
    npx stylelint "**/*.{css,scss}"
    ```

    ```
    npx eslint "**/*.{js,jsx}"
    ```

### Usage <a name="usage"></a>

To run the project locally, execute the following command:

- Start and login to the database server (for Windows): 
  ```
  run psql
  ```
  Or start PgAdmin

- Launch the app with the following command to start the rails server:
  ```
  rails s
 ``` 
- Voila! Now, go to the browser and enter: localhost:3000 or 127.0.0.1:3000

### Deployment

You can deploy this project using:

- GitHub Pages from a specific branch (e.g. main).
- You can also used any cloud service like gcloud or Azure.
- A deployed version can be found here:
  [https://... (Coming Soon)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Authors

👤 **Omet Omeni (Ometman)**

- GitHub: [@ometman](https://github.com/ometman)
- Twitter: [@twitterhandle](https://twitter.com/ometman)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/ometman/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- **Advance blog categorization and tagging**
- **Improving UI design**
- **Adding a help information**
- **Adding contact information**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/ometman/blogtalk/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

As a tech enthusiast, your support is always appreciated. If you like this project please do let us know with your support in any way you see fit.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank especially [Microverse](https://www.microverse.org/) for inspiring this project & project guidelines.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ❓ FAQ <a name="faq"></a>

- **Can I fork this project?**

  - Yes, feel free to fork and knock yourself out :) .

- **Can I share this project with others?**
  - Yes, you can share this project for any educational purposes.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
