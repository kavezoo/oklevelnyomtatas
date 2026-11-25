<?php
/**
 * Bootstrap / JeffAdmin flash doboz
 *
 * @var \App\View\AppView $this
 * @var array $params
 * @var string $message
 * @var string $variant success|danger|warning|info|secondary
 * @var string $icon Font Awesome ikon (pl. fa-circle-check)
 */
$variant = $variant ?? 'secondary';
$icon = $icon ?? 'fa-circle-info';
if (!isset($params['escape']) || $params['escape'] !== false) {
    $message = h($message);
}
?>
<div class="alert alert-<?= h($variant) ?> alert-dismissible fade show shadow smoketimer-flash" role="alert">
    <div class="d-flex align-items-center gap-2 w-100">
        <i class="fa-solid <?= h($icon) ?> smoketimer-flash__icon" aria-hidden="true"></i>
        <div class="smoketimer-flash__text flex-grow-1"><?= $message ?></div>
        <button type="button" class="btn-close flex-shrink-0" data-bs-dismiss="alert" aria-label="Bezárás"></button>
    </div>
</div>