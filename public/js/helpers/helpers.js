
var Helpers = 
{
    getNested: function( obj, path, defaults )
    {
      var fields = path.split('.')
        , result = obj

      for( var i = -1, n = fields.length; ++i < n; )
      {
        result = result[ fields[ i ] ]

        if( result == 'undefined' && i < n - 1 )
           result = {}
        
        if( typeof result === 'undefined' )
          return result || defaults
      }

      return result
    }

  , setNested: function( obj, path, val, options )
    {
      options = options || {}

      var fields = path.split('.')
        , result = obj

      for( var i = 0, n = fields.length; i < n && result !== undefined ; i++ )
      {
        var field = fields[ i ]

        // If the last in the path, set the value
        if( i === n - 1 )
        {
          options.unset ? delete result[ field ] : result[ field ] = val
        }
        else
        {
          // Create the child object if it doesn't exist, or isn't an object
          if( typeof result[ field ] === 'undefined' || ! _.isObject( result[ field ] ) ) 
          {
            result[ field ] = {}
          }

          // Move onto the next part of the path
          result = result[ field ]
        }
      }
    }

  , deleteNested: function ( obj, path )
    {
      Helpers.setNested(obj, path, null, { unset: true })
    }

  , deepMerge: function( target, source )
    {
      for( var key in source )
      {
        var original = target[ key ]
          , next     = source[ key ]

        if( original && next && typeof next == 'object' )
        {
          Helpers.deepMerge( original, next )
        }
        else
        {
          target[key] = next
        }
      }

      return target
    }

  , formatNumber: function( value, style )
    {
      var settings = {}

      switch( style )
      {
        case 'currency': 
          settings = { style: 'currency', currency: Subbly.getSetting('subbly.shop_currency') , minimumFractionDigits: 2 }
          break
        case 'float': 
          settings = { style: 'decimal', minimumFractionDigits: 2 }
          break
      }

      // Safari, IE11-
      if( _.isUndefined( window.Intl ) )
      {
        switch( style )
        {
          case 'currency': 
            return value + ' ' + Subbly.getSetting('subbly.shop_currency')
            break
          default:
            return value
        }
      }
      else
      {
        return new Intl.NumberFormat( Subbly.getSetting('subbly.backend_language'), settings ).format( value )
      }
    }

  , bytesToSize: function( bytes )
    {
      if( _.isUndefined( bytes ) )
        return '0 MB'

      var sizes = ['bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB']

      if(bytes == 0) return 'n/a'

      var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)))

      if (i == 0)
      {
        return (bytes / Math.pow(1024, i)) + ' ' + sizes[i] 
      }

      return (bytes / Math.pow(1024, i)).toFixed(1) + ' ' + sizes[i]
    }
}
