# ⚡ Universal Code Runner Script (Windows & Linux)

Easily compile and run your **C**, **C++**, **Python**, **Java**, and **Rust** programs from the command line using a single script!

This repo contains:
- 🪟 `run.bat` – for Windows users
- 🐧 `run.sh` – for Linux users

---

## 🌐 Supported Languages

| Language | Extension | Compiler/Interpreter |
|----------|-----------|-----------------------|
| C        | `.c`      | `gcc`                 |
| C++      | `.cpp`    | `g++`                 |
| Python   | `.py`     | `python3` (or `python`) |
| Java     | `.java`   | `javac`, `java`       |
| Rust     | `.rs`     | `rustc`               |

---

## 🪟 How to Use on Windows

### 📁 File: `run.bat`

### ✅ Prerequisites
- You need to have the necessary compilers installed (e.g., GCC, Python, Java, Rust).
- Make sure they are added to your system’s **PATH**.

### ▶️ Steps

1. Download or copy the `run.bat` file into the folder where your source code file is.
2. Open **Command Prompt** in that folder.
3. Run the script with your file name as an argument:

```cmd
run yourfile.cpp ( If the file extention off)
run.bat yourfile.cpp ( if the file extention on)
```
# 🐧 How to Use on Linux

## 📁 File: `run.sh`

### ✅ Prerequisites
Ensure `gcc`, `g++`, `python3`, `javac`, and `rustc` are installed.

The script must have executable permissions.

### ▶️ Steps

Give execution permission once:

```bash
chmod +x run.sh
```
Run your script like this:
```bash
./run.sh yourfile.py
```



