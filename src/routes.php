<?php

/*
 * Register Backend routes before public routes.
 */

Route::group(array(
    'prefix' => Config::get( 'subbly.backendUri', '/admin' )
), function() 
{
  /*
   * Generic Backend route's callback
   * 
   */
  $displayBackend = function()
  {
    /*
     * If exists do not display 
     * Debugbar on Backend UI
     * 
     */
    if( class_exists('Debugbar') )
      Debugbar::disable();

    /*
     * Server's based configuration
     * to send as parameters to UI
     * 
     */
    $env    = App::environment();
    $config = [
        'baseUrl'      => Config::get( 'subbly.backendUri', '/admin' ) . '/'
      , 'domain'       => URL::to( '/' ) .'/'
      , 'apiUrl'       => URL::to('/api/v1') .'/'
      , 'env'          => $env
      , 'debug'        => (bool) Config::get('app.debug')
      , 'locales'      => Config::get('backend::locales.list')
      , 'i18nresource' => URL::to( Config::get('backend::locales.resources') )
      , 'currencies'   => Config::get('backend::currencies')
      , 'orderStatus'  => Config::get('backend::order')
      , 'siteStatus'   => Config::get('backend::site.status')
      , 'upload'       => [
            'maxFileSize' => convertBytes( ini_get('upload_max_filesize') )
        ]
    ];

    return View::make('backend::backend', [
        'environment' => $env
      , 'config'      => $config
    ]);
  };

  Route::get( '/' ,     $displayBackend );
  Route::get( '{url}' , $displayBackend )->where('url', '.*');
});

/*
 * Return empty response.
 * Allow natural autocomplete on ajax form
 */

Route::any('/void', function()
{
  $response = Response::make( array(), 204 );

  $response->header('Content-Type', 'json');

  return $response;
});

/*
 * Return JSON of all the Backend templates
 */

Route::get('/static/templates', function()
{
  $path = __DIR__ . '/views/tpl/';
  
  $files = File::allFiles( $path );
  $arr = array();

  foreach( $files as $file )
  {
    $filename    = str_replace( $path, '',  str_replace('.tpl', '', (string) $file ) );
    $tmp         = array_filter( explode( '/', $filename ) );
    $content     = File::get( (string) $file, '' );
    $html        = trim( preg_replace('/\s+/', ' ',preg_replace('/<!-- (.*)-->/Uis', '', $content) ) );
    $dotpath     = implode( '.', $tmp );

    array_set( $arr, $dotpath, $html );
  }

  $contents = 'var TPL = ' . json_encode( $arr );

  $response = Response::make($contents, 200 );
  $response->header('Content-Type', 'application/javascript');
  return $response;
});
