<div class="nano">
  <div class="nano-content">
    <div>
      <div class="column-title cl-f c-pdg-h c-pdg-t c-pdg-bas-b">
        <h3 class="f-ttl c-blk fl-l">{{i18n 'customers.pageTitle'}}</h3>
        <h4 class="f-ttl fl-r c-blk">
          <span class="f-sml c-bas dp-b" style="padding-top: 8px;">total</span>
          499
        </h4>
      </div><!-- /.column-title -->
      <div class="scrll-stck">
        <form class="scrll-stck-cnt c-pdg-h c-pdg-bas-v" id="customers-search">
          <p class="input-search-holder">
            <input type="search" class="form-input input-search" placeholder="{{i18n 'customers.formPlaceholder'}}">
            <a href="javascript:;" class="btn-reset-search js-reset-search"></a>
          </p>
        </form><!-- /.scrll-stck-cnt -->
      </div><!-- /.scrll-stck -->
    </div>
    <div class="fetch-holder rendering loading customers-list">
      <div class="loading-list">
        <div class="loader large"></div>
      </div>
      <div class="empty-list">
        {{{i18n 'customers.noEntry'}}}
      </div>
      <div class="no-results">
        {{{i18n 'labels.noResults'}}}
      </div>
      <ul class="cln-lst c-pdg-bas-t customers-list" id="customers-list">
        <!--<li class="cln-lst-rw cust-row active">
          <span class="cln-lst-itm cust-rsum">
            <span class="odr-ttl dp-b strong f-lrg c-blk">Emile Menier</span>
            <span class="odr-cim dp-b">12 orders</span>
          </span>
          <span class="cln-lst-itm cln-lst-blk cln-lst-itm-tago">
            18 min ago
          </span>
        </li>
        <li class="cln-lst-rw cln-lst-load">
          <span class="f-lrg strong">Loading</span>
        </li>
         /.cln-lst-rw -->
      </ul><!-- /.cln-lst -->
      <!-- <p style="height:100%">&nbsp;</p> -->
    </div><!-- /.fetch-holder  -->
  </div><!-- /.nano-content -->
</div><!-- /.nano -->
