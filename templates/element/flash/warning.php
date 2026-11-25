<?php
/**
 * @var \App\View\AppView $this
 * @var array $params
 * @var string $message
 */
echo $this->element('flash_bootstrap', [
    'message' => $message,
    'params' => $params,
    'variant' => 'warning',
    'icon' => 'fa-triangle-exclamation',
]);