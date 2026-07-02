import time
import requests
import platform
import json
import psutil
import socket

# Configuration
API_URL = "http://localhost/Quatation/Mobile_App_Version/api"
DEVICE_TYPE = platform.system() # Windows, Darwin (Mac), Linux

def get_active_window():
    """
    Get the active window title and process name.
    Cross-platform implementation.
    """
    active_window_title = ""
    active_process_name = ""

    try:
        if platform.system() == "Windows":
            import win32gui
            import win32process
            window = win32gui.GetForegroundWindow()
            active_window_title = win32gui.GetWindowText(window)
            pid = win32process.GetWindowThreadProcessId(window)[1]
            active_process_name = psutil.Process(pid).name()
        elif platform.system() == "Darwin":
            # macOS implementation requires Quartz/AppKit - using simple fallback for prototype
            # Or use AppleScript
            from AppKit import NSWorkspace
            active_app = NSWorkspace.sharedWorkspace().activeApplication()
            active_process_name = active_app['NSApplicationName']
            active_window_title = active_process_name # Harder to get exact title without Accessibility Perms
    except Exception as e:
        active_process_name = "Unknown"
        active_window_title = "Unknown"
    
    return active_process_name, active_window_title

def login():
    print("-" * 30)
    print("Webworks Employee Monitor")
    print("-" * 30)
    user = input("Username: ")
    pwd = input("Password: ")
    
    try:
        res = requests.post(f"{API_URL}/auth.php", json={"username": user, "password": pwd})
        data = res.json()
        if data.get('status') == 'success':
            print(f"Login Successful! Tracking started for user ID: {data['user_id']}")
            return data['user_id']
        else:
            print(f"Login Failed: {data.get('message')}")
            return None
    except Exception as e:
        print(f"Connection Error: {e}")
        return None

def main():
    user_id = login()
    if not user_id:
        return

    logs = []
    last_send = time.time()
    
    print("Monitoring active... Press Ctrl+C to stop.")
    
    try:
        while True:
            app, title = get_active_window()
            
            # Simple deduplication: Only log if it changes or every minute
            # For this MVP, we capture snapshots every 5 seconds
            
            if app and title:
                print(f"Active: [{app}] {title}")
                logs.append({
                    "app_name": app,
                    "window_title": title
                })
            
            # Send batch every 30 seconds
            if time.time() - last_send > 30 and logs:
                print(f"Sending {len(logs)} logs...")
                try:
                    payload = {
                        "user_id": user_id,
                        "device_type": DEVICE_TYPE,
                        "logs": logs
                    }
                    requests.post(f"{API_URL}/log.php", json=payload)
                    logs = [] # Clear buffer
                    last_send = time.time()
                except Exception as e:
                    print(f"Upload failed: {e}")
            
            time.sleep(5)
            
    except KeyboardInterrupt:
        print("Stopping monitor...")

if __name__ == "__main__":
    # You may need to install dependencies:
    # pip install requests psutil pywin32 (windows) pyobjc (mac)
    try:
        main()
    except Exception as e:
        print(f"Critical Error: {e}")
        input("Press Enter to close")
