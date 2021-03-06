
// Subbly's Backbone base model

Components.Subbly.Model.Settings = SubblyModel.extend(
{
    serviceName:  'settings'
  , singleResult: 'settings'

  , url: function()
    {
      return Subbly.apiUrl( this.serviceName )
    }

  , parse: function ( response ) 
    {
      return response.response[ this.serviceName ]
    }

  , getAsObject: function()
    {
      var settings = {
          siteStatusList: Subbly.getConfig('siteStatus')
        , backendLocales: Subbly.getConfig('locales')
      }

      _.each( this.attributes, function( value, key )
      {
        Helpers.setNested( settings, key, value )
      })
      
      return settings
    }
})
