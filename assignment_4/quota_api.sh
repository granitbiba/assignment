#!/bin/bash

# Define Subscription ID (Replace with your actual ID)
SUBSCRIPTION_ID="2135ba9f-05be-486b-b255-8a0fe68e0921"

# Get Azure Access Token
TOKEN=$(az account get-access-token --resource https://management.azure.com --query accessToken -o tsv)

# Define API URLs for vCPU and Networking
COMPUTE_URL="https://management.azure.com/subscriptions/$SUBSCRIPTION_ID/providers/Microsoft.Compute/locations/northeurope/usages?api-version=2023-07-01"
NETWORK_URL="https://management.azure.com/subscriptions/$SUBSCRIPTION_ID/providers/Microsoft.Network/usages?api-version=2023-07-01"

# Fetch vCPU Quotas
echo "Fetching vCPU Quotas..."
VCPU_RESPONSE=$(curl -s -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" "$COMPUTE_URL")

# Fetch Networking Quotas
echo "Fetching Networking Quotas..."
NETWORK_RESPONSE=$(curl -s -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" "$NETWORK_URL")

# Debugging: Print raw API responses (uncomment if needed)
# echo "Raw vCPU API Response: $VCPU_RESPONSE"
# echo "Raw Networking API Response: $NETWORK_RESPONSE"

# Check if response is empty or null
if [ -z "$VCPU_RESPONSE" ] || [ "$VCPU_RESPONSE" == "null" ]; then
    echo "Error: vCPU API response is null or empty. Check your Azure credentials or permissions."
else
    echo "Filtered vCPU Quotas:"
    echo "$VCPU_RESPONSE" | jq '.value[] | select(.name.localizedValue | test("vCPU"; "i")) | {name: .name.localizedValue, limit: .limit, currentUsage: .currentValue}'
fi

if [ -z "$NETWORK_RESPONSE" ] || [ "$NETWORK_RESPONSE" == "null" ]; then
    echo "Error: Networking API response is null or empty. Check your Azure credentials or permissions."
else
    echo "Filtered Networking Quotas:"
    echo "$NETWORK_RESPONSE" | jq '.value[] | select(.name.localizedValue | test("Public IP|Load Balancer"; "i")) | {name: .name.localizedValue, limit: .limit, currentUsage: .currentValue}'
fi
