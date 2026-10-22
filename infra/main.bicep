param appName string = 'swa-portfolio-prod'

@allowed([
  'westeurope'
  'eastus2'
  'centralus'
  'westus2'
  'eastasia'
])
param location string = 'eastus2'

var tags = {
  project: 'portfolio'
  env: 'prod'
  owner: 'your-name'
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

resource dnsZone 'Microsoft.Network/dnsZones@2018-05-01' = {
  name: 'btall.dev'
  location: 'global'
  tags: tags
}

output defaultHostname string = swa.properties.defaultHostname
output nameServers array = dnsZone.properties.nameServers
