<div class="view-third">
  <div class="nano">
    <div class="nano-content">
      <div class="fetch-holder rendering loading order-entry">
        <div class="loading-list">
          <div class="loader large"></div>
        </div>
        <div class="column-title cl-f c-pdg-h c-pdg-t">
          <h3 class="f-ttl c-blk fl-l">
            {{#isNew}}
            {{i18n 'product.titleAdd'}}
            {{/isNew}}
            {{^isNew}}
            {{i18n 'product.titleEdit'}}
            {{/isNew}}
          </h3>
        </div><!-- /.column-title -->
        <form class="form c-pdg-h c-pdg-bas-t c-pdg-b" id="subbly-product-entry">
          <div class="form-row">
            <div class="form-field input-8">
              <label class="form-label">
                {{i18n 'product.title'}}
              </label>
              <input type="text" class="form-input" name="name" value="{{name}}" id="subbly-product-entry-name">
            </div><!-- /.form-field -->
            <div class="form-field input-4">
              <label class="form-label">
                {{i18n 'product.sku'}}
              </label>
              <input type="text" class="form-input" name="sku" value="{{sku}}">
            </div><!-- /.form-field -->
          </div><!-- /.form-row -->
          <div class="form-row">
            <div class="form-field">
              <label class="form-label">
                {{i18n 'product.slug'}}
              </label>
              <input type="text" class="form-input js-slugify" name="slug" value="{{slug}}" id="subbly-product-entry-slug">
            </div><!-- /.form-field -->
          </div><!-- /.form-row -->
          <div class="form-row">
            <div class="form-field">
              <label class="form-label">
                {{i18n 'product.desc'}}
              </label>
              <textarea class="form-input" name="description" row="5" col="3">{{description}}</textarea>
            </div><!-- /.form-field -->
          </div><!-- /.form-row -->
          <div class="form-row">
            <div class="form-field">
              <label class="form-label">
                {{i18n 'product.categories'}}
              </label>
              <p>
                <a href="javascript:;" class="btn btn-action js-trigger-categories">
                  {{i18n 'product.editCategories'}}
                </a>
                {{#unless getCategories}}
                <span class="f-sml c-pdg-bas-l">{{i18n 'product.noCategories'}}</span>
                {{/unless}}
              </p>
              <ul class="product-categories">
                <li class="product-categories-loading">
                  <span class="loader"></span>
                </li>
              </ul>
            </div><!-- /.form-field -->
          </div><!-- /.form-row -->
          <hr class="hr">
          <div class="form-row">
            <div class="form-field input-4">
              <label class="form-label">
                Price ($)
              </label>
              <input type="text" class="form-input" name="price" value="{{price}}">
            </div><!-- /.form-field -->
            <div class="form-field input-4 input-addon">
              <label class="form-label">
                Sales price
              </label>
              <input type="text" class="form-input" name="sale_price" value="{{sale_place}}">
              <a href="javascript:;" class="form-input-addon">
                OFF
              </a>
            </div><!-- /.form-field -->
          </div><!-- /.form-row -->
          <div class="form-row">
            <div class="form-field input-4">
              <label class="form-label">
                Quantity
              </label>
              <input type="text" class="form-input" name="quantity" value="{{quantity}}">
            </div><!-- /.form-field -->
          </div><!-- /.form-row -->
          <p class="c-pdg-bas-v">
            <a href="javascript:;" class="strong c-blk">Add option</a>  - For different sizes, colors, styles, etc.
          </p>
          <hr class="hr">
          <p class="c-pdg-bas-v">
            <a href="javascript:;" class="strong -c-blk">
              Edit Shipping option
            </a>
          </p>
          <hr class="hr">
          <div class="form-row">
            <div class="form-field input-4">
              <label class="form-label">
                Status
              </label>
              <span class="form-select-holder">
                <select class="form-input" name="status">
                  {{#each statusList}}
                  <option value="{{this}}" {{isSelected this default=../status attribute="selected"}}>{{this}}</option>
                  {{/each}}
                </select>
              </span>
            </div><!-- /.form-field -->
          </div><!-- /.form-row -->
          <hr class="hr" style="margin-left:-40px; margin-right:-40px;">
          <p class="ta-r c-pdg-v">
            <a href="javascript:;" class="btn btn-borderless js-cancel-form">
              Cancel 
            </a>
            <a href="javascript:;" class="btn btn-valid js-submit-form">
              Save product
            </a>
          </p>
        </form>
      </div><!-- /.fetch-holder -->
    </div><!-- /.nano-content -->
  </div><!-- /.nano -->
</div><!-- /.view-third -->
<div class="view-third" id="product-images">
  <div class="nano">
    <div class="nano-content">
      <div class="fetch-holder rendering loading order-entry">
        <div class="loading-list">
          <div class="loader large"></div>
        </div>
        <div class="c-pdg-t product-gallery">
          <strong class="strong dp-b" style="margin:50px 0 10px;">Images</strong>
          <label class="btn btn-action dp-b ta-c cur-p pos-r" id="js-trigger-loadimg" data-loading-text="loading">
            Add image
            <input type="file" name="file" class="file-upload" id="subbly-product-img-upload">
          </label>
        </div>
        <div class="product-gallery c-pdg-bas-t c-pdg-b ta-c">
          <div class="thmb-col">
            <ul class="sortable" id="product-images-list">
              {{#each getImages}}
              {{> productThumb}}
              {{/each}}
            </ul>
          </div><!-- /.thmb-col  -->
        </div><!-- /.c-pdg-h -->
      </div><!-- /.fetch-holder -->
    </div><!-- /.nano-content -->
  </div><!-- /.nano -->
</div><!-- /.view-third -->
