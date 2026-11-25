/**
 * SmokeTimer — SweetAlert2 megerősítés (postLink + űrlap submit gombok).
 * A CakePHP `confirm` opció natív confirm()-ot ír az onclick-be — induláskor lecsupaszítjuk.
 */
(function (window, document) {
  const RED = '#dc3545';
  const RED_DARK = '#b02a37';
  const GRAY = '#6c757d';
  const ATTR = 'data-smoketimer-confirmed';

  const stripNativeConfirm = () => {
    document.querySelectorAll('[data-confirm-message]').forEach((el) => {
      el.removeAttribute('onclick');
    });
  };

  const resolveForm = (el) => {
    if (el.form instanceof HTMLFormElement) {
      const submitter =
        el.tagName === 'BUTTON' || (el.tagName === 'INPUT' && el.type === 'submit')
          ? el
          : undefined;
      return { form: el.form, submitter };
    }

    const formId = el.getAttribute('form') || el.getAttribute('data-confirm-form');
    if (formId) {
      const byId = document.getElementById(formId);
      if (byId instanceof HTMLFormElement) {
        return { form: byId, submitter: el.tagName === 'BUTTON' ? el : undefined };
      }
    }

    const onclick = el.getAttribute('onclick') || '';
    const match = onclick.match(/document\.([A-Za-z0-9_]+)\.requestSubmit/);
    if (match) {
      const named = document[match[1]];
      if (named instanceof HTMLFormElement) {
        return { form: named, submitter: undefined };
      }
    }

    let prev = el.previousElementSibling;
    while (prev) {
      if (prev.tagName === 'FORM') {
        return { form: prev, submitter: undefined };
      }
      prev = prev.previousElementSibling;
    }

    const closest = el.closest('form');
    if (closest instanceof HTMLFormElement) {
      const submitter = el.tagName === 'BUTTON' ? el : undefined;
      return { form: closest, submitter };
    }

    return null;
  };

  const askSweetAlert = (el) => {
    const message = el.getAttribute('data-confirm-message') || '';
    const title = el.getAttribute('data-swal-title') || 'Biztosan?';
    const text = el.getAttribute('data-swal-text') || message || 'A művelet nem vonható vissza.';
    const confirmText = el.getAttribute('data-swal-confirm') || 'Igen';
    const cancelText = el.getAttribute('data-swal-cancel') || 'Mégse';
    const Swal = window.Swal;

    if (typeof Swal === 'undefined') {
      // eslint-disable-next-line no-alert
      return Promise.resolve(window.confirm(text || message || title));
    }

    return Swal.fire({
      title,
      text,
      icon: 'warning',
      iconColor: RED,
      showCancelButton: true,
      focusCancel: true,
      reverseButtons: true,
      confirmButtonText: confirmText,
      cancelButtonText: cancelText,
      confirmButtonColor: RED,
      cancelButtonColor: GRAY,
      customClass: {
        popup: 'swal2-jeffadmin-delete',
        confirmButton: 'swal2-jeffadmin-delete__confirm',
        cancelButton: 'swal2-jeffadmin-delete__cancel',
      },
      didOpen: (popup) => {
        const confirmBtn = popup.querySelector('.swal2-confirm');
        if (confirmBtn) {
          confirmBtn.style.backgroundColor = RED;
          confirmBtn.style.borderColor = RED_DARK;
        }
      },
    }).then((result) => result.isConfirmed === true);
  };

  const submitAfterConfirm = (el) => {
    const resolved = resolveForm(el);
    if (!resolved || typeof resolved.form.requestSubmit !== 'function') {
      return;
    }
    if (resolved.submitter) {
      resolved.submitter.setAttribute(ATTR, '1');
      resolved.form.requestSubmit(resolved.submitter);
    } else {
      resolved.form.setAttribute(ATTR, '1');
      resolved.form.requestSubmit();
    }
  };

  const onConfirmableClick = (event) => {
    const el = event.target.closest('[data-confirm-message]');
    if (!el || el.classList.contains('is-disabled') || el.getAttribute('aria-disabled') === 'true') {
      return;
    }
    if (el.getAttribute(ATTR) === '1') {
      el.removeAttribute(ATTR);
      return;
    }

    event.preventDefault();
    event.stopImmediatePropagation();

    askSweetAlert(el).then((ok) => {
      if (!ok) {
        return;
      }
      submitAfterConfirm(el);
    });
  };

  const onFormSubmit = (event) => {
    const form = event.target;
    if (!(form instanceof HTMLFormElement)) {
      return;
    }
    if (form.getAttribute(ATTR) === '1') {
      form.removeAttribute(ATTR);
      return;
    }

    const submitter = event.submitter;
    if (!submitter || !submitter.hasAttribute('data-confirm-message')) {
      return;
    }
    if (submitter.getAttribute(ATTR) === '1') {
      submitter.removeAttribute(ATTR);
      return;
    }

    event.preventDefault();
    event.stopImmediatePropagation();

    askSweetAlert(submitter).then((ok) => {
      if (!ok) {
        return;
      }
      submitter.setAttribute(ATTR, '1');
      form.requestSubmit(submitter);
    });
  };

  const init = () => {
    stripNativeConfirm();
    document.addEventListener('click', onConfirmableClick, true);
    document.addEventListener('submit', onFormSubmit, true);
  };

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})(window, document);