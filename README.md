# Margin Master

A 3D printing margin Agent built with n8n and Docker.

## Overview
Margin Master Agent calculates profit margins for 3D printing projects by factoring in electricity and filament costs. It uses real-time data from the EIA API for electricity prices and MatterHackers for filament prices, processed within an n8n workflow (version 1.90.2) running in Docker.

## Setup Instructions
1. **Clone the Repository**:
   ```
   git clone git@github.com:corpmyaly/n8n-agents.git
   cd n8n-agents/margin_master
   ```
2. **Build the Docker Image**:
   ```
   docker build -t n8n-agents .
   ```
3. **Run the Container**:
   ```
   docker run -d -p 5678:5678 --name n8n-agents -v n8n_data:/data n8n-agents
   ```
4. **Access n8n**:
   Open `http://localhost:5678` in your browser.
5. **Set Up Credentials**:
   - Open the **Margin master** workflow.
   - In the **Fetch EIA Data** node, add your EIA API key (HTTP Header Auth, name: `EIA_API_KEY`, header: `api_key`).

## Test the Workflow
Send a POST request to `http://localhost:5678/webhook/margin-master`:
```json
{
  "state": "SD",
  "wattage": 500,
  "efficiency": 0.9,
  "production_time": 2,
  "material_type": "ABS",
  "material_quantity": 1,
  "selling_price": 30
}
```
Expected response:
```json
{
  "state": "SD",
  "material_type": "ABS",
  "electricity_cost": "0.12",
  "material_cost": "36.08",
  "total_cost": "36.20",
  "margin": "0.00",
  "selling_price": 30,
  "warning": "incomplete return: The API can only return 5000 rows in JSON format...",
  "eia_period": "2025-02"
}
```

## Features
- **Efficiency**: Accounts for printer efficiency (default 90%) to adjust electricity costs.
- **Materials**: Supports 15 filament types (e.g., ABS, PLA, PETG).
- **Computation**: Calculates costs using real-time data, with margin set to 0 for losses (pending discussion on negative margins).

**Contact me through my email for any queries** *Nabothtieng@gmail.com*
