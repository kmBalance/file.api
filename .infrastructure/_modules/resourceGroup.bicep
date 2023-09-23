param project string
param location string
param env string

targetScope = 'subscription'

resource group 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  location: location
  name: '${project}-${location}-${env}'
}

output name string = group.name
