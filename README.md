# 🚀 Scripts for Daily Life

A curated collection of helpful scripts designed to automate mundane daily tasks and boost productivity. From file management to notifications and task reminders, these scripts are made to be simple, effective, and easy to customize.

---

## 📚 Table of Contents

* [✨ Features](#-features)
* [⚙️ Getting Started](#-getting-started)

  * [🧰 Prerequisites](#-prerequisites)
  * [📦 Installation](#-installation)
* [🖥️ Usage](#-usage)

  * [📌 Examples](#-examples)
* [🔧 Configuration](#-configuration)
* [🤝 Contributing](#-contributing)
* [📝 License](#-license)
* [📬 Contact](#-contact)

---

## ✨ Features

* **File Organizer** – Automatically sort files into folders based on type or date.
* **Desktop Notifications** – Schedule reminder pop-ups to stay on track.
* **Bulk Renamer** – Rename multiple files with user-defined patterns.
* **Auto Backup** – Periodically back up selected directories.
* **Data Formatter** – Convert data between CSV, JSON, and XML formats.
* **Web Scraper** – Fetch and summarize content from websites.
* **Email Sender** – Send templated emails using SMTP.
* **To-Do List CLI** – Manage your task list directly from the terminal.

*More scripts will be added as the project evolves!*

---

## ⚙️ Getting Started

Follow the instructions below to set up and run the scripts on your local machine.

### 🧰 Prerequisites

* Python 3.8 or later
* Git
* *(Optional)* A virtual environment tool such as `venv` or `virtualenv`

### 📦 Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/scripts-for-daily-life.git
   cd scripts-for-daily-life
   ```

2. *(Optional)* Create and activate a virtual environment:

   ```bash
   python3 -m venv env
   source env/bin/activate  # Windows: env\Scripts\activate
   ```

3. Install dependencies:

   ```bash
   pip install -r requirements.txt
   ```

---

## 🖥️ Usage

All scripts are located in the `scripts/` directory. Run any script directly via Python:

```bash
python scripts/file_organizer.py --source /path/to/folder --dest /path/to/organized
```

### 📌 Examples

* **Organize Files:**

  ```bash
  python scripts/file_organizer.py --source ~/Downloads --dest ~/Documents/Downloads
  ```

* **Set a Reminder:**

  ```bash
  python scripts/reminder.py --time 09:00 --message "Stand up and stretch!"
  ```

* **Convert CSV to JSON:**

  ```bash
  python scripts/csv_to_json.py --input data.csv --output data.json
  ```

---

## 🔧 Configuration

Some scripts accept a `config.yaml` file for customization. Start with the included `config.example.yaml`, then rename it to `config.yaml` and adjust the parameters:

```yaml
backup:
  source: "/home/user/Documents"
  destination: "/mnt/backup"
  schedule: "daily"
```

---

## 🤝 Contributing

Your contributions are welcome and appreciated! To contribute:

1. Fork the repository.
2. Create a feature branch:

   ```bash
   git checkout -b feature/YourFeature
   ```
3. Commit your changes:

   ```bash
   git commit -m "Add YourFeature"
   ```
4. Push the branch:

   ```bash
   git push origin feature/YourFeature
   ```
5. Open a pull request.

Please follow the [Code of Conduct](CODE_OF_CONDUCT.md).

---

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

---

## 📬 Contact

**Maintainer:** Sultan Ahmmed

* GitHub: [SultanAhmmed](https://github.com/SultanAhmmed)
* LinkedIn: [sultan-ahmmed](https://www.linkedin.com/in/sultan-ahmmed)

---

Enjoy automating your day-to-day life. Happy scripting! ⚡


