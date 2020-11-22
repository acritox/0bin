<form class="well" method="post" action="/paste/create" @submit.prevent="encryptAndSendPaste()">
  <div class="d-flex justify-content-between">

    <div>
      <div class="file-upload" v-if="support.fileUpload">
        <label type="button" class="btn btn-primary upload-file"
          :disabled="isUploading">{% isUploading ? 'Uploading...': 'Upload file' %}
          <input type="file" class="hide-upload" id="file-upload" @change="handleUpload($event.target.files)">
        </label>
      </div>
    </div>

    <div class="form-group select-date paste-option">
      <div class="input-group">
        <select id="expiration" name="expiration" class="custom-select" v-model="newPaste.expiration">
          <option value="burn_after_reading">Burn after reading</option>
          <option selected value="1_day">Expire in 1 day</option>
          <option value="1_week">Expire in 1 week</option>
          <option value="1_month">Expire in 1 month</option>
          <option value="1_year">Expire in 1 year</option>
          <option value="never">Never expire</option>
        </select>
        <div class="input-group-append">
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>
      </div>
    </div>

  </div>

  <div class="pre-wrapper">

    <div class="progress" v-show="isLoading">
      <div class="progress-bar progress-bar-striped" role="progressbar"></div>
    </div>

    <textarea rows="10" style="width:100%;" class="form-control" id="content" name="content" autofocus
      @keydown.ctrl.enter="encryptAndSendPaste()"></textarea>

    <div class="paste-options">
      <h6>Optional fields (these are <em>not</em> encrypted):</h6>

      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text">Title</span>
        </div>
        <input type="text" class="form-control paste-excerpt" name="paste-excerpt"
          placeholder="Anything you type here will be visible by anyone, including search engines."
          v-model="newPaste.title" maxlength="60">
      </div>

    </div>

  </div>

  <div class="form-group select-date paste-option down" v-if="displayBottomToolBar">
    <div class="input-group">
      <select id="expiration" name="expiration" class="custom-select" v-model="newPaste.expiration">
        <option value="burn_after_reading">Burn after reading</option>
        <option selected value="1_day">Expire in 1 day</option>
        <option value="1_week">Expire in 1 week</option>
        <option value="1_month">Expire in 1 month</option>
        <option value="1_year">Expire in 1 year</option>
        <option value="never">Never expire</option>
      </select>
      <div class="input-group-append">
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </div>

</form>


% rebase("base", settings=settings, pastes_count=pastes_count)
