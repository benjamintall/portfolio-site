param appName string = 'swa-portfolio-prod'

@allowed([
  'westeurope'
  'eastus2'
  'centralus'
  'westus2'
  'eastasia'
])
param location string = 'westeurope'

var tags = {
  project: 'portfolio'
  env: 'prod'
  owner: 'benjamintall'
}

resource swa 'Microsoft.Web/staticSites@2023-12-01' = {
  name: appName
  location: location
  tags: tags
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {}
}

output defaultHostname string = swa.properties.defaultHostname
