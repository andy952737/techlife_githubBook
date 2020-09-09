# Rails 運用 Ckeditor v1.0

# Code 
```
Controller: Backend::CkeditorController

  #CMS上傳圖片專用
  def ck_upload
     @CkeditorPicture = CkeditorPicture.new
     @CkeditorPicture.name = params[:upload]

     # render :inline <= 新版Rails 5.1.6以上版本
     render :inline => "<script>window.parent.CKEDITOR.tools.callFunction(#{params[:CKEditorFuncNum]},\"#{@CkeditorPicture.name}\")</script>"
     return
  end

Model: CkeditorPicture
    mount_uploader :name, ImageUploader

Views:

<style>
    #cke_1_contents {
        height: 600px !important;
    }
</style>

/* 使用 ckeditor套件 */
<script type="text/javascript" src="/tools/ckeditor/ckeditor.js"></script>
<script src="/tools/ckeditor/plugins/image/dialogs/image.js" type="text/javascript"></script>

<textarea id="editor1" name="post[contact]" class="form-control ckeditor"></textarea>
<script type="text/javascript">
    atk = document.getElementsByName("authenticity_token")[0].value;
    _pa = '?authenticity_token=' + atk;
    CKEDITOR.replace('editor1', {
        filebrowserUploadUrl : '/backend/ckeditor/ck_upload' + _pa,
    });
</script>

Routes:
resources :ckeditor do
    #root to: :inde
    collection do
        match :ck_upload,via: [:get, :post]
    end
end
```