<!DOCTYPE html>
<html lang="hu">
  <head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="SmokeTimer — oklevelek és Access import"/>
    <title><?= h($this->fetch('title') ?: 'SmokeTimer') ?></title>
    <?= $this->Html->css([
        'JeffAdmin./vendor/fontawesome-7.3.1/css/all.min',
        'JeffAdmin./vendor/bootstrap-5.3.8.min',
        'JeffAdmin./vendor/tom-select/css/tom-select.bootstrap5.min',
        'JeffAdmin./vendor/flatpickr/dist/flatpickr.min',
        'JeffAdmin./vendor/css-hamburgers/hamburgers.min',
        'JeffAdmin./vendor/sweetalert2/sweetalert2.min',
        'JeffAdmin./css/theme',
        'JeffAdmin./css/app',
        'JeffAdmin./css/main',
        'smoketimer',
    ]) ?>
    <?= $this->fetch('css') ?>
  </head>
  <body class="app">
    <a class="visually-hidden-focusable skip-link" href="#main-content">Ugrás a tartalomhoz</a>
    <div class="page-wrapper">
      <?= $this->element('JeffAdmin.header_top') ?>
      <?= $this->element('JeffAdmin.nav') ?>
      <div class="page-container">
        <?= $this->element('JeffAdmin.header') ?>
        <main class="main-content" id="main-content">
          <div class="section__content section__content--p30">
            <div class="container-fluid">
              <div class="smoketimer-flash-stack" aria-live="polite" aria-atomic="true">
                <?= $this->Flash->render() ?>
              </div>
              <?= $this->fetch('content') ?>
              <?= $this->element('JeffAdmin.footer') ?>
            </div>
          </div>
        </main>
      </div>
    </div>
    <?= $this->Html->script([
        'JeffAdmin./js/vanilla-utils',
        'JeffAdmin./vendor/bootstrap-5.3.8.bundle.min',
        'JeffAdmin./vendor/tom-select/js/tom-select.complete.min',
        'JeffAdmin./vendor/flatpickr/dist/flatpickr.min',
        'JeffAdmin./vendor/flatpickr/dist/l10n/hu',
        'JeffAdmin./vendor/sweetalert2/sweetalert2.min',
        'JeffAdmin./js/form-datetime-config',
        'JeffAdmin./js/form-datetime',
        'JeffAdmin./js/form-number-config',
        'JeffAdmin./js/number-spinner',
        'JeffAdmin./js/table-row-select',
        'JeffAdmin./js/table-row-dblclick',
        'smoketimer-confirm',
        'JeffAdmin./vendor/hugerte/hugerte.min',
        'JeffAdmin./js/bootstrap5-init',
        'JeffAdmin./js/main-vanilla',
        'JeffAdmin./js/modern-plugins',
    ]) ?>
    <?= $this->fetch('script') ?>
  </body>
</html>