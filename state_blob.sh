#!/bin/bash

RESOURCE_GROUP_NAME=geomeoso_rg
STORAGE_ACCOUNT_NAME=geomeoso
CONTAINER_NAME=geotfstate0404

# create resource gorup
az group create --name $RESOURCE_GROUP_NAME --location westus2

# create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob --min-tls-version TLS1_2

# get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query [0].value -o tsv)

# create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY

echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "container_name: $CONTAINER_NAME"
