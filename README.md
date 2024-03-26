# Cloudflare Dynamic DNS Updater (DDNS)

Automatically update (DDNS) Cloudflare DNS records for a dynamic IP address using a bash script.

## Introduction

This bash script enables you to automatically update DNS records on Cloudflare for a specified subdomain, ensuring seamless connectivity to your dynamic server or network. It periodically checks the current public IP address and updates the DNS record accordingly.

## Features

- Periodically checks the current public IP address using `curl`.
- Updates the DNS record for a specified subdomain on Cloudflare.
- Easy setup and configuration.

## Usage

1. Clone this repository to your local machine.
2. Make the `update_dns.sh` script executable using `chmod +x update_dns.sh`.
3. Edit the script to include your Cloudflare credentials (`CF_API_KEY`, `CF_EMAIL`), Zone ID (`ZONE_ID`), and the subdomain you want to update (`SUBDOMAIN`).
4. Set up a cron job to run the script periodically using `crontab -e`. For example, to run the script every 5 minutes:
   ```bash
   */5 * * * * /path/to/update_dns.sh
   ```
   Replace `/path/to/update_dns.sh` with the actual path to the script on your system.

## Requirements

- `curl`: Command-line tool for transferring data with URLs.
- `jq`: Lightweight and flexible command-line JSON processor.

## License

This project is licensed under the [MIT License](https://github.com/enesaksuu34/Cloudflare-Dynamic-DNS-Updater-ddns/blob/main/LICENSE).

## Contributing

Please feel free to open an issue or create a pull request for any improvements or features you'd like to add.
