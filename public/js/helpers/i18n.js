

var i18n = function()
{
  this.keys    = null
}

i18n.prototype.setLocale = function( locale, cb )
{
  this.current = locale

  var scope = this

  var xhr = $.ajax({
      url:         Subbly.getConfig('i18nresource').replace('{{locale}}', this.current ) 
    , dataType:    'json'
    , cache:       false
    , success:     function( response )
      {
        scope.keys = response

        if( _.isFunction( cb ) )
          cb()
      }
    , error:      function( response )
      {
console.log( 'i18n onError' )
console.log( response )
      }
  })
}

/*
 * Return resources key
 */
i18n.prototype._getKey = function( _str ) 
{
  var keys = _str.split('.')
    , len  = keys.length
    , str  = this.keys

  for( var i = -1, l = keys.length; ++i < l; )
  {
      if ( !str[ keys[ i ] ] )
          return _str

      str = str[ keys[ i ] ]
  }

  return str
}

/*
 * Return localized key
 */
i18n.prototype.get = function( _str ) 
{
  var str  = this._getKey( _str )
    , args = [].slice.call( arguments, 1 )

  if( args.length )
    return _.vsprintf( str, args )

  return str 
}

/*
 * Pluralization
 */
i18n.prototype.choice = function( _str, _count )
{
  var str  = this._getKey( _str )
    , args = [].slice.call( arguments, 2 )

  if( _.isObject( str ) )
  {
    str = ( _count > 1 )
          ? str.plural
          : ( _count === 1 ) ? str.single : str.none

    if( !args.length )
      args.push( _count )
  }

  if( args.length )
    return _.vsprintf( str, args )

  return str 

}

// shortcut ala gettext
var __ = function( _str )
{
  return Subbly.i18n().get( _str )
}
