param location string
param project string
param env string
param sku_name string

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  kind: 'StorageV2'
  location: location
  name: '${project}-${location}-${env}'
  sku: {
    name: sku_name
  }
}

output storageAccountName string = storageAccount.name
