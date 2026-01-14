# Theta Terminal v3 (Dockerized)

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/theta-terminal-v3?referralCode=qYrEzB&utm_medium=integration&utm_source=template&utm_campaign=generic)

This project provides a Dockerized setup for running **Theta Terminal v3**, the latest version of the market data gateway from [Theta Data](https://thetadata.us/).

Theta Terminal acts as a local server that handles the proprietary protocol for receiving market data, exposing a standard REST API for your applications to consume.

**Note:** This is for **Theta Terminal v3**. If you are looking for v2, this is not the correct repository.
This is an unofficial template and is not affiliated with, endorsed by, or connected to Theta Data. It is a community-provided tool to help deploy the official Theta Terminal software. Users are responsible for ensuring they comply with Theta Data's Terms of Service.

## Documentation

For full details on Theta Terminal and how to use the API, please refer to the official documentation:
[Theta Data v3 Getting Started](https://docs.thetadata.us/Articles/Getting-Started/Getting-Started.html)

## Quick Start

### Prerequisites

- A [Theta Data](https://thetadata.us/) account.
- Your Theta Data credentials (email and password).

### Environment Variables

The following environment variables are required to run the terminal:

| Variable | Description |
|----------|-------------|
| `THETA_V3_USER` | Your Theta Data email address. |
| `THETA_V3_PASS` | Your Theta Data password. |

### Local Deployment

You can run this project locally using Docker Compose.

1. **Clone the repository:**
   ```bash
   git clone <your-repo-url>
   cd Theta-Terminal-v3
   ```

2. **Set your credentials:**
   You can export them as environment variables or pass them inline.

   ```bash
   export THETA_V3_USER="your_email@example.com"
   export THETA_V3_PASS="your_password"
   ```

3. **Run with Docker Compose:**
   ```bash
   docker-compose up -d
   ```

   Or inline:
   ```bash
   THETA_V3_USER="email" THETA_V3_PASS="pass" docker-compose up -d
   ```

4. **Access the API:**
   The terminal listens on port **25503**. You can verify it's running by checking the logs or querying the API (refer to Theta Data docs).

### Deploy on Railway

This repository is designed to be a **Railway Template**. You can deploy it directly to Railway with a single click.

1. Click the **Deploy on Railway** button at the top of this README.
2. Railway will ask for the required environment variables (`THETA_V3_USER` and `THETA_V3_PASS`).
3. Once deployed, your Theta Terminal will be running in the cloud.

**Note for Railway Users:**
- This service exposes port `25503`.
- Since Theta Terminal is a backend service, you will typically connect to it from other services within your Railway project using the private network and exposed port, or expose it publicly if needed (be careful with security!).

## Project Structure

- `Dockerfile`: Builds the Java 21 environment and sets up the runtime.
- `entrypoint.sh`: Handles credential configuration and downloads the latest JAR at runtime.
- `docker-compose.yml`: Orchestrates the service for local development.

