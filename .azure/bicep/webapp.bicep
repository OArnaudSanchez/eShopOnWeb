param webAppName string = uniqueString(resourceGroup().id)// Generate unique String for web app name
param sku string = 'B1' // The SKU of App Service Plan
param location string = resourceGroup().location

var appServicePlanName = 'ASP-devopsRG-8ff5'
var tagName = 'Proyecto'
var tagValue = 'Practicas DevOps'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: sku
  }
  kind: 'app'
  tags: {
    '${tagName}': tagValue
  }
}
resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webAppName
  kind: 'app'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'DOTNETCORE|6.0'
    }
  }
tags: {
    '${tagName}': tagValue
  }
}
