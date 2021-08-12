import $ from 'jquery'

function removeFromArrayInput (el) {
  const input = $(el).siblings('input')

  if (input.attr('disabled') === 'disabled') {
    $(el).text('Remove').removeClass('can-undo')
    $(input).removeAttr('disabled')
    $(input).removeClass('text--strike')
  } else {
    $(el).text('Undo').addClass('can-undo')
    $(input).attr('disabled', 'disabled')
    $(input).addClass('text--strike')
  }
}

$(document).on('click', '.js-add-to-array-input', function (e) {
  e.preventDefault()

  if ($(this).hasClass('array-action--add')) {
    const original = $(this).parent()
    const clone = $(original).clone(true)
    const cloneId = `clone_${Math.floor((Math.random() * 100000) + 1)}`
    const input = $(clone).find('input')

    if ($(input).val() !== '') {
      $(original).find('input').removeClass('has-error')
      $(input).removeClass('has-error').attr('id', cloneId).val('')
      $(this).text('Remove').attr('class', 'array-action--remove js-remove-from-array-input')
      $(this).parent().parent().append($(clone))
      $(`#${cloneId}`).focus()
    } else {
      $(original).find('input').addClass('has-error').focus()
    }
  } else {
    removeFromArrayInput(this)
  }
})

$(document).on('click', '.js-remove-from-array-input', function (e) {
  e.preventDefault()
  removeFromArrayInput(this)
})
