@allowed([
  'eng'
  'qa'
  'prod'
])
param environment string = 'eng'
param location string
param storageAccountSKU string
var project = 'FilesApi'

targetScope = 'subscription'

resource group 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  location: location
  name: '${project}-${location}-${environment}'
}


module stg '_modules/storageAccount.bicep' = {
  name: 'stg'
  params: {
    location: location
    env: environment
    project: project
    sku_name: storageAccountSKU
  }
  scope: group
}
