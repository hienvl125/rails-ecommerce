const previewImageTemplate = (imageSrc) => `
<div class="relative">
  <button class="delete-preview-image-button absolute -top-2 -right-2 text-white bg-red-500 rounded-lg">
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
      <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
    </svg>            
  </button>
  <img src="${imageSrc}" alt="" class="w-auto h-20 rounded-lg">
</div>`

const imageUploaderTemplate = `
<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
  <path stroke-linecap="round" stroke-linejoin="round" d="M12 16.5V9.75m0 0 3 3m-3-3-3 3M6.75 19.5a4.5 4.5 0 0 1-1.41-8.775 5.25 5.25 0 0 1 10.233-2.33 3 3 0 0 1 3.758 3.848A3.752 3.752 0 0 1 18 19.5H6.75Z" />
</svg>
<p>Click to upload</p>`

document.addEventListener('turbo:load', () => {
  const previewImageInputs = document.querySelectorAll('.preview-image-input')

  if (!previewImageInputs || previewImageInputs.length < 1) return

  for (const previewImageInput of previewImageInputs) {
    previewImageInput.addEventListener('change', (fileUploadEvent) => {
      const file = fileUploadEvent.target.files[0]
      const imageUploaderId = fileUploadEvent.target.dataset['imageUploaderRef']
      const imageUploader = document.querySelector(imageUploaderId)

      if (file) {
        const reader = new FileReader()

        reader.onload = (readerEvt) => {
          imageUploader.firstElementChild.innerHTML = previewImageTemplate(readerEvt.target.result)
          document.querySelector(`${imageUploaderId} .delete-preview-image-button`).addEventListener('click', (clickEvent) => {
            clickEvent.preventDefault()
            fileUploadEvent.target.value = null;
            imageUploader.firstElementChild.innerHTML = imageUploaderTemplate
          })
        }
        reader.readAsDataURL(file)
      }
    })
  }
})
