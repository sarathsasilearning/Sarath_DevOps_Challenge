import os
import requests
import json
import time
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Settings
GITHUB_API_URL = "https://api.github.com"
REPO = "sarathsasilearning/Sarath_DevOps_Challenge"
OUTPUT_FILE = "github_issues.json"
TOKEN = os.getenv("GITHUB_TOKEN")

if not TOKEN:
    raise Exception("GITHUB_TOKEN not found in environment variables.")

HEADERS = {
    "Authorization": f"token {TOKEN}",
    "Accept": "application/vnd.github.v3+json",
    "User-Agent": "DevOps-Automation-Client"
}

def fetch_paginated_data(url):
    all_data = []
    while url:
        try:
            response = requests.get(url, headers=HEADERS)
            
            if response.status_code == 403 and response.headers.get("X-RateLimit-Remaining") == "0":
                reset_time = int(response.headers["X-RateLimit-Reset"])
                wait_time = max(reset_time - int(time.time()), 0)
                print(f"Rate limit hit. Sleeping for {wait_time} seconds...")
                time.sleep(wait_time + 1)
                continue

            response.raise_for_status()
            data = response.json()
            all_data.extend(data)

            # GitHub pagination
            links = response.links
            url = links.get("next", {}).get("url")
        except requests.RequestException as e:
            print(f"Error: {e}. Retrying in 5 seconds...")
            time.sleep(5)

    return all_data

if __name__ == "__main__":
    print("🔍 Fetching GitHub issues...")
    issues_url = f"{GITHUB_API_URL}/repos/{REPO}/issues?state=all&per_page=100"
    issues = fetch_paginated_data(issues_url)

    # Save to file
    with open(OUTPUT_FILE, "w") as f:
        json.dump(issues, f, indent=2)

    # Print to console
    print(json.dumps(issues, indent=2))

    print(f"\nFetched {len(issues)} issues. Saved to {OUTPUT_FILE}")
