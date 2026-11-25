<?php
/**
 * @var \Cake\View\View $this
 * @var string $controller
 * @var string $action
 * @var string $listSearch
 * @var string|null $listSort
 * @var string $listDirection
 */
$currentController = (string)($controller ?? $this->request->getParam('controller') ?? '');
$currentAction = (string)($action ?? $this->request->getParam('action') ?? '');
$isCrudIndex = $currentAction === 'index'
    && in_array($currentController, ['Registrations', 'People', 'Teams'], true);
$searchValue = (string)($listSearch ?? '');
$searchAutofocus = $isCrudIndex && $searchValue !== '';
$competitionId = (int)$this->request->getQuery('competition_id', 0);
?>
        <header class="header-desktop">
          <div class="section__content section__content--p30">
            <div class="container-fluid">
              <div class="header-wrap">
                <button class="sidebar-toggle js-sidebar-toggle" type="button" aria-label="Oldalsáv" aria-expanded="false" aria-controls="main-sidebar">
                  <i class="fa-solid fa-bars" aria-hidden="true"></i>
                </button>
<?php if ($isCrudIndex) : ?>
                <form class="form-header<?= $searchValue !== '' ? ' form-header--has-clear' : '' ?> smoketimer-header-search" role="search" method="get" action="<?= h($this->Url->build(['action' => 'index'])) ?>">
                  <i class="fa-solid fa-magnifying-glass form-header__icon" aria-hidden="true"></i>
                  <input
                    class="au-input au-input--xl js-index-search"
                    type="search"
                    name="search"
                    value="<?= h($searchValue) ?>"
                    placeholder="Keresés (név, csapat, Access ID, e-mail…) — Ctrl+K"
                    aria-label="Keresés a listában"
                    autocomplete="off"
                    <?= $searchAutofocus ? ' autofocus' : '' ?>
                  >
<?php if ($searchValue !== '') :
    $clearQuery = [];
    if ($competitionId > 0) {
        $clearQuery['competition_id'] = $competitionId;
    }
    if (!empty($listSort)) {
        $clearQuery['sort'] = (string)$listSort;
        $clearQuery['direction'] = (string)($listDirection ?? 'asc');
    }
?>
                  <a class="form-header__clear"
                     href="<?= h($this->Url->build(['action' => 'index', '?' => $clearQuery])) ?>"
                     data-bs-toggle="tooltip"
                     data-bs-title="Kereső törlése"
                     aria-label="Kereső törlése">
                    <i class="fa-solid fa-xmark form-header__clear-icon" aria-hidden="true"></i>
                  </a>
<?php endif; ?>
<?php if ($competitionId > 0) : ?>
                  <input type="hidden" name="competition_id" value="<?= (int)$competitionId ?>">
<?php endif; ?>
<?php if (!empty($listSort)) : ?>
                  <input type="hidden" name="sort" value="<?= h((string)$listSort) ?>">
                  <input type="hidden" name="direction" value="<?= h((string)($listDirection ?? 'asc')) ?>">
<?php endif; ?>
                  <kbd class="form-header__hint" aria-hidden="true">Ctrl+K</kbd>
                </form>
<?php else : ?>
                <div class="d-none d-md-flex flex-grow-1 ms-3 align-items-center">
                  <span class="text-muted"><?= h($this->fetch('title') ?: 'SmokeTimer') ?></span>
                </div>
<?php endif; ?>
              </div>
            </div>
          </div>
        </header>