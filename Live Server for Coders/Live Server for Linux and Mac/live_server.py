# ┌──────────────────────────────────────────────────┐
# │                 All praise to Allah              │
# │                                                  |
# │         🖋️  Script by: Sultan Ahmmed             |
# │        📅  Date: May 8, 2025 : 4:40AM           │
# │                                                  │
# └──────────────────────────────────────────────────┘

import sys
import os
import time
import threading
import webbrowser
import shutil
import socket
from colorama import Fore, Style, init
from tqdm import tqdm
from livereload import Server

class LiveServer:
    def __init__(self, folder_path, host="127.0.0.1", port=8080):
        self.folder_path = os.path.normpath(folder_path)
        self.host = host
        self.port = port
        self.url = f"http://{self.host}:{self.port}"
        self.stop_event = threading.Event()
        self.server = Server()
        init(autoreset=True)

    def find_available_port(self):
        """Find and return an available port starting from the specified port"""
        test_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        try:
            test_socket.bind((self.host, self.port))
            test_socket.close()
            return self.port
        except socket.error:
            test_socket.close()
            # Try next 10 ports
            for port in range(self.port + 1, self.port + 100):
                try:
                    test_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                    test_socket.bind((self.host, port))
                    test_socket.close()
                    self.port = port
                    self.url = f"http://{self.host}:{self.port}"
                    return port
                except socket.error:
                    test_socket.close()
            raise RuntimeError("No available ports found")


    def open_browser(self):

        browsers = {
            'windows': ['start'],
            'darwin': ['open'],
            'linux': ['xdg-open', 'sensible-browser']
        }

        try:
            webbrowser.open(self.url);
            print(f"[INFO] Opened in default browser: {self.url}")
            return
        except webbrowser.Error:
            pass

        for cmd in browsers.get(sys.platform, []):
            try:
                subprocess.run([cmd, self.url], check=True)
                print(f"[INFO] Opened using {cmd}: {self.url}")
                return
            except (subprocess.SubprocessError, OSError):
                continue

        print(f"[WARNING]Couldn't open browser. Please manually visit: {self.url}")


    def run_server(self):
        """Run the livereload server in a separate thread."""
        try:
            self.server.serve(root=self.folder_path, host=self.host, port=self.port)
        except Exception as e:
            print(f"[ERROR] Server failed: {str(e)}")
            self.stop_event.set()

    def show_progress(self):
        """Display the loading progress bar."""
        bar_format = Fore.CYAN + "{desc:<15} |{bar}| " + Fore.YELLOW + "{percentage:3.0f}%" + Style.RESET_ALL
        for _ in tqdm(range(100),
                     desc="Starting Server",
                     bar_format=bar_format,
                     ncols=100):
            time.sleep(0.02)
        time.sleep(0.5)
        os.system('cls' if os.name == 'nt' else 'clear')

    def show_banner(self):
        """Display the ASCII art banner."""
        ascii_art = r"""
 ___        __  ___      ___  _______       ________  _______   _______  ___      ___  _______   _______   
|"  |      |" \|"  \    /"  |/"     "|     /"       )/"     "| /"      \|"  \    /"  |/"     "| /"      \  
||  |      ||  |\   \  //  /(: ______)    (:   \___/(: ______)|:        |\   \  //  /(: ______)|:        | 
|:  |      |:  | \\  \/. ./  \/    |       \___  \   \/    |  |_____/   ) \\  \/. ./   \/    |  |_____/   ) 
 \  |___   |.  |  \.    //   // ___)_       __/  \\  // ___)_  //      /   \.    //   // ___)_  //      /  
( \_|:  \  /\  |\  \\   /   (:      "|     /" \   :)(:      "||:  __   \    \\   /   (:      "||:  __   \  
 \_______)(__\_|_)  \__/     \_______)    (_______/  \_______)|__|  \___)    \__/     \_______)|__|  \___)   
                                                                                                by Sultan Ahmmed
"""
        print(ascii_art)
        print(Fore.GREEN + f"[INFO] Server is running at {self.url} ..." + Style.RESET_ALL)
        print(Fore.YELLOW + f"[INFO] To stop the Server Press (CTRL + C)..." + Style.RESET_ALL)

    def start(self):
        """Start the live server with all components."""
        if not os.path.isdir(self.folder_path):
            print(f"[ERROR] Folder not found: {self.folder_path}")
            return False

        try:
            self.port = self.find_available_port()
            self.url = f"http://{self.host}:{self.port}"
        except RuntimeError as e:
            print(f"[ERROR] {str(e)}")
            return False

        self.server.watch(os.path.join(self.folder_path, '*.html'))
        self.server.watch(os.path.join(self.folder_path, '*.css'))
        self.server.watch(os.path.join(self.folder_path, '*.js'))

        self.show_progress()
        self.show_banner()

        server_thread = threading.Thread(
            target=self.run_server,
            daemon=True
        )
        server_thread.start()

        try:
            self.open_browser()
        except Exception as e:
            print(f"[WARNING] Browser open failed: {str(e)}")

        try:
            while not self.stop_event.is_set():
                time.sleep(1)
        except KeyboardInterrupt:
            print("\n[INFO] Shutting down server...")
            self.stop_event.set()
        return True

def main():
    if len(sys.argv) < 2:
        print("Usage: python live_server.py <folder_path>")
        sys.exit(1)

    server = LiveServer(sys.argv[1])
    server.start()

if __name__ == "__main__":
    main()