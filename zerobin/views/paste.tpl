%if "burn_after_reading" in str(paste.expiration):
%if keep_alive:
<p class="alert alert-dismissible alert-primary">
  <a class="close" data-dismiss="alert" href="#" @click.prevent="$event.target.parentNode.remove()">×</a>
  <strong class="title">Ok!</strong>
  <span class="message">
    This paste will be deleted the next time it is read.
  </span>
</p>
%else:
<p class="alert alert-warning alert-dismissible">
  <a class="close" data-dismiss="alert" href="#" @click.prevent="$event.target.parentNode.remove()">×</a>
  <strong class="title">Warning!</strong>
  <span class="message">
    This paste has self-destructed. If you close this window,
    there is no way to recover it.
  </span>
</p>
%end
%end
<div class="well paste-form">
  <form action="/" method="get" accept-charset="utf-8">

    <div :class="{'d-flex': true, 'justify-content-between': true , 'reader-mode-tools': readerMode}">

      <div class="btn-group" role="group">
        <button v-if="support.clipboard && currentPaste.type === 'text'" @click.prevent="copyToClipboard()"
          type="button" id="clip-button" class="btn btn-secondary responsive-icons">Copy to clipboard
          <svg width="24" height="24" viewBox="0 0 20 20" class="bi bi-clipboard-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" fill="#eee" d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
            <path fill-rule="evenodd" fill="#eee" d="M9.5 1h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3zM8 7a.5.5 0 0 1 .5.5V9H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V10H6a.5.5 0 0 1 0-1h1.5V7.5A.5.5 0 0 1 8 7z"/>
          </svg>
        </button>
        <button type="button" id="email-link" class="btn btn-secondary responsive-icons" @click="handleSendByEmail($event)">
          <svg width="24" height="24" viewBox="0 0 20 20" class="bi bi-envelope" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" fill="#eee" d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383l-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z"/>
          </svg>

          Email
          this</button>
      </div>

      <div>

        <span class="paste-option btn-group responsive-icons">
          <button class="btn btn-clone btn-secondary" @click.prevent="handleClone()">Clone
            <svg width="24" height="24" viewBox="0 0 20 20" class="bi bi-files" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
              <path fill="#eee" fill-rule="evenodd" d="M3 2h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H3z"/>
              <path d="M5 0h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2v-1a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1H3a2 2 0 0 1 2-2z"/>
            </svg>
          </button>

          <a class="btn btn-secondary download-link" :href="currentPaste.downloadLink.url"
            :download="currentPaste.downloadLink.name">Download
              <svg width="24" height="24" viewBox="0 0 20 20" class="bi bi-cloud-download-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill="#eee" fill-rule="evenodd" d="M8 0a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 4.095 0 5.555 0 7.318 0 9.366 1.708 11 3.781 11H7.5V5.5a.5.5 0 0 1 1 0V11h4.188C14.502 11 16 9.57 16 7.773c0-1.636-1.242-2.969-2.834-3.194C12.923 1.999 10.69 0 8 0zm-.354 15.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 14.293V11h-1v3.293l-2.146-2.147a.5.5 0 0 0-.708.708l3 3z"/>
              </svg>
          </a>

          <button class="btn btn-secondary">New Paste
            <svg width="24" height="24" viewBox="0 0 20 20" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
              <path fill="#eee" d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
              <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
            </svg>
          </button>
        </span>
      </div>

    </div>

    <div class="progress-container">
      <div class="progress  active" v-show="isLoading">
        <div class="progress-bar progress-bar-striped" role="progressbar"></div>
      </div>
    </div>

    %expiration = paste.humanized_expiration
    %if expiration:
    <span id="expiration-tag">Expire {{ expiration }}</span>
    %end

    <pre id="paste-content" class="prettyprint" v-if="!readerMode">
        <code>
          {{ paste.content }}
        </code>
    </pre>

    <div>
      <div id="readable-paste-content" v-if="readerMode">
        {% currentPaste.content %}
      </div>
    </div>

    <div class="d-flex justify-content-between down">
      <div>
        <div v-if="currentPaste.ownerKey">
          <button class="btn btn-secondary" @click.prevent="handleDeletePaste()">Delete Paste</button>
        </div>
      </div>
      <div>
        <span class="paste-option btn-group responsive-icons">
          <button class="btn btn-clone btn-secondary" @click.prevent="handleClone()">Clone
            <svg width="24" height="24" viewBox="0 0 20 20" class="bi bi-files" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
              <path fill="#eee" fill-rule="evenodd" d="M3 2h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H3z"/>
              <path d="M5 0h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2v-1a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1H3a2 2 0 0 1 2-2z"/>
            </svg>
          </button>

          <a class="btn btn-secondary download-link" :href="currentPaste.downloadLink.url"
            :download="currentPaste.downloadLink.name">Download
              <svg width="24" height="24" viewBox="0 0 20 20" class="bi bi-cloud-download-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill="#eee" fill-rule="evenodd" d="M8 0a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 4.095 0 5.555 0 7.318 0 9.366 1.708 11 3.781 11H7.5V5.5a.5.5 0 0 1 1 0V11h4.188C14.502 11 16 9.57 16 7.773c0-1.636-1.242-2.969-2.834-3.194C12.923 1.999 10.69 0 8 0zm-.354 15.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 14.293V11h-1v3.293l-2.146-2.147a.5.5 0 0 0-.708.708l3 3z"/>
              </svg>
          </a>

          <button class="btn btn-secondary">New Paste
            <svg width="24" height="24" viewBox="0 0 20 20" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
              <path fill="#eee" d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
              <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
            </svg>
          </button>
        </span>
      </div>
    </div>

  </form>
</div>

<!-- For cloning -->
<div class="submit-form clone">
  <form class="well" method="post" action="/paste/create" @submit.prevent="encryptAndSendPaste()">

    <div class="d-flex justify-content-between">

      <div>
        <div class="file-upload">
          <button type="button" class="btn btn-info" @click.prevent="handleCancelClone()">Cancel clone</button>
        </div>
      </div>

      <div class="form-group select-date-clone paste-option">
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

    <div class="progress-container progress-clone">
      <div class="progress active" v-show="isLoading">
        <div class="progress-bar progress-bar-striped" role="progressbar"></div>
      </div>
    </div>

    <div>
      <textarea rows="10" style="width:100%;" class=" form-control" @keydown.ctrl.enter="encryptAndSendPaste()"
        id="content" name="content"></textarea>
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

    <div class="d-flex justify-content-between" v-if="displayBottomToolBar">>

      <div>
        <div class="file-upload">
          <button type="button" class="btn btn-info" @click.prevent="handleCancelClone()">Cancel clone</button>
        </div>
      </div>

      <div class="form-group select-date-clone paste-option">
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
  </form>
</div>


% rebase("base", settings=settings, pastes_count=pastes_count)
